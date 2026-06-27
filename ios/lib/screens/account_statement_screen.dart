import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../services/customer_debt_service.dart';
import '../services/supplier_debt_service.dart';
// ملاحظة: ستحتاج لإضافة مكتبة pdf في pubspec.yaml لاحقاً للطباعة
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class AccountStatementScreen extends StatefulWidget {
  final Isar isar;
  final int entityId; // معرف العميل أو المورد
  final String entityName; // اسم العميل أو المورد
  final bool isCustomer; // للتمييز: هل هو عميل؟

  const AccountStatementScreen({
    super.key,
    required this.isar,
    required this.entityId,
    required this.entityName,
    required this.isCustomer,
  });

  @override
  State<AccountStatementScreen> createState() => _AccountStatementScreenState();
}

class _AccountStatementScreenState extends State<AccountStatementScreen> {
  List<dynamic> _statementItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStatement();
  }

  Future<void> _loadStatement() async {
    if (widget.isCustomer) {
      final service = CustomerDebtService(widget.isar);
      _statementItems = await service.getCustomerStatement(widget.entityId);
    } else {
      final service = SupplierDebtService(widget.isar);
      _statementItems = await service.getSupplierStatement(widget.entityId);
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("كشف حساب: ${widget.entityName}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () => _printPdf(), // دالة الطباعة
          )
        ],
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _statementItems.length,
            itemBuilder: (context, i) {
              final item = _statementItems[i];
              return ListTile(
                title: Text(item.type),
                subtitle: Text(item.date.toString().substring(0, 10)),
                trailing: Text("${item.amount.toStringAsFixed(2)}"),
              );
            },
          ),
    );
  }

  // دالة توليد الـ PDF (مكان وضع منطق الطباعة)
  Future<void> _printPdf() async {
    final pdf = pw.Document();
    // هنا تقوم بتصميم جدول الـ PDF باستخدام مكتبة pdf
    // والبيانات تأتي من _statementItems
    await Printing.layoutPdf(onLayout: (format) => pdf.save());
  }
}