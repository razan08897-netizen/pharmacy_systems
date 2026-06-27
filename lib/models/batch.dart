import 'package:isar/isar.dart';

// هذا السطر مهم لتوليد ملف الكود التلقائي لاحقاً
part 'batch.g.dart';

@collection
class Batch {
  Id id = Isar.autoIncrement; // رقم الباتش/التشغيلة الفريد في النظام
  @Index() // <--- مهم جداً لسرعة الفلترة
  late int productId; // ربط برقم الصنف الفريد القادم من جدول المنتجات (Product)

  @Index(type: IndexType.value)
  late String batchNumber; // رقم الباتش أو التشغيلة المكتوب على علبة الدواء

  late DateTime expiryDate; // تاريخ انتهاء الصنف المكتوب على العلبة

  late int
      initialQuantity; // الكمية الافتتاحية أو التي تم شراؤها (بأصغر وحدة حبة/شريط)
  late int
      availableQuantity; // الكمية المتوفرة الحالية على الرف (بأصغر وحدة ويُمنع البيع بالسالب)

  late double
      purchasePriceCost; // سعر شراء الباكت/الوحدة الكبرى من المورد (التكلفة الأساسية)
  late double
      unitCostPrice; // سعر تكلفة أصغر وحدة (شريط/حبة) بعد توزيع البونص تلقائياً

  late double packSalePrice; // سعر بيع الباكت المعتمد (التكلفة + نسبة الربح)
  late double unitSalePrice; // سعر بيع أصغر وحدة (شريط/حبة) للمستهلك
}
