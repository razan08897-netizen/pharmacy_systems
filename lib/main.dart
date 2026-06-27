import 'package:flutter/material.dart';
import 'services/database_initializer.dart';

// استيراد كافة الشاشات الموجودة في مجلد screens بناءً على هيكلية مشروعك
import 'screens/splash_screen.dart';
import 'screens/activation_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/sales_screen.dart';
import 'screens/Sale_Return_Screen.dart';
import 'screens/purchase_screen.dart';
import 'screens/Purchase_Return_Screen.dart';
import 'screens/inventory_screen.dart';
import 'services/inventory_service.dart'; // هذا السطر السحري الناقص الذي يسبب الخطأ!
import 'screens/cash_balance_screen.dart';
import 'screens/Customer_Debts_Screen.dart';
import 'screens/Supplier_Debts_Screen.dart';
import 'screens/account_statement_screen.dart';
import 'screens/Unified_Report_Screen.dart';
import 'screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة البنية التحتية وقاعدة البيانات Isar
  try {
    await DatabaseInitializer.init();
  } catch (e) {
    debugPrint("خطأ في تهيئة قاعدة البيانات: $e");
  }

  runApp(const PharmacyApp());
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نظام إدارة الصيدلية الذكي',

      // ثيم احترافي مريح للعين ومتناسق مع ألوان الداشبورد الزيتية والسيليت
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor:
              const Color(0xff0f766e), // اللون الرئيسي الافتراضي للصيدلية
          primary: const Color(0xff0f766e),
        ),
        scaffoldBackgroundColor: const Color(0xfff8fafc), // خلفية مريحة للنظام
      ),

      // نقطة الانطلاق الأولى لفحص الترخيص والتفعيل
      home: const SplashScreen(),

      // جدول المسارات الموحد لربط أزرار الداشبورد بالملفات الفعلية
      // جدول المسارات الموحد بعد ضبط شاشات الديون والإعدادات
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/activation': (context) => const ActivationScreen(),

        // الشاشات الأساسية (إذا ظهر خطأ تحت أي شاشة منها، أضف لها `isar: DatabaseInitializer.isar` مثل البقية)
        '/sales': (context) => SalesScreen(isar: DatabaseInitializer.isar),
        '/sales_return': (context) =>
            SaleReturnScreen(isar: DatabaseInitializer.isar),
        '/purchase': (context) => PurchaseScreen(
            isar: DatabaseInitializer.isar), // السطر 63 المستهدف!
        '/purchase_return': (context) =>
            PurchaseReturnScreen(isar: DatabaseInitializer.isar),
        // 1. إذا كانت خدمة المخزن (InventoryService) تتطلب الـ isar داخلها (وهو الاحتمال الأكبر):

// 2. أو إذا كانت الخدمة لا تتطلب أي متغيرات وتستدعى فارغة:
        '/inventory': (context) => InventoryScreen(
            inventoryService: InventoryService(DatabaseInitializer.isar)),
        '/cash_balance': (context) =>
            CashAndVouchersScreen(isar: DatabaseInitializer.isar),
        // شاشات الديون
        '/customer_debts': (context) =>
            CustomerDebtsScreen(isar: DatabaseInitializer.isar),
        '/supplier_debts': (context) =>
            SupplierDebtsScreen(isar: DatabaseInitializer.isar),

        // التقارير والإعدادات
        '/reports': (context) =>
            UnifiedReportScreen(isar: DatabaseInitializer.isar),
        '/settings': (context) =>
            SettingsScreen(isar: DatabaseInitializer.isar),
      },
    );
  }
}
