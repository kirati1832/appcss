import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
/// ✅ Provider สำหรับส่งคำขอรีเซ็ตรหัสผ่าน
final forgotPasswordProvider =
    StateNotifierProvider<ForgotPasswordNotifier, AsyncValue<String?>>((ref) {
  return ForgotPasswordNotifier();
});

class ForgotPasswordNotifier extends StateNotifier<AsyncValue<String?>> {
  ForgotPasswordNotifier() : super(const AsyncValue.data(null));

  /// ✅ ฟังก์ชันส่งอีเมลรีเซ็ตรหัสผ่าน
  Future<void> sendResetLink(String email,String username) async {
    state = const AsyncValue.loading();
    try {
      final response = await http.post(
        Uri.parse('${dotenv.env['BASE_URL']}:3000/auth/forgot-password'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username':username,'email': email}),
      );

      if (response.statusCode == 200) {
        state = const AsyncValue.data("✅ Email Sent");
      } else {
        final errorMessage = jsonDecode(response.body)['message'] ?? "Failed to send email";
        state = AsyncValue.error(errorMessage, StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error("❌ Error: $e", StackTrace.current);
    }
  }
}
