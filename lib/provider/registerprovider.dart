import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hashfunction.dart'; // ✅ ใช้ฟังก์ชันแฮชพาสเวิร์ด
import 'package:flutter_dotenv/flutter_dotenv.dart';
/// ✅ Provider สำหรับการลงทะเบียน
final registerProvider = StateNotifierProvider<RegisterNotifier, AsyncValue<String?>>((ref) {
  return RegisterNotifier();
});

/// ✅ Notifier จัดการการลงทะเบียน
class RegisterNotifier extends StateNotifier<AsyncValue<String?>> {
  RegisterNotifier() : super(const AsyncValue.data(null));

  /// ✅ ฟังก์ชันลงทะเบียน
  Future<void> register(String username, String password, String email) async {
    state = const AsyncValue.loading();
    try {
      final response = await http.post(
        Uri.parse('${dotenv.env['BASE_URL']}:3000/auth/register'),
        headers: {'Content-Type': 'application/json'}, // ✅ เพิ่ม Header
        body: jsonEncode({
          'username': username,
          'password': hashPassword(password), // ✅ แฮชพาสเวิร์ดก่อนส่ง
          'email': email,
        }),
      );

      if (response.statusCode == 201) {
        print('✅ ลงทะเบียนสำเร็จ');
        state = const AsyncValue.data('success'); // ✅ แจ้งว่าสำเร็จ
      } else {
        print('❌ เกิดข้อผิดพลาด: ${response.body}');
        state = AsyncValue.error(response.body, StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
