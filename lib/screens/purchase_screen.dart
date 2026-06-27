import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
// استيراد الموديلات والخدمات الحقيقية والمطابقة 100% لملفات مشروعك
import '../models/product.dart';
import '../models/supplier.dart';
import '../models/purchase_invoice.dart';
import '../services/purchase_service.dart';
import '../services/supplier_debt_service.dart'; // السيرفيس الجديد المعتمد للموردين

class PurchaseScreen extends StatefulWidget {
  final Isar isar; // تمرير كائن Isar المفتوح لضمان استقرار العمليات

  const PurchaseScreen({super.key, required this.isar});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final _formKey = GlobalKey<FormState>();

  late PurchaseService _purchaseService;
  late SupplierDebtService
      _supplierDebtService; // تعريف السيرفيس المعتمد للموردين

  // متحكمات رأس الفاتورة
  final TextEditingController _invoiceNumberController =
      TextEditingController();
  final TextEditingController _supplierSearchController =
      TextEditingController();

  String _invoiceType = 'نقدي'; // نقدي / آجل
  Supplier? _selectedSupplier; // كائن المورد الحقيقي من جدول Supplier
  List<Supplier> _allSuppliers = []; // قائمة الموردين الكاملة المحملة من النظام
  List<Supplier> _supplierSuggestions =
      []; // مقترحات الموردين تصفى أثناء الكتابة

  // متحكمات إدخال المادة الحالية في الواجهة
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _mainUnitController = TextEditingController();
  final TextEditingController _subUnitController = TextEditingController();
  final TextEditingController _conversionFactorController =
      TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _bonusController = TextEditingController();
  final TextEditingController _purchasePriceController =
      TextEditingController();
  final TextEditingController _suggestedSalePriceController =
      TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  bool _canBeSegmented = true;
  Product? _selectedProduct; // الصنف الحقيقي المختار من الدليل
  List<Product> _productSuggestions = []; // مقترحات الأصناف من الدليل

  // القائمة الوسيطة الحقيقية المعتمدة في السيرفيس لاستقبال عناصر الشاشة
  final List<PurchaseItemInput> _uiInputItems = [];

  @override
  void initState() {
    super.initState();
    // تهيئة الخدمات الحقيقية الممرر لها كائن Isar الخاص بالمشروع
    _purchaseService = PurchaseService(widget.isar);
    _supplierDebtService = SupplierDebtService(widget.isar); // تهيئة حقيقية

    _loadSuppliersData(); // جلب الموردين مسبقاً للبحث السريع أوفلاين

    _mainUnitController.text = "باكت";
    _subUnitController.text = "حبة";
    _conversionFactorController.text = "10";
  }

  // جلب الموردين من السيرفيس المعتمد الخاص بك
  void _loadSuppliersData() async {
    final suppliers = await _supplierDebtService.getAllSuppliers();
    setState(() {
      _allSuppliers = suppliers;
    });
  }

  @override
  void dispose() {
    _invoiceNumberController.dispose();
    _supplierSearchController.dispose();
    _productNameController.dispose();
    _mainUnitController.dispose();
    _subUnitController.dispose();
    _conversionFactorController.dispose();
    _quantityController.dispose();
    _bonusController.dispose();
    _purchasePriceController.dispose();
    _suggestedSalePriceController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  // 1. نظام البحث السريع الحي في جدول المنتجات الحقيقي
  void _searchProductsLive(String query) async {
    if (query.length < 2) {
      setState(() => _productSuggestions = []);
      return;
    }
    final results = await _purchaseService.searchProducts(query);
    setState(() {
      _productSuggestions = results;
      if (results.isEmpty) {
        _selectedProduct = null; // صنف جديد يكتبه الصيدلي لأول مرة
      }
    });
  }

  // نظام تصفية الموردين الحي المعتمد على القائمة المحملة من السيرفيس الخاص بك
  void _filterSuppliersLive(String query) {
    if (query.length < 2) {
      setState(() => _supplierSuggestions = []);
      return;
    }
    setState(() {
      _supplierSuggestions = _allSuppliers
          .where((s) => s.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // عند اختيار صنف معرف مسبقاً في النظام من قائمة المقترحات
  void _onProductSelected(Product product) {
    setState(() {
      _selectedProduct = product;
      _productNameController.text = product.productName;
      _mainUnitController.text = product.mainUnit;
      _subUnitController.text = product.subUnit ?? '';
      _canBeSegmented = product.canBeSegmented;
      _conversionFactorController.text = product.conversionFactor.toString();
      _productSuggestions = []; // إغلاق المقترحات
    });
  }

  // 2. إدراج الصنف المدخل في القائمة الوسيطة المعتمدة
  void _addItemToInvoiceList() {
    if (_productNameController.text.isEmpty ||
        _quantityController.text.isEmpty ||
        _purchasePriceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'الرجاء إدخال بيانات الصنف الأساسية (الاسم، الكمية، سعر الشراء)')),
      );
      return;
    }

    // تجهيز كائن مدخلات حقيقي مطابق تماماً لكائن الـ Service
    final inputItem = PurchaseItemInput()
      ..productId =
          _selectedProduct?.id // يكون null إذا كان صنفاً جديداً تماماً
      ..productName = _productNameController.text
      ..mainUnit = _mainUnitController.text
      ..canBeSegmented = _canBeSegmented
      ..conversionFactor = int.tryParse(_conversionFactorController.text) ?? 1
      ..subUnit =
          _subUnitController.text.isEmpty ? null : _subUnitController.text
      ..quantityPurchased = int.tryParse(_quantityController.text) ?? 0
      ..bonusQuantity = int.tryParse(_bonusController.text) ?? 0
      ..purchasePrice = double.tryParse(_purchasePriceController.text) ?? 0.0
      ..suggestedPackSalePrice =
          double.tryParse(_suggestedSalePriceController.text) ?? 0.0;

    // معالجة التاريخ المدخل MM/YY وتحويله لـ DateTime متوافق مع الحقل الحقيقي
    String dateStr = _expiryDateController.text.trim();
    if (dateStr.contains('/')) {
      final parts = dateStr.split('/');
      int month = int.tryParse(parts[0]) ?? 1;
      int year = int.tryParse(parts[1]) ?? 26;
      inputItem.expiryDate = DateTime(2000 + year, month, 1);
    } else {
      inputItem.expiryDate = DateTime.now()
          .add(const Duration(days: 365)); // تاريخ افتتاحي أمان إذا لم يدخل
    }

    setState(() {
      _uiInputItems.add(inputItem);
      _clearProductInputFields();
    });
  }

  void _clearProductInputFields() {
    _productNameController.clear();
    _quantityController.clear();
    _bonusController.clear();
    _purchasePriceController.clear();
    _suggestedSalePriceController.clear();
    _expiryDateController.clear();
    _selectedProduct = null;
    _productSuggestions = [];
  }

  // حساب إجمالي الفاتورة المالي التراكمي لعرضه في لوحة الإجماليات
  double get _calculatedTotalAmount {
    return _uiInputItems.fold(0.0,
        (sum, item) => sum + (item.quantityPurchased * item.purchasePrice));
  }

  // 3. التدوير والترحيل النهائي الفوري لقاعدة البيانات عبر الـ Service الحقيقية
  void _submitAndSaveInvoice() async {
    if (!_formKey.currentState!.validate()) return;
    if (_uiInputItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('خطأ: لا يمكن ترحيل فاتورة فارغة بدون مواد.')),
      );
      return;
    }

    if (_invoiceType == 'آجل' && _selectedSupplier == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'خطأ أمان: الفاتورة الآجلة تتطلب تحديد مورد معتمد من النظام.')),
      );
      return;
    }

    try {
      // استدعاء دالتك الكبرى في PurchaseService مع تمرير كافة المتغيرات الحقيقية المتطابقة
      await _purchaseService.savePurchaseInvoice(
        supplierInvoiceNo: _invoiceNumberController.text,
        purchaseType: _invoiceType,
        supplierId: _selectedSupplier?.id,
        inputItems: _uiInputItems,
        totalInvoiceAmount: _calculatedTotalAmount,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'تم ترحيل الفاتورة، تدوير الباتشات، وتحديث حسابات الصندوق بنجاح تام!')),
      );

      setState(() {
        _uiInputItems.clear();
        _invoiceNumberController.clear();
        _supplierSearchController.clear();
        _selectedSupplier = null;
      });

      _loadSuppliersData(); // إعادة تحديث بيانات الأرصدة للموردين بعد الفاتورة الجديدة
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('فشل الترحيل المحاسبي: $e'),
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
          title: const Text('فاتورة المشتريات والمدخلات الذكية'),
          backgroundColor: Colors.teal.shade800,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // قسيمة رأس الفاتورة
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _invoiceNumberController,
                            decoration: const InputDecoration(
                              labelText: 'رقم فاتورة المورد (المرجع القانوني)',
                              border: OutlineInputBorder(),
                              prefixIcon:
                                  Icon(Icons.assignment, color: Colors.teal),
                            ),
                            validator: (val) => val!.isEmpty
                                ? 'هذا الحقل إجباري لتوثيق الباتشات'
                                : null,
                          ),
                        ),
                        const SizedBox(width: 16),
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
                                labelText: 'طبيعة الفاتورة ماليّاً',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _supplierSearchController,
                            decoration: InputDecoration(
                              labelText: 'اسم الشركة / المورد للمطابقة',
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.business,
                                  color: Colors.teal),
                              suffixIcon: _selectedSupplier != null
                                  ? const Icon(Icons.verified,
                                      color: Colors.green)
                                  : null,
                            ),
                            onChanged: _filterSuppliersLive,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // منبثق نتائج الموردين الحية (مستمدة من سيرفيس الموردين المعتمد الخاص بك)
                if (_supplierSuggestions.isNotEmpty)
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    elevation: 4,
                    color: Colors.white,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _supplierSuggestions.length,
                      itemBuilder: (context, idx) {
                        final supp = _supplierSuggestions[idx];
                        return ListTile(
                          title: Text(supp.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              'الرصيد المالي الحالي المتبقي له: ${supp.currentBalance} ريال'),
                          onTap: () {
                            setState(() {
                              _selectedSupplier = supp;
                              _supplierSearchController.text = supp.name;
                              _supplierSuggestions = [];
                            });
                          },
                        );
                      },
                    ),
                  ),

                const SizedBox(height: 12),

                // قسم بناء وإدخال الصنف الذكي
                Card(
                  color: Colors.teal.shade50.withOpacity(0.2),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                controller: _productNameController,
                                decoration: InputDecoration(
                                  labelText:
                                      'اسم الدواء (تجاري وعلمي) - ابدأ الكتابة للبحث الحي',
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(Icons.medication,
                                      color: Colors.teal),
                                  suffixIcon: _selectedProduct == null &&
                                          _productNameController.text.isNotEmpty
                                      ? const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Text('صنف جديد سيؤسس تلقائياً',
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      : null,
                                ),
                                onChanged: _searchProductsLive,
                              ),
                            ),
                            if (_selectedProduct == null) ...[
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextFormField(
                                  controller: _mainUnitController,
                                  decoration: const InputDecoration(
                                      labelText: 'الوحدة الكبرى',
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextFormField(
                                  controller: _subUnitController,
                                  decoration: const InputDecoration(
                                      labelText: 'الوحدة الصغرى',
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Row(
                                children: [
                                  const Text('يتجزأ؟'),
                                  Checkbox(
                                    value: _canBeSegmented,
                                    onChanged: (val) =>
                                        setState(() => _canBeSegmented = val!),
                                  ),
                                ],
                              ),
                            ]
                          ],
                        ),

                        // منبثق مقترحات الأصناف الحية
                        if (_productSuggestions.isNotEmpty)
                          Card(
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              children: _productSuggestions.map((p) {
                                return ListTile(
                                  leading: const Icon(Icons.history_toggle_off,
                                      color: Colors.teal),
                                  title: Text(p.productName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      'معامل التحويل المسجل: ${p.conversionFactor} | الوحدة الكبرى: ${p.mainUnit}'),
                                  onTap: () => _onProductSelected(p),
                                );
                              }).toList(),
                            ),
                          ),

                        const SizedBox(height: 12),

                        // بيانات الكميات والأسعار الحساسة للباتش
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _quantityController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    labelText: 'الالكمية المشتراة',
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: _bonusController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    labelText: 'البونص المجاني',
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: _purchasePriceController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    labelText: 'سعر شراء العلبة',
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: _suggestedSalePriceController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    labelText: 'سعر بيع العلبة للمستهلك',
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (_selectedProduct == null)
                              Expanded(
                                child: TextFormField(
                                  controller: _conversionFactorController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      labelText: 'معامل التحويل',
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: _expiryDateController,
                                decoration: const InputDecoration(
                                    labelText: 'الانتهاء MM/YY',
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.date_range,
                                        color: Colors.teal)),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: _addItemToInvoiceList,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal.shade800,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 16)),
                              child: const Icon(Icons.playlist_add,
                                  color: Colors.white, size: 28),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // جدول عرض المواد المضافة حالياً في القائمة الحقيقية
                Expanded(
                  child: Card(
                    elevation: 1,
                    child: _uiInputItems.isEmpty
                        ? const Center(
                            child: Text(
                                'لا توجد أصناف مدرجة بالفاتورة الحالية.',
                                style: TextStyle(color: Colors.grey)))
                        : ListView.builder(
                            itemCount: _uiInputItems.length,
                            itemBuilder: (context, index) {
                              final item = _uiInputItems[index];
                              double totalItemCost =
                                  item.quantityPurchased * item.purchasePrice;
                              return ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: item.productId == null
                                        ? Colors.orange.shade100
                                        : Colors.teal.shade100,
                                    child: Text('${index + 1}')),
                                title: Text(item.productName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    'الكمية: ${item.quantityPurchased} + بونص: ${item.bonusQuantity} | سعر الشراء: ${item.purchasePrice} ريال'),
                                trailing: Text(
                                    '${totalItemCost.toStringAsFixed(2)} ريال',
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              );
                            },
                          ),
                  ),
                ),

                const SizedBox(height: 12),

                // عارضة التحكم والإجماليات والترحيل القطعي
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade900,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'إجمالي صافي الفاتورة: ${_calculatedTotalAmount.toStringAsFixed(2)} ريال يمني',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      ElevatedButton.icon(
                        onPressed: _submitAndSaveInvoice,
                        icon: const Icon(Icons.cloud_done, color: Colors.white),
                        label: const Text('ترحيل وحفظ الفاتورة أوفلاين',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal.shade600,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24)),
                      )
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
