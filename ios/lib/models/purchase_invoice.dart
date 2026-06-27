import 'package:isar/isar.dart';

part 'purchase_invoice.g.dart';

@collection
class PurchaseInvoice {
  Id id = Isar.autoIncrement; // رقم داخلي آلي للفاتورة في نظامنا
  @Index() // <--- مهم جداً لسرعة الفلترة
  late String
      supplierInvoiceNumber; // رقم فاتورة المورد الورقية المكتوب يدوياً كمرجع قانوني
  late DateTime purchaseDate; // تاريخ ووقت الشراء
  late String purchaseType; // نوع الفاتورة: (نقدي / آجل)

  int? supplierId; // رقم المورد المستدعى والمرتبط من جدول الموردين Supplier

  late List<PurchaseItem>
      purchasedItems; // قائمة الأصناف المشتراة المضمنة في الفاتورة

  late double
      totalInvoiceAmount; // إجمالي القيمة المالية الإجمالية للفاتورة المطابقة للورقة
}

@embedded
class PurchaseItem {
  int? productId; // رقم الصنف من جدول Product (الأساسي أو المنشأ حديثاً)

  late String productName; // اسم الصنف المشتري
  late int quantityPurchased; // الكمية المشتراة الأساسية بالوحدة الكبرى
  late int bonusQuantity; // كمية البونص المجانية الممنوحة مع الصنف
  late double purchasePrice; // سعر شراء الوحدة الكبرى المدخل من الفاتورة
  late DateTime expiryDate; // تاريخ انتهاء هذا الدفعة المقيد على العلب
}
