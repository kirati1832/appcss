import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// ✅ Provider สำหรับ JWT และ Users List
final jwtProvider = StateNotifierProvider<JwtNotifier, JwtState>((ref) {
  return JwtNotifier();
});

/// ✅ State สำหรับเก็บ Token และ Users
class JwtState {
  final String? token;
  final List<Map<String, dynamic>> users;
  final bool isLoading;
  final String? error;

  JwtState({this.token, this.users = const [], this.isLoading = false, this.error});

  JwtState copyWith({String? token, List<Map<String, dynamic>>? users, bool? isLoading, String? error}) {
    return JwtState(
      token: token ?? this.token,
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class JwtNotifier extends StateNotifier<JwtState> {
  JwtNotifier() : super(JwtState());

  /// ✅ ดึงข้อมูล Users โดยใช้ Token
  Future<void> fetchUsers(String token) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await http.get(
        Uri.parse('${dotenv.env['BASE_URL']}:3000/user'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body);
        state = state.copyWith(users: users.cast<Map<String, dynamic>>(), isLoading: false);
      } else {
        state = state.copyWith(error: "Failed to fetch users", isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// ✅ อัปเดต Token และดึง Users ทันที
  Future<void> updateTokenAndFetchUsers(String token) async {
    state = state.copyWith(token: token);
    await fetchUsers(token);
  }

  /// ✅ Logout (รีเซ็ตข้อมูลทั้งหมด)
  void logout() {
    state = JwtState(); // ✅ ล้าง Token และ Users
  }
}
