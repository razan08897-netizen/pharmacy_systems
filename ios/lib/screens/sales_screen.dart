import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
// استيراد الموديلات والخدمات الحقيقية والمطابقة 100% لملفات مشروعك والخلاصة
import '../models/customer.dart';
import '../models/sale_invoice.dart';
import '../models/batch.dart';
import '../models/product.dart';
import '../services/sale_service.dart';
import '../services/customer_debt_service.dart';

class SalesScreen extends StatefulWidget {
  final Isar
      isar; // تمرير كائن Isar المفتوح لضمان استقرار العمليات المحلية أوفلاين

  const SalesScreen({super.key, required this.isar});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final _formKey = GlobalKey<FormState>();

  late SaleService _saleService;
  late CustomerDebtService _customerDebtService;

  // متحكمات رأس الفاتورة
  final TextEditingController _customerSearchController =
      TextEditingController();
  String _invoiceType = 'نقدي'; // نقدي / آجل
  Customer? _selectedCustomer; // كائن العميل الحقيقي من جدول Customer
  List<Customer> _allCustomers =
      []; // قائمة العملاء الكاملة المحملة للبحث أوفلاين السريع
  List<Customer> _customerSuggestions =
      []; // مقترحات العملاء تصفى أثناء الكتابة

  // متحكمات إدخال المادة الحالية في الواجهة
  final TextEditingController _productSearchController =
      TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _salePriceController = TextEditingController();
  final TextEditingController _discountController =
      TextEditingController(); // خصم الفاتورة الكلي

  // متغيرات تتبع الصنف والباتش المختار حياً
  Map<String, dynamic>?
      _selectedBatchData; // يحتوي على كائن الصنف وكائن الباتش معاً
  List<Map<String, dynamic>> _batchSuggestions =
      []; // مقترحات الأصناف والباتشات المتوفرة على الرف
  String _selectedUnit = 'باكت'; // الوحدة المختارة للبيع: باكت / تجزئة
  double _currentCostPrice =
      0.0; // التكلفة الفعلية للباتش المختار (حارس الأمان لمنع الخسارة)

  // القائمة الوسيطة الحقيقية المعتمدة في السيرفيس لاستقبل عناصر الشاشة قبل الترحيل
  final List<SaleItemInput> _uiSaleItems = [];
  double _invoiceDiscountAmount = 0.0; // قيمة الخصم المالي الكلي للفاتورة

  @override
  void initState() {
    super.initState();
    // تهيئة الخدمات الحقيقية الممرر لها كائن Isar الخاص بالمشروع
    _saleService = SaleService(widget.isar);
    _customerDebtService = CustomerDebtService(widget.isar);

    _loadCustomersData(); // جلب العملاء مسبقاً للبحث السريع الفوري أوفلاين
    _discountController.text = "0";
  }

  // جلب العملاء من السيرفيس المعتمد الخاص بك لسرعة التصفية أوفلاين
  void _loadCustomersData() async {
    final customers = await _customerDebtService.getAllCustomers();
    setState(() {
      _allCustomers = customers;
    });
  }

  @override
  void dispose() {
    _customerSearchController.dispose();
    _productSearchController.dispose();
    _quantityController.dispose();
    _salePriceController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  // 1. مرحلة البحث والاختيار (البحث الحي أثناء الكتابة للمواد والباتشات المتوفرة)
  void _searchBatchesLive(String query) async {
    if (query.length < 2) {
      setState(() => _batchSuggestions = []);
      return;
    }
    // استدعاء دالتك الذكية التي تدمج الصنف مع الباتشات المتوفرة أكبر من صفر
    final results = await _saleService.searchAvailableBatches(query);
    setState(() {
      _batchSuggestions = results;
    });
  }

  // نظام تصفية العملاء الحي المعتمد على القائمة المحملة أوفلاين
  void _filterCustomersLive(String query) {
    if (query.length < 2) {
      setState(() => _customerSuggestions = []);
      return;
    }
    setState(() {
      _customerSuggestions = _allCustomers
          .where((c) => c.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // عند قيام الصيدلي باختيار السطر المطابق للعلبة التي بيده من الاقتراحات
  void _onBatchSelected(Map<String, dynamic> data) {
    final Product product = data['product'];
    final Batch batch = data['batch'];

    setState(() {
      _selectedBatchData = data;
      // عرض النص للصيدلي: اسم الصنف - الباتش
      _productSearchController.text =
          "${product.productName} (باتش: ${batch.batchNumber})";
      _batchSuggestions = []; // إغلاق قائمة الاقتراحات فوراً لراحة الواجهة

      // احتساب الأسعار الذكية الافتراضية بناءً على نسبة الربح 25% المحددة في الدستور
      if (_selectedUnit == 'باكت') {
        _salePriceController.text = batch.packSalePrice.toStringAsFixed(2);
        _currentCostPrice = batch.purchasePriceCost; // حارس الأمان للباكت
      } else {
        _salePriceController.text = batch.unitSalePrice.toStringAsFixed(2);
        _currentCostPrice = batch.unitCostPrice; // حارس الأمان للحبة/التجزئة
      }
    });
  }

  // تحديث الأسعار تلقائياً عند تغيير نوع الوحدة (باكت / تجزئة)
  void _updatePriceBasedOnUnit(String? newUnit) {
    if (newUnit == null || _selectedBatchData == null) return;
    final Batch batch = _selectedBatchData!['batch'];

    setState(() {
      _selectedUnit = newUnit;
      if (_selectedUnit == 'باكت') {
        _salePriceController.text = batch.packSalePrice.toStringAsFixed(2);
        _currentCostPrice = batch.purchasePriceCost;
      } else {
        _salePriceController.text = batch.unitSalePrice.toStringAsFixed(2);
        _currentCostPrice = batch.unitCostPrice;
      }
    });
  }

  // 2. مرحلة التعبئة واحتساب السعر الذكي والتحقق الصارم من الكميات المتوفرة (Validation)
  void _addItemToSalesList() {
    if (_selectedBatchData == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'خطأ: يرجى اختيار صنف وباتش محدد من قائمة الاقتراحات أولاً!')),
      );
      return;
    }

    final Product product = _selectedBatchData!['product'];
    final Batch batch = _selectedBatchData!['batch'];
    final int qtyRequested = int.tryParse(_quantityController.text) ?? 0;
    final double enteredSalePrice =
        double.tryParse(_salePriceController.text) ?? 0.0;

    if (qtyRequested <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى تحديد كمية بيع أكبر من صفر.')),
      );
      return;
    }

    // [شرط الأمان الصارم]: منع البيع بأقل من سعر التكلفة الحقيقي للباتش لحماية الصيدلية من الخسارة يدوياً
    if (enteredSalePrice < _currentCostPrice) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              '🚫 تحذير أمان: لا يمكن البيع بأقل من سعر التكلفة الفعلي للباتش ($_currentCostPrice ريال)!'),
          backgroundColor: Colors.red.shade700,
        ),
      );
      return;
    }

    // [شرط منع البيع بالسالب التام]: تحويل الكمية المطلوبة لأصغر وحدة والمقارنة مع المتاح في هذا الباتش تحديداً
    int requestedInSubUnits = qtyRequested;
    if (_selectedUnit == 'باكت') {
      requestedInSubUnits = qtyRequested * product.conversionFactor;
    }

    if (requestedInSubUnits > batch.availableQuantity) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              '❌ رصيد غير كافٍ! الكمية المتاحة في هذا الباتش هي ${batch.availableQuantity} حبة فقط على الرف.'),
          backgroundColor: Colors.orange.shade900,
        ),
      );
      return;
    }

    // فحص إذا كان الصنف مضافاً مسبقاً في نفس الفاتورة لتجنب التكرار وجمع الكميات
    bool isAlreadyInList = false;
    for (var item in _uiSaleItems) {
      if (item.batchId == batch.id && item.unitUsed == _selectedUnit) {
        // التحقق من الكمية الكلية بعد الإضافة الإضافية
        int totalNewInSubUnits = requestedInSubUnits;
        if (item.unitUsed == 'باكت') {
          totalNewInSubUnits += (item.quantitySold * product.conversionFactor);
        } else {
          totalNewInSubUnits += item.quantitySold;
        }

        if (totalNewInSubUnits > batch.availableQuantity) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    '❌ مجموع الكميات المضافة لهذا الباتش يتجاوز المتوفر في الرف!')),
          );
          return;
        }

        item.quantitySold += qtyRequested;
        isAlreadyInList = true;
        break;
      }
    }

    if (!isAlreadyInList) {
      // إدراج المادة في القائمة الوسيطة المطابقة تماماً لكائن الـ Service
      setState(() {
        _uiSaleItems.add(
          SaleItemInput()
            ..productId = product.id
            ..batchId = batch.id
            ..quantitySold = qtyRequested
            ..unitUsed = _selectedUnit
            ..salePrice = enteredSalePrice,
        );
      });
    }

    setState(() {
      _clearProductInputFields();
    });
  }

  void _clearProductInputFields() {
    _productSearchController.clear();
    _quantityController.clear();
    _salePriceController.clear();
    _selectedBatchData = null;
    _batchSuggestions = [];
  }

  // حساب إجمالي مبالغ الأصناف التراكمي قبل الخصم
  double get _calculatedTotalBeforeDiscount {
    return _uiSaleItems.fold(
        0.0, (sum, item) => sum + (item.quantitySold * item.salePrice));
  }

  // حساب الصافي النهائي المعتمد على معادلة الدستور: (الإجمالي - قيمة الخصم)
  double get _calculatedNetAmount {
    double total = _calculatedTotalBeforeDiscount;
    double net = total - _invoiceDiscountAmount;
    return net < 0 ? 0.0 : net;
  }

  // 3. التأثيرات النهائية الفورية عند "الحفظ والترحيل المحلي" قطعيّاً
  void _submitAndSaveInvoice() async {
    if (!_formKey.currentState!.validate()) return;
    if (_uiSaleItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'خطأ تجاري: لا يمكن ترحيل فاتورة مبيعات فارغة بدون مواد.')),
      );
      return;
    }

    if (_invoiceType == 'آجل' && _selectedCustomer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'خطأ أمان: الفاتورة الآجلة تتطلب تحديد اسم عميل معتمد ومسجل في النظام.')),
      );
      return;
    }

    try {
      // استدعاء دالة البيع الكبرى والنهائية في SaleService لتعديل المخزن، ضخ الكاش، أو تعديل رصيد العميل
      await _saleService.saveSaleInvoice(
        invoiceType: _invoiceType,
        customerId: _selectedCustomer?.id,
        inputItems: _uiSaleItems,
        totalBeforeDiscount: _calculatedTotalBeforeDiscount,
        discountAmount: _invoiceDiscountAmount,
        netAmount: _calculatedNetAmount,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                '🎉 تم حفظ وتأكيد فاتورة المبيعات وتحديث الأرصدة والمخزن بنجاح الفوري أوفلاين!')),
      );

      setState(() {
        _uiSaleItems.clear();
        _customerSearchController.clear();
        _discountController.text = "0";
        _invoiceDiscountAmount = 0.0;
        _selectedCustomer = null;
      });

      _loadCustomersData(); // تحديث أرصدة العملاء بعد البيع الآجل
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('فشل ترحيل المبيعات: $e'),
            backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('شاشة مبيعات الصيدلية الذكية الفورية'),
          backgroundColor: Colors.blueGrey.shade800,
          foregroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  'وضعية التشغيل: أوفلاين 🟢',
                  style: TextStyle(
                      color: Colors.green.shade300,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // قسيمة رأس الفاتورة (نوع الفاتورة والعميل)
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _invoiceType,
                            items: ['نقدي', 'آجل'].map((type) {
                              return DropdownMenuItem(
                                  value: type, child: Text(type));
                            }).toList(),
                            onChanged: (val) =>
                                setState(() => _invoiceType = val!),
                            decoration: const InputDecoration(
                                labelText: 'نوع الفاتورة المالي',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _customerSearchController,
                            decoration: InputDecoration(
                              labelText: 'اسم الزبون / الحساب (مطلوب في الآجل)',
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.person,
                                  color: Colors.blueGrey),
                              suffixIcon: _selectedCustomer != null
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : null,
                            ),
                            onChanged: _filterCustomersLive,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // منبثق مقترحات حسابات العملاء الحية
                if (_customerSuggestions.isNotEmpty)
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    elevation: 4,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _customerSuggestions.length,
                      itemBuilder: (context, idx) {
                        final cust = _customerSuggestions[idx];
                        return ListTile(
                          title: Text(cust.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              'الرصيد/المديونية الحالية له: ${cust.currentBalance} ريال يمني'),
                          onTap: () {
                            setState(() {
                              _selectedCustomer = cust;
                              _customerSearchController.text = cust.name;
                              _customerSuggestions = [];
                            });
                          },
                        );
                      },
                    ),
                  ),

                const SizedBox(height: 12),

                // لوحة البحث الذكي بالباتشات والكميات المتاحة وإدخال المادة
                Card(
                  color: Colors.blueGrey.shade50.withOpacity(0.3),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                controller: _productSearchController,
                                decoration: const InputDecoration(
                                  labelText:
                                      'ابحث باسم الدواء أو الباركود لقراءة الباتش الفعلي للعلبة...',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.search,
                                      color: Colors.blueGrey),
                                ),
                                onChanged: _searchBatchesLive,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _selectedUnit,
                                items: ['باكت', 'تجزئة'].map((unit) {
                                  return DropdownMenuItem(
                                      value: unit, child: Text(unit));
                                }).toList(),
                                onChanged: _updatePriceBasedOnUnit,
                                decoration: const InputDecoration(
                                    labelText: 'وحدة البيع',
                                    border: OutlineInputBorder()),
                              ),
                            ),
                          ],
                        ),

                        // منبثق مقترحات الباتشات الذكية المطابق للشرط المذكور بالدستور
                        if (_batchSuggestions.isNotEmpty)
                          Card(
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _batchSuggestions.length,
                              itemBuilder: (context, idx) {
                                final item = _batchSuggestions[idx];
                                final Product prod = item['product'];
                                final Batch bat = item['batch'];

                                // عرض صيغة الانتهاء والكمية بخط صغير لتسهيل المطابقة للصيدلي
                                final String expiryStr =
                                    "${bat.expiryDate.month}/${bat.expiryDate.year.toString().substring(2)}";

                                return ListTile(
                                  leading: const Icon(Icons.medication_outlined,
                                      color: Colors.teal),
                                  title: Text(prod.productName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                    "الباتش: ${bat.batchNumber}  |  الانتهاء: $expiryStr  |  المتوفر بالرف: ${bat.availableQuantity} حبة",
                                    style: const TextStyle(
                                        color: Colors.purple,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  trailing: Text(
                                      'باكت: ${bat.packSalePrice} ر.ي\nحبة: ${bat.unitSalePrice} ر.ي',
                                      textAlign: TextAlign.left),
                                  onTap: () => _onBatchSelected(item),
                                );
                              },
                            ),
                          ),

                        const SizedBox(height: 12),

                        // مدخلات الكمية والأسعار الفورية للصنف الحالي
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _quantityController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    labelText: 'الكمية المطلوبة',
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: _salePriceController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'سعر البيع الفعلي',
                                  border: OutlineInputBorder(),
                                  suffixText: 'ر.ي',
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton.icon(
                              onPressed: _addItemToSalesList,
                              icon: const Icon(Icons.add_shopping_cart,
                                  color: Colors.white),
                              label: const Text('إدراج بالفاتورة',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal.shade700,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 24),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // جدول مراجعة وعرض المواد المدرجة في الفاتورة الحالية للمريض
                Expanded(
                  child: Card(
                    elevation: 1,
                    child: _uiSaleItems.isEmpty
                        ? const Center(
                            child: Text(
                                'سلة المبيعات فارغة حالياً. يرجى إدراج أدوية.',
                                style: TextStyle(color: Colors.grey)))
                        : ListView.builder(
                            itemCount: _uiSaleItems.length,
                            itemBuilder: (context, index) {
                              final item = _uiSaleItems[index];
                              double totalItemPrice =
                                  item.quantitySold * item.salePrice;
                              return ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colors.blueGrey.shade100,
                                    child: Text('${index + 1}')),
                                title: Text(
                                    _productSearchController.text.isNotEmpty &&
                                            _uiSaleItems.indexOf(item) ==
                                                _uiSaleItems.length - 1
                                        ? _productSearchController.text
                                            .split(' (باتش:')[0]
                                        : 'صنف مدرج رقم ${item.productId}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    'الكمية: ${item.quantitySold} ${item.unitUsed} | سعر البيع: ${item.salePrice} ريال'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        '${totalItemPrice.toStringAsFixed(2)} ر.ي',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    IconButton(
                                      icon: const Icon(Icons.delete_sweep,
                                          color: Colors.red),
                                      onPressed: () {
                                        setState(() {
                                          _uiSaleItems.removeAt(index);
                                        });
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ),

                const SizedBox(height: 12),

                // لوحة التحكم المالي السفلي والخصومات والترحيل النهائي القطعي
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade900,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'الإجمالي قبل الخصم: ${_calculatedTotalBeforeDiscount.toStringAsFixed(2)} ر.ي',
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Text('خصم مالي كلي:',
                                    style: TextStyle(color: Colors.white70)),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: 100,
                                  height: 45,
                                  child: TextFormField(
                                    controller: _discountController,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold),
                                    decoration: const InputDecoration(
                                      fillColor:
                                          Color.fromARGB(255, 40, 62, 83),
                                      filled: true,
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        _invoiceDiscountAmount =
                                            double.tryParse(val) ?? 0.0;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(color: Colors.white24, height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الصافي النهائي للمدفوع: ${_calculatedNetAmount.toStringAsFixed(2)} ريال يمني',
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent),
                          ),
                          ElevatedButton.icon(
                            onPressed: _submitAndSaveInvoice,
                            icon: const Icon(Icons.check_circle_outline,
                                color: Colors.white),
                            label: const Text('ترحيل وتأكيد البيع القطعي ✔',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal.shade600,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 28),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
