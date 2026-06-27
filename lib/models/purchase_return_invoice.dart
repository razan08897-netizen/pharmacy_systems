import 'package:isar/isar.dart';

part 'purchase_return_invoice.g.dart';

@collection
class PurchaseReturnInvoice {
  Id id = Isar.autoIncrement; // رقم الفاتورة الآلي للمرتجع
  @Index() // <--- مهم جداً لسرعة الفلترة
  late DateTime returnDate; // تاريخ الحركة
  late String returnType; // (نقدي استلمنا كاش من المورد / آجل خفضنا ديننا له)

  int? supplierId; // رقم المورد المرتبط من جدول الموردين

  late List<PurchaseReturnItem> returnedItems; // قائمة المواد التي خرجت للمورد
  late double totalReturnAmount; // إجمالي قيمة المرتجع المالي
}

@embedded
class PurchaseReturnItem {
  int? productId; // رقم الدواء
  int? batchId; // رقم الباتش الذي تم السحب والنقص منه ليعود للمورد
  late String productName; // اسم الدواء
  late int quantityReturned; // الكمية المعادة للمورد
  late double returnPrice; // السعر المتفق عليه حالياً والمعاد للمورد يدوياً
}
