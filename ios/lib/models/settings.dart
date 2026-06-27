import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class Settings {
  Id id = 1; // ثابت لضمان وجود صف واحد فقط للإعدادات
  String? testField; // أضف هذا السطر مؤقتاً
  // بيانات الهوية (للتقارير والطباعة)
  String? pharmacyNameAr;
  String? pharmacyNameEn;
  String? pharmacyAddress;
  String? pharmacyPhone;

  // إعدادات النظام
  double profitMarginPercentage = 25.0;
  String appTheme = "light";

  // --- الحقول الأمنية الجديدة ---
  String? secureDeviceId; // بصمة الجهاز
  int activationCounter = 0; // عداد التفعيل السنوي
  DateTime? lastLogDate; // آخر تاريخ تشغيل (لمنع التلاعب بالتاريخ)
  DateTime? installDate; // تاريخ التثبيت الفعلي
  DateTime? lastOpenedDate;
  bool isSubscribed = true; // حالة الاشتراك
  DateTime? subscriptionEndDate; // تاريخ انتهاء الاشتراك الحالي
}
