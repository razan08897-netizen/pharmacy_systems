import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/supplier.dart';
import '../services/supplier_debt_service.dart';
import 'account_statement_screen.dart'; // تأكد من المسار الصحيح للملف

class SupplierDebtsScreen extends StatefulWidget {
  final Isar isar;
  const SupplierDebtsScreen({super.key, required this.isar});

  @override
  State<SupplierDebtsScreen> createState() => _SupplierDebtsScreenState();
}

class _SupplierDebtsScreenState extends State<SupplierDebtsScreen> {
  late SupplierDebtService _service;
  List<Supplier> _suppliers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _service = SupplierDebtService(widget.isar);
    _loadSuppliers();
  }

  // جلب كافة الموردين لعرض المديونية التي علينا لهم
  Future<void> _loadSuppliers() async {
    final list = await _service.getAllSuppliers();
    setState(() {
      _suppliers = list;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ديون الموردين")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _suppliers.length,
              itemBuilder: (context, index) {
                final supplier = _suppliers[index];
                // المورد الذي له رصيد موجب يعني أننا مدينون له بمبلغ
                final hasDebt = supplier.currentBalance > 0;

                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(supplier.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("هاتف المندوب: ${supplier.phone}"),
                    trailing: Text(
                      "${supplier.currentBalance.toStringAsFixed(2)} ر.ي",
                      style: TextStyle(
                        color: hasDebt
                            ? Colors.red.shade700
                            : Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      // استخدام Navigator للذهاب إلى كلاس الشاشة وليس كدالة
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountStatementScreen(
                            isar: widget.isar,
                            entityId: supplier.id,
                            entityName: supplier.name,
                            isCustomer: false, // لأننا في شاشة الموردين
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
