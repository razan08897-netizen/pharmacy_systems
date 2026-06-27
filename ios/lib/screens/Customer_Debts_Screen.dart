import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/customer.dart';
import '../services/customer_debt_service.dart';
import 'account_statement_screen.dart'; // تأكد من المسار الصحيح للملف

class CustomerDebtsScreen extends StatefulWidget {
  final Isar isar;
  const CustomerDebtsScreen({super.key, required this.isar});

  @override
  State<CustomerDebtsScreen> createState() => _CustomerDebtsScreenState();
}

class _CustomerDebtsScreenState extends State<CustomerDebtsScreen> {
  late CustomerDebtService _service;
  List<Customer> _customers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _service = CustomerDebtService(widget.isar);
    _loadCustomers();
  }

  // جلب كافة العملاء لعرض مديونياتهم
  Future<void> _loadCustomers() async {
    final list = await _service.getAllCustomers();
    setState(() {
      _customers = list;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ديون العملاء")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _customers.length,
              itemBuilder: (context, index) {
                final customer = _customers[index];
                // تحديد اللون بناءً على الرصيد (أحمر إذا كان عليه دين)
                final isDebt = customer.currentBalance < 0;

                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(customer.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("رقم الهاتف: ${customer.phone}"),
                    trailing: Text(
                      "${customer.currentBalance.toStringAsFixed(2)} ر.ي",
                      style: TextStyle(
                        color: isDebt ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AccountStatementScreen(
                            isar: widget.isar,
                            entityId: customer.id,
                            entityName: customer.name,
                            isCustomer: true, // نمرر true لأنه عميل
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
