import 'package:isar/isar.dart';

part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement; // رقم الصنف الفريد productId

  @Index(type: IndexType.value) // فهرسة الاسم لتسريع البحث الحي جداً
  late String productName; // اسم الصنف (تجاري وعلمي)

  late String mainUnit; // الوحدة الكبرى (باكت / علبة)
  late bool canBeSegmented; // هل يتجزأ؟ (نعم / لا)

  // معامل التحويل (كم وحدة صغرى داخل الوحدة الكبرى، إذا لا يتجزأ يكون 1)
  late int conversionFactor;

  String? subUnit; // اسم الوحدة الصغرى (شريط / حبة)
}
