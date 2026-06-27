import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/customer.dart';
import '../models/sale_return_invoice.dart';
import '../services/sale_return_service.dart';

class SaleReturnScreen extends StatefulWidget {
  final Isar isar;
  const SaleReturnScreen({super.key, required this.isar});

  @override
  State<SaleReturnScreen> createState() => _SaleReturnScreenState();
}

class _SaleReturnScreenState extends State<SaleReturnScreen> {
  late SaleReturnService _service;
  List<Customer> _customers = [];
  int? _selectedCustomerId;
  String _returnType = "نقدي";
  final List<SaleReturnItemInput> _items = [];

  @override
  void initState() {
    super.initState();
    _service = SaleReturnService(widget.isar);
    _loadCustomers();
  }

  Future<void> _loadCustomers() async {
    _customers = await widget.isar.customers.where().findAll();
    setState(() {});
  }

  Future<void> _processReturn() async {
    double total = _items.fold(
        0, (sum, item) => sum + (item.returnPrice * item.quantityReturned));

    await _service.saveSaleReturnInvoice(
      returnType: _returnType,
      customerId: _selectedCustomerId,
      inputItems: _items,
      totalReturnAmount: total,
    );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("مرتجع مبيعات (من الزبون)")),
      body: Column(
        children: [
          DropdownButton<int>(
            hint: const Text("اختر العميل (اختياري)"),
            value: _selectedCustomerId,
            items: _customers
                .map((c) => DropdownMenuItem(value: c.id, child: Text(c.name)))
                .toList(),
            onChanged: (v) => setState(() => _selectedCustomerId = v),
          ),
          // هنا يتم إضافة الأصناف المرجعة للقائمة _items مع إدخال تاريخ الانتهاء يدوياً
          ElevatedButton(
              onPressed: _processReturn, child: const Text("ترحيل المرتجع")),
        ],
      ),
    );
  }
}
