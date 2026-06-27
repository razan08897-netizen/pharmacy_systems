import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/settings_service.dart';
import '../services/database_initializer.dart';

class ActivationScreen extends StatefulWidget {
  const ActivationScreen({super.key});

  @override
  State<ActivationScreen> createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {
  final TextEditingController _keyController = TextEditingController();
  // عدل السطر ليكون هكذا وبدون أي إضافات داخل الأقواس:
  final SettingsService _SettingsService = SettingsService();
  bool _isLoading = false;

  Future<void> _activate() async {
    setState(() => _isLoading = true);

    // افتراضاً أنك تجلب الـ deviceId من مكان ما (مثلاً plugin للجهاز)
    String deviceId = "YOUR_DEVICE_ID_HERE";

    bool success = await _SettingsService.activateAppWithEncryptedKey(
        deviceId: deviceId, enteredKey: _keyController.text);

    if (success) {
      // التفعيل نجح، عد للداشبورد
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/dashboard', (route) => false);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("كود التفعيل غير صحيح!")));
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("تفعيل النظام"), automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 80, color: Colors.redAccent),
            const Text("النظام مقفل، يرجى إدخال كود التفعيل"),
            TextField(
                controller: _keyController,
                decoration: const InputDecoration(labelText: "كود التفعيل")),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _activate, child: const Text("تفعيل الآن")),
          ],
        ),
      ),
    );
  }
}
