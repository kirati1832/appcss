import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hashfunction.dart';
final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<String?>>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AsyncValue<String?>> {
  AuthNotifier() : super(const AsyncValue.data(null));

  /// ✅ ฟังก์ชัน Login (ดึง JWT Token)
  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final response = await http.post(
        Uri.parse('http://202.44.40.179:3000/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': hashPassword(password), // ✅ แฮชพาสเวิร์ดก่อนส่ง
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String token = data['token'];
        print('✅ JWT Token: $token');
        state = AsyncValue.data(token); // ✅ เก็บ Token
      } else {
        print('❌ ล็อกอินล้มเหลว: ${response.body}');
        state = AsyncValue.error("Login Failed", StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  /// ✅ ฟังก์ชัน Logout (เคลียร์ Token)
  void logout() {
    state = const AsyncValue.data(null);
  }
}
/*
/// ✅ Provider สำหรับจัดการ Login State
final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<String?>>((
  ref,
) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AsyncValue<String?>> {
  AuthNotifier() : super(const AsyncValue.data(null));
  final url = Uri.parse('http://202.44.40.179:3000/auth/login');
  /// ✅ ฟังก์ชัน Login
  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': '${username}',
          'password': '${hashPassword(password)}', // แฮชพาสเวิร์ดก่อนส่ง
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        state = AsyncValue.data(data['token']); // ✅ เก็บ Token
      } else {
        print(response.body);
        state = AsyncValue.error("Login Failed", StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
*/