import 'package:isar/isar.dart';

part 'sale_return_invoice.g.dart';

@collection
class SaleReturnInvoice {
  Id id = Isar.autoIncrement; // رقم فاتورة مرتجع المبيعات الآلي
  @Index() // <--- مهم جداً لسرعة الفلترة
  late DateTime returnDate; // تاريخ المرتجع
  late String
      returnType; // طبيعة المرتجع: (نقدي أرجعنا له كاش / آجل خفضنا مديونيته)

  int? customerId; // رقم العميل المرتبط (إن وجد) من جدول العملاء

  late List<ReturnItem> returnedItems; // تفاصيل المواد المعادة
  late double totalReturnAmount; // إجمالي القيمة المالية الكلية المستردة
}

@embedded
class ReturnItem {
  int? productId; // رقم الصنف المعاد
  late String productName; // اسم الصنف
  late int quantityReturned; // الكمية المعادة
  late double returnPrice; // السعر المحسوب أو المدخل يدوياً للإرجاع
  late DateTime
      expiryDate; // تاريخ الانتهاء المدخل للدواء المعاد لتأسيس الباتش الجديد له
}
