import 'package:flutter/material.dart';
import '../services/settings_service.dart';
import '../services/database_initializer.dart';
import 'dashboard_screen.dart'; // سننشئها لاحقاً
import 'activation_screen.dart'; // شاشة إدخال الكود

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // احذف أي متغير داخل الأقواس واجعلها فارغة تماماً:
  final SettingsService _settingsService = SettingsService();

  @override
  void initState() {
    super.initState();
    _checkLicense();
  }

  Future<void> _checkLicense() async {
    // ننتظر ثانية ليعطي انطباعاً بالراحة (بدل القفز المفاجئ)
    await Future.delayed(const Duration(seconds: 2));

    // فحص حالة الترخيص عبر محركنا الأمني
    int status = await _settingsService.checkLicenseStatus();

    if (!mounted) return;

    if (status == 0) {
      // حالة سليمة: انتقل للداشبورد مباشرة
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const DashboardScreen()));
    } else {
      // حالة (قراءة فقط) أو (تلاعب): انتقل لشاشة التفعيل
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const ActivationScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900], // لون مريح وهادئ
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.medical_services, size: 80, color: Colors.tealAccent),
            SizedBox(height: 20),
            Text("Pharmacy Master",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            CircularProgressIndicator(color: Colors.tealAccent),
          ],
        ),
      ),
    );
  }
}
