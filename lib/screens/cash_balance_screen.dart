import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/cash_log.dart';
import '../models/customer.dart';
import '../models/supplier.dart';
import '../services/cash_and_voucher_service.dart';

class CashAndVouchersScreen extends StatefulWidget {
  final Isar isar;
  const CashAndVouchersScreen({super.key, required this.isar});

  @override
  State<CashAndVouchersScreen> createState() => _CashAndVouchersScreenState();
}

class _CashAndVouchersScreenState extends State<CashAndVouchersScreen> {
  late CashAndVoucherService _cashService;
  double _currentBalance = 0.0;
  List<CashLog> _logs = [];
  List<Customer> _customers = [];
  List<Supplier> _suppliers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _cashService = CashAndVoucherService(widget.isar);
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    _currentBalance = await _cashService.getTotalCashBalance();
    _logs = await _cashService.getCashHistory();
    _customers = await widget.isar.customers.where().findAll();
    _suppliers = await widget.isar.suppliers.where().findAll();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الصندوق والسندات")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildBalanceCard(),
                Expanded(child: _buildLogsList()),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("إصدار سند"),
        icon: const Icon(Icons.add_card),
        onPressed: () => _showVoucherDialog(context),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Card(
      color: Colors.blue.shade900,
      margin: const EdgeInsets.all(12),
      child: ListTile(
        title:
            const Text("الرصيد الحالي", style: TextStyle(color: Colors.white)),
        trailing: Text("${_currentBalance.toStringAsFixed(2)} ر.ي",
            style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildLogsList() {
    return ListView.builder(
      itemCount: _logs.length,
      itemBuilder: (context, index) {
        final log = _logs[index];
        return ListTile(
          leading: Icon(
              log.amount >= 0 ? Icons.add_circle : Icons.remove_circle,
              color: log.amount >= 0 ? Colors.green : Colors.red),
          title: Text(log.transactionType),
          subtitle: Text(log.notes),
          trailing: Text("${log.amount.toStringAsFixed(2)}"),
        );
      },
    );
  }

  void _showVoucherDialog(BuildContext context) {
    String selectedType = "مصروف";
    int? selectedCustomerId;
    int? selectedSupplierId;
    final amountController = TextEditingController();
    final noteController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text("سند مالي جديد"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<String>(
                  value: selectedType,
                  items: ["قبض", "صرف", "مصروف"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) => setState(() => selectedType = v!),
                ),
                if (selectedType == "قبض")
                  DropdownButton<int>(
                    hint: const Text("اختر العميل"),
                    value: selectedCustomerId,
                    items: _customers
                        .map((c) =>
                            DropdownMenuItem(value: c.id, child: Text(c.name)))
                        .toList(),
                    onChanged: (v) => setState(() => selectedCustomerId = v),
                  ),
                if (selectedType == "صرف")
                  DropdownButton<int>(
                    hint: const Text("اختر المورد"),
                    value: selectedSupplierId,
                    items: _suppliers
                        .map((s) =>
                            DropdownMenuItem(value: s.id, child: Text(s.name)))
                        .toList(),
                    onChanged: (v) => setState(() => selectedSupplierId = v),
                  ),
                TextField(
                    controller: amountController,
                    decoration: const InputDecoration(labelText: "المبلغ")),
                TextField(
                    controller: noteController,
                    decoration: const InputDecoration(labelText: "البيان")),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("إلغاء")),
            ElevatedButton(
              onPressed: () async {
                double amount = double.tryParse(amountController.text) ?? 0;
                if (selectedType == "قبض" && selectedCustomerId != null) {
                  await _cashService.createCustomerReceiptVoucher(
                      customerId: selectedCustomerId!,
                      amount: amount,
                      notes: noteController.text);
                } else if (selectedType == "صرف" &&
                    selectedSupplierId != null) {
                  await _cashService.createSupplierPaymentVoucher(
                      supplierId: selectedSupplierId!,
                      amount: amount,
                      notes: noteController.text);
                } else if (selectedType == "مصروف") {
                  await _cashService.createExpenseVoucher(
                      amount: amount, notes: noteController.text);
                }
                _loadData();
                if (mounted) Navigator.pop(context);
              },
              child: const Text("حفظ السند"),
            )
          ],
        ),
      ),
    );
  }
}
