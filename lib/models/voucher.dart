import 'package:isar/isar.dart';

part 'voucher.g.dart';

@collection
class Voucher {
  Id id = Isar.autoIncrement; // رقم السند الآلي المتسلسل
  @Index() // <--- مهم جداً لسرعة الفلترة
  late DateTime date; // تاريخ ووقت كتابة السند

  late String type; // نوع السند: (سند قبض لعميل / سند صرف لمورد / مصروف مستقل)

  int?
      customerId; // يرتبط برقم العميل من جدول الـ Customer (يكون فارغاً في سند الصرف والمصروف)
  int?
      supplierId; // يرتبط برقم المورد من جدول الـ Supplier (يكون فارغاً في سند القبض والمصروف)

  late double amount; // المبلغ النقدي المدفوع كاش
  late String
      notes; // البيان أو سبب المعاملة (مثل: تسديد دفعة من الحساب الفلاني)
}
