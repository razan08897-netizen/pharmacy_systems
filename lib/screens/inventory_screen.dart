import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/batch.dart';
import '../services/inventory_service.dart';
import 'package:isar/isar.dart'; // ✅ هذا السطر السحري المفقود الذي سيجعل فلاتر يتعرف على findAll فوراً

class InventoryScreen extends StatefulWidget {
  final InventoryService inventoryService;

  const InventoryScreen({Key? key, required this.inventoryService})
      : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  // جداول البيانات وعمليات البحث
  List<Map<String, dynamic>> _jardList = [];
  List<Map<String, dynamic>> _filteredJardList = [];
  double _totalInventoryCostValue = 0.0;
  bool _isLoading = true;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInventoryData();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  // جلب البيانات من الـ InventoryService وحساب القيمة المالية الإجمالية
  Future<void> _loadInventoryData() async {
    setState(() => _isLoading = true);
    try {
      final list = await widget.inventoryService.getJardReport();
      final totalCost =
          await widget.inventoryService.getTotalInventoryCostValue();

      if (!mounted) return;

      setState(() {
        _jardList = list;
        _filteredJardList = list;
        _totalInventoryCostValue = totalCost;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('خطأ أثناء تحميل البيانات: $e'),
            backgroundColor: Colors.red),
      );
    }
  }

  // منطق البحث الحي في الواجهة
  void _onSearchChanged() {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _filteredJardList = _jardList;
      });
    } else {
      setState(() {
        _filteredJardList = _jardList.where((item) {
          final product = item['product'] as Product;
          return product.productName.toLowerCase().contains(query);
        }).toList();
      });
    }
  }

  // فتح نافذة (Dialog) الترصيد الافتتاحي الذكي
  void _openStockOpenerDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StockOpenerDialog(
        inventoryService: widget.inventoryService,
        onSuccess: () {
          _loadInventoryData();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المخزن والجرد والترصيد الافتتاحي'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadInventoryData,
            tooltip: 'تحديث البيانات',
          )
        ],
      ),
      body: Column(
        children: [
          // لوحة التلخيص المالي العلوي (إجمالي التكلفة)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.account_balance_wallet,
                        color: Colors.blue.shade700, size: 28),
                    const SizedBox(width: 8),
                    Text(
                      'رأس المال الحالي في الرفوف (بسعر التكلفة):',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900),
                    ),
                  ],
                ),
                Text(
                  '${_totalInventoryCostValue.toStringAsFixed(2)} ر.ي',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700),
                ),
              ],
            ),
          ),

          // شريط البحث الحي عن صنف
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'البحث السريع عن صنف في المخزن...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // قائمة عرض الجرد والدمج الشبكي للأصناف والباتشات
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredJardList.isEmpty
                    ? const Center(
                        child: Text(
                            'لا توجد أصناف أو باتشات متوفرة في المخزن حالياً.'))
                    : ListView.builder(
                        itemCount: _filteredJardList.length,
                        itemBuilder: (context, index) {
                          final item = _filteredJardList[index];
                          final product = item['product'] as Product;
                          final batches = item['batches'] as List<Batch>;

                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6.0),
                            elevation: 2,
                            child: ExpansionTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.teal.shade50,
                                child: Text(
                                  product.productName.isNotEmpty
                                      ? product.productName[0].toUpperCase()
                                      : 'P',
                                  style: TextStyle(
                                      color: Colors.teal.shade800,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              title: Text(
                                product.productName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              subtitle: Text(
                                'الوحدة: ${product.mainUnit} ${product.canBeSegmented ? "| يتجزأ إلى (${product.conversionFactor} ${product.subUnit})" : ""}',
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 13),
                              ),
                              initiallyExpanded: true,
                              children: batches.map((batch) {
                                final isExpired =
                                    batch.expiryDate.isBefore(DateTime.now());
                                return Container(
                                  color: isExpired
                                      ? Colors.red.shade50
                                      : Colors.grey.shade50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey.shade200)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'باتش: ${batch.batchNumber}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'الانتهاء: ${batch.expiryDate.year}/${batch.expiryDate.month.toString().padLeft(2, '0')}',
                                            style: TextStyle(
                                              color: isExpired
                                                  ? Colors.red
                                                  : Colors.grey.shade700,
                                              fontSize: 12,
                                              fontWeight: isExpired
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'المتوفر: ${batch.availableQuantity} حبة/وحدة صغرى',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'بيع باكت: ${batch.packSalePrice} | حبة: ${batch.unitSalePrice}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.green.shade700),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openStockOpenerDialog,
        icon: const Icon(Icons.add_box),
        label: const Text('رصيد افتتاحي / صنف جديد'),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

// النافذة المنبثقة الذكية للترصيد الافتتاحي (يدعم الحالتين: صنف جديد بالكامل أو صنف موجود مسبقاً)
class StockOpenerDialog extends StatefulWidget {
  final InventoryService inventoryService;
  final VoidCallback onSuccess;

  const StockOpenerDialog(
      {Key? key, required this.inventoryService, required this.onSuccess})
      : super(key: key);

  @override
  State<StockOpenerDialog> createState() => _StockOpenerDialogState();
}

class _StockOpenerDialogState extends State<StockOpenerDialog> {
  final _formKey = GlobalKey<FormState>();

  // الحقول النصية
  final _nameController = TextEditingController();
  final _mainUnitController = TextEditingController(text: 'باكت');
  final _subUnitController = TextEditingController(text: 'حبة');
  final _conversionFactorController = TextEditingController(text: '1');
  final _batchNumberController = TextEditingController();
  final _qtyInMainUnitController = TextEditingController();
  final _purchasePriceCostController = TextEditingController();
  final _packSalePriceController = TextEditingController();

  bool _canBeSegmented = false;
  DateTime? _selectedExpiryDate;
  bool _isSaving = false;

  // لحالة فحص وجود صنف مسبق بالاسم وتثبيته
  Product? _matchedProduct;
  List<Product> _searchSuggestions = [];

  @override
  void dispose() {
    _nameController.dispose();
    _mainUnitController.dispose();
    _subUnitController.dispose();
    _conversionFactorController.dispose();
    _batchNumberController.dispose();
    _qtyInMainUnitController.dispose();
    _purchasePriceCostController.dispose();
    _packSalePriceController.dispose();
    super.dispose();
  }

  // البحث عن الأصناف المكررة أو تتبع مطابقة الاسم أثناء الكتابة لقفل الخانات
  Future<void> _checkProductExistence(String value) async {
    if (value.trim().length < 2) {
      setState(() {
        _searchSuggestions = [];
        _matchedProduct = null;
      });
      return;
    }

    // الكود التجاري الرسمي للبحث والفلترة السريعة في قاعدة البيانات
    final products = await widget.inventoryService.isar.products
        .filter()
        .productNameContains(value.trim(), caseSensitive: false)
        .findAll(); // ✅ لن تظهر خطأ الآن لأننا قمنا باستيراد حزمة Isar في الأعلى

    if (!mounted) return;

    setState(() {
      _searchSuggestions = products;

      // التحقق من المطابقة التامة لقفل البيانات
      final exactMatch =
          products.any((p) => p.productName.trim() == value.trim());
      if (exactMatch) {
        _selectProduct(
            products.firstWhere((p) => p.productName.trim() == value.trim()));
      } else if (_matchedProduct != null &&
          _matchedProduct!.productName != value.trim()) {
        _matchedProduct = null;
      }
    });
  }

  void _selectProduct(Product product) {
    setState(() {
      _matchedProduct = product;
      _nameController.text = product.productName;
      _mainUnitController.text = product.mainUnit;
      _canBeSegmented = product.canBeSegmented;
      _conversionFactorController.text = product.conversionFactor.toString();
      _subUnitController.text = product.subUnit ?? '';
      _searchSuggestions = [];
    });
  }

  // التقاط تاريخ الانتهاء
  Future<void> _pickExpiryDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now.add(const Duration(days: 365)),
      firstDate: now.subtract(const Duration(days: 365 * 5)),
      lastDate: now.add(const Duration(days: 365 * 10)),
    );

    if (picked != null && mounted) {
      setState(() {
        _selectedExpiryDate = picked;
      });
    }
  }

  // عملية الحفظ الآمنة والمستندة لـ InventoryService
  Future<void> _saveStock() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedExpiryDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('الرجاء اختيار تاريخ انتهاء الصنف!'),
            backgroundColor: Colors.orange),
      );
      return;
    }

    setState(() => _isSaving = true);

    try {
      final name = _nameController.text.trim();
      final mainUnit = _mainUnitController.text.trim();
      final conversionFactor =
          int.parse(_conversionFactorController.text.trim());
      final subUnit = _canBeSegmented ? _subUnitController.text.trim() : null;
      final batchNumber = _batchNumberController.text.trim();
      final qtyInMainUnit = int.parse(_qtyInMainUnitController.text.trim());
      final purchasePriceCost =
          double.parse(_purchasePriceCostController.text.trim());
      final packSalePrice = double.parse(_packSalePriceController.text.trim());

      if (_matchedProduct != null) {
        // الحالة الثانية: الصنف موجود مسبقاً، ننشئ له باتش جديد مباشرة
        await widget.inventoryService.isar.writeTxn(() async {
          final factor = _matchedProduct!.conversionFactor;
          final totalQtyInSubUnits = qtyInMainUnit * factor;
          final calculatedUnitCost = purchasePriceCost / factor;
          final calculatedUnitSalePrice = packSalePrice / factor;

          final newBatch = Batch()
            ..productId = _matchedProduct!.id
            ..batchNumber = batchNumber
            ..expiryDate = _selectedExpiryDate!
            ..initialQuantity = totalQtyInSubUnits
            ..availableQuantity = totalQtyInSubUnits
            ..purchasePriceCost = purchasePriceCost
            ..unitCostPrice = calculatedUnitCost
            ..packSalePrice = packSalePrice
            ..unitSalePrice = calculatedUnitSalePrice;

          await widget.inventoryService.isar.batchs.put(newBatch);
        });
      } else {
        // الحالة الأولى: صنف جديد تماماً وتأسيس أول رصيد له
        await widget.inventoryService.addNewProductWithInitialBatch(
          name: name,
          mainUnit: mainUnit,
          canBeSegmented: _canBeSegmented,
          conversionFactor: conversionFactor,
          subUnit: subUnit,
          batchNumber: batchNumber,
          expiryDate: _selectedExpiryDate!,
          quantityInMainUnit: qtyInMainUnit,
          purchasePriceCost: purchasePriceCost,
          packSalePrice: packSalePrice,
        );
      }

      // جدار الحماية ضد الـ Async Gaps قبل استدعاء الـ BuildContext
      if (!mounted) return;

      setState(() => _isSaving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('تم حفظ وتأسيس الرصيد الافتتاحي للمخزن بنجاح'),
            backgroundColor: Colors.green),
      );
      widget.onSuccess();
      Navigator.pop(context); // إغلاق الـ Dialog
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSaving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('فشلت العملية: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.add_to_photos, color: Colors.teal),
            const SizedBox(width: 8),
            Text(_matchedProduct != null
                ? 'إدخال رصيد افتتاحي لصنف معرّف'
                : 'تأسيس صنف ورصيد افتتاحي جديد'),
          ],
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الاسم التجاري والعلمي مع ميزة اقتراح الأصناف الموجودة مسبقاً
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'اسم الصنف (تجاري / علمي)',
                      prefixIcon: Icon(Icons.medication),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: _checkProductExistence,
                    validator: (v) =>
                        v == null || v.trim().isEmpty ? 'الحقل مطلوب' : null,
                  ),
                  if (_searchSuggestions.isNotEmpty)
                    Container(
                      constraints: const BoxConstraints(
                          maxHeight: 120), // ✅ هذا هو الأسلوب الصحيح في فلاتر
                      margin: const EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300)),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _searchSuggestions.length,
                        itemBuilder: (context, idx) {
                          final p = _searchSuggestions[idx];
                          return ListTile(
                            title: Text(p.productName),
                            subtitle: Text('وحدة: ${p.mainUnit}'),
                            dense: true,
                            onTap: () => _selectProduct(p),
                          );
                        },
                      ),
                    ),
                  const SizedBox(height: 12),

                  // الـ Row الخاص بالوحدات ومعامل التحويل (يتم تجميده إذا كان الصنف معرّف مسبقاً)
                  AbsorbPointer(
                    absorbing: _matchedProduct != null,
                    child: Opacity(
                      opacity: _matchedProduct != null ? 0.6 : 1.0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _mainUnitController,
                                    decoration: const InputDecoration(
                                        labelText: 'الوحدة الكبرى',
                                        isDense: true),
                                    validator: (v) =>
                                        v == null || v.isEmpty ? 'مطلوب' : null,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Row(
                                  children: [
                                    const Text('يتجزأ؟'),
                                    Checkbox(
                                      value: _canBeSegmented,
                                      onChanged: (val) {
                                        setState(() {
                                          _canBeSegmented = val ?? false;
                                          if (!_canBeSegmented)
                                            _conversionFactorController.text =
                                                '1';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            if (_canBeSegmented) ...[
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _subUnitController,
                                      decoration: const InputDecoration(
                                          labelText: 'الوحدة الصغرى (حبة/شريط)',
                                          isDense: true),
                                      validator: (v) => _canBeSegmented &&
                                              (v == null || v.isEmpty)
                                          ? 'مطلوب'
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _conversionFactorController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: 'معامل التحويل',
                                          isDense: true),
                                      validator: (v) {
                                        if (!_canBeSegmented) return null;
                                        final num = int.tryParse(v ?? '');
                                        if (num == null || num <= 1)
                                          return 'يجب أن يكون أكبر من 1';
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(thickness: 1.5),
                  ),

                  // بيانات التشغيلة / الباتش الفعلي على الرف
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _batchNumberController,
                          decoration: const InputDecoration(
                              labelText: 'رقم الباتش / التشغيلة',
                              isDense: true,
                              border: OutlineInputBorder()),
                          validator: (v) => v == null || v.trim().isEmpty
                              ? 'الحقل مطلوب'
                              : null,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _pickExpiryDate,
                          icon: const Icon(Icons.date_range, size: 18),
                          label: Text(
                            _selectedExpiryDate == null
                                ? 'تاريخ الانتهاء'
                                : '${_selectedExpiryDate!.year}/${_selectedExpiryDate!.month.toString().padLeft(2, '0')}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // الكميات والأسعار (بالوحدة الكبرى)
                  TextFormField(
                    controller: _qtyInMainUnitController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'الكمية الحالية بالرف (بالوحدة الكبرى - باكت)',
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) =>
                        int.tryParse(v ?? '') == null || int.parse(v!) <= 0
                            ? 'أدخل كمية صحيحة'
                            : null,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _purchasePriceCostController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: const InputDecoration(
                              labelText: 'سعر شراء الباكت (التكلفة)',
                              border: OutlineInputBorder()),
                          validator: (v) => double.tryParse(v ?? '') == null ||
                                  double.parse(v!) <= 0
                              ? 'السعر غير صحيح'
                              : null,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          controller: _packSalePriceController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: const InputDecoration(
                              labelText: 'سعر بيع الباكت للمستهلك',
                              border: OutlineInputBorder()),
                          validator: (v) => double.tryParse(v ?? '') == null ||
                                  double.parse(v!) <= 0
                              ? 'السعر غير صحيح'
                              : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: _isSaving ? null : () => Navigator.pop(context),
            child: const Text('إلغاء', style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton.icon(
            onPressed: _isSaving ? null : _saveStock,
            icon: _isSaving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white))
                : const Icon(Icons.save),
            label: const Text('تأسيس وحفظ للرفوف'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, foregroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
