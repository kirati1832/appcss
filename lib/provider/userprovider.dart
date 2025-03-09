import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ✅ Model ข้อมูล User
class UserState {
  final String username;

  UserState({required this.username});

  factory UserState.fromJson(Map<String, dynamic> json) {
    return UserState(
      username: json['username'] ?? "Guest",
    );
  }
}

// ✅ StateNotifier เก็บข้อมูล User
class UserNotifier extends StateNotifier<UserState?> {
  UserNotifier() : super(null) {
    loadUser(); // ✅ โหลดข้อมูลจาก SharedPreferences ตอนเริ่มต้น
  }

  /// ✅ โหลด User จาก SharedPreferences
  Future<void> loadUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');
    final username = prefs.getString('username'); // ✅ โหลด username

    if (token != null && username != null) {
      final userData = _decodeJWT(token);
      if (userData != null) {
        userData['username'] = username; // ✅ ใช้ username จาก SharedPreferences
        state = UserState.fromJson(userData); // ✅ อัปเดต state
      }
    }
  }

  /// ✅ ฟังก์ชันตั้งค่า User (ใช้หลัง Login)
  Future<void> setUser(Map<String, dynamic> userData, String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username); // ✅ บันทึก username
    userData['username'] = username; // ✅ อัปเดตค่า username
    state = UserState.fromJson(userData); // ✅ อัปเดต state
  }

  /// ✅ ฟังก์ชัน Decode JWT Token
  Map<String, dynamic>? _decodeJWT(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;
      final payload = jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
      return payload;
    } catch (e) {
      return null;
    }
  }

  /// ✅ ฟังก์ชัน Logout (ลบ Token + อัปเดต State)
  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
    await prefs.remove('username');
    state = null; // ✅ อัปเดตให้เป็น Guest
  }
}

// ✅ Riverpod Provider
final userProvider = StateNotifierProvider<UserNotifier, UserState?>((ref) {
  return UserNotifier();
});
