import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/supplier.dart';
import '../models/purchase_return_invoice.dart';
import '../services/purchase_return_service.dart';

class PurchaseReturnScreen extends StatefulWidget {
  final Isar isar;
  const PurchaseReturnScreen({super.key, required this.isar});

  @override
  State<PurchaseReturnScreen> createState() => _PurchaseReturnScreenState();
}

class _PurchaseReturnScreenState extends State<PurchaseReturnScreen> {
  late PurchaseReturnService _service;
  List<Supplier> _suppliers = [];
  int? _selectedSupplierId;
  String _returnType = "نقدي";
  final List<PurchaseReturnItemInput> _items = [];

  @override
  void initState() {
    super.initState();
    _service = PurchaseReturnService(widget.isar);
    _loadSuppliers();
  }

  Future<void> _loadSuppliers() async {
    _suppliers = await widget.isar.suppliers.where().findAll();
    setState(() {});
  }

  Future<void> _processReturn() async {
    double total = _items.fold(
        0, (sum, item) => sum + (item.returnPrice * item.quantityReturned));

    await _service.savePurchaseReturnInvoice(
      returnType: _returnType,
      supplierId: _selectedSupplierId,
      inputItems: _items,
      totalReturnAmount: total,
    );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("مرتجع مشتريات (للمورد)")),
      body: Column(
        children: [
          DropdownButton<int>(
            hint: const Text("اختر المورد"),
            value: _selectedSupplierId,
            items: _suppliers
                .map((s) => DropdownMenuItem(value: s.id, child: Text(s.name)))
                .toList(),
            onChanged: (v) => setState(() => _selectedSupplierId = v),
          ),
          // هنا يتم إضافة الأصناف المرجعة للقائمة _items
          ElevatedButton(
              onPressed: _processReturn, child: const Text("ترحيل المرتجع")),
        ],
      ),
    );
  }
}
