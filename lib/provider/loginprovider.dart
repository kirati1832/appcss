import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hashfunction.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// ✅ สร้าง State Model เก็บ username และ token
class AuthState {
  final String? token;
  final String? username;

  AuthState({this.token, this.username});
}

/// ✅ Provider สำหรับจัดการ Login State
final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<AuthState>>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AsyncValue<AuthState>> {
  AuthNotifier() : super( AsyncValue.data(AuthState()));

  /// ✅ ฟังก์ชัน Login (ดึง JWT Token และ Username)
  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final response = await http.post(
        Uri.parse('${dotenv.env['BASE_URL']}:3000/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': hashPassword(password), // ✅ แฮชพาสเวิร์ดก่อนส่ง
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        state = AsyncValue.data(AuthState(token: data['token'], username: username)); // ✅ เก็บ token และ username
      } else {
        state = AsyncValue.error("Login Failed", StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  void logout() {
    state = AsyncValue.data(AuthState());
  }
}