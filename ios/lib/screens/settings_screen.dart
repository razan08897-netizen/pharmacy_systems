import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/settings.dart';
import '../services/settings_service.dart';
import '../services/database_initializer.dart';

class SettingsScreen extends StatefulWidget {
  final Isar isar;
  const SettingsScreen({super.key, required this.isar});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // 1. استدعاء السيرفس بدون متغيرات
  final SettingsService _settingsService = SettingsService();

  // 2. توحيد اسم المتغير ليكون بحرف صغير (آمن ومطابق للـ setState)
  Settings? _settings;

  @override
  void initState() {
    super.initState();
    _loadSettings(); // استدعاء الدالة
  }

  // 3. جعل الحرف الأول من كلمة Settings كبيراً في اسم الدالة camelCase
  Future<void> _loadSettings() async {
    final settings = await _settingsService.getSettings();

    // الآن المتغيرات متطابقة تماماً 100%
    setState(() => _settings = settings);
  }

  @override
  Widget build(BuildContext context) {
    if (_settings == null)
      return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: AppBar(title: const Text("إعدادات النظام والأمان")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // معلومات الجهاز (للتفعيل)
          Card(
            color: Colors.blueGrey[50],
            child: ListTile(
              leading: const Icon(Icons.fingerprint, color: Colors.teal),
              title: const Text("معرف الجهاز (البصمة)"),
              subtitle: Text(_settings!.secureDeviceId ?? "غير مفعل"),
              trailing:
                  IconButton(icon: const Icon(Icons.copy), onPressed: () {}),
            ),
          ),

          const SizedBox(height: 20),
          const Text("بيانات الصيدلية",
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
              decoration: const InputDecoration(labelText: "اسم الصيدلية")),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // إضافة منطق الحفظ هنا
            },
            child: const Text("حفظ التغييرات"),
          ),
        ],
      ),
    );
  }
}
