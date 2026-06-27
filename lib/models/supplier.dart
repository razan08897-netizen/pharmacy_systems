import 'package:isar/isar.dart';

part 'supplier.g.dart';

@collection
class Supplier {
  Id id = Isar.autoIncrement; // رقم المورد الفريد (supplierId)

  @Index(type: IndexType.value)
  late String name; // اسم المورد أو الشركة الموردة

  late String phone; // رقم هاتف المورد أو المندوب

  late double
      initialBalance; // الرصيد الافتتاحي (يكون موجباً ليوضح كم للمورد أموال علينا مسبقاً)
  late double
      currentBalance; // الدين المتبقي للمورد علينا (يحدث تلقائياً مع المشتريات، المرتجعات، وسندات الصرف)
}
