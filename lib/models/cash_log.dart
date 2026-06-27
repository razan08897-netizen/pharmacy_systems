import 'package:isar/isar.dart';

part 'cash_log.g.dart';

@collection
class CashLog {
  Id id = Isar.autoIncrement; // رقم حركة الكاش الآلي
  @Index() // <--- مهم جداً لسرعة الفلترة
  late DateTime transactionDate; // تاريخ ووقت الحركة المالية بالدقة

  // نوع الحركة: (مبيعات نقد، مشتريات نقد، مرتجع مبيعات، مرتجع مشتريات، سند قبض، سند صرف، مصروف)
  late String transactionType;

  int?
      referenceId; // رقم الفاتورة أو رقم السند المرتبط بهذه الحركة للعودة إليه عند الحاجة

  late double
      amount; // قيمة الحركة المالية (موجب + للإيداع / سالب - للصرف والنفقات)
  late String
      notes; // بيان توضيحي للحركة (مثال: فاتورة مبيعات رقم 5 أو إيجار شهر يونيو)
}
