import 'package:isar/isar.dart';

part 'customer.g.dart';

@collection
class Customer {
  Id id = Isar.autoIncrement; // رقم العميل الفريد (customerId)

  @Index(type: IndexType.value)
  late String name; // اسم العميل الثلاثي

  late String phone; // رقم الهاتف أو الواتساب الخاص بالعميل

  late double
      initialBalance; // الرصيد الافتتاحي (يكون سالباً إذا كان عليه دين مسبق)
  late double
      currentBalance; // الرصيد الحالي المحدث تلقائياً بعد كل بيع، مرتجع، أو سند قبض
}
