import 'package:isar/isar.dart';

part 'sale_invoice.g.dart';

@collection
class SaleInvoice {
  Id id = Isar.autoIncrement; // رقم فاتورة المبيعات الآلي المتسلسل
  @Index() // <--- مهم جداً لسرعة الفلترة
  DateTime? date;
  late DateTime invoiceDate; // تاريخ ووقت البيع
  late String invoiceType; // نوع الفاتورة: (نقدي / آجل)

  int?
      customerId; // رقم العميل المرتبط من جدول الـ Customer (يكون فارغاً إذا كانت الفاتورة نقدي مجهول)

  late List<SaleItem>
      soldItems; // قائمة مدمجة بالأصناف التي تم بيعها داخل هذه الفاتورة

  late double totalBeforeDiscount; // إجمالي مبالغ الأصناف قبل الخصم
  late double discountAmount; // قيمة الخصم الممنوح (مبلغ أو صفر)
  late double netAmount; // صافي قيمة الفاتورة النهائي المدفوع أو المقيد ديناً
  // أضفنا هذه الحقول لضمان عمل التقارير
  double get totalAmount => netAmount; // ربط منطقي للاستخدام في التقارير
  late double totalCost; // حقل أساسي لحساب الأرباح (تكلفة البضاعة المباعة)
}

// كائن مستقل يمثل كل صنف تم بيعه داخل قائمة الفاتورة
@embedded
class SaleItem {
  int? productId; // رقم الدواء الفريد من جدول الأصناف
  int? batchId; // رقم الباتش المحدد والمسحوب منه من جدول الـ Batch

  String? productName; // اسم الدواء وقت البيع للتوثيق
  late int quantitySold; // الكمية التي تم بيعها
  late String unitUsed; // نوع الوحدة التي تم البيع بها (باكت / تجزئة)
  late double salePrice; // سعر البيع الفعلي الذي تمت به العملية
  late double costPrice; // ضروري لحساب الربح بدقة لكل صنف
}
