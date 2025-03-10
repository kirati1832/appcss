import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../provider/userprovider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class Logins extends ConsumerStatefulWidget {
  const Logins({Key? key}) : super(key: key);

  @override
  _LoginsState createState() => _LoginsState();
}

class _LoginsState extends ConsumerState<Logins> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  /// ✅ แสดง Popup แจ้งเตือน
  void _showErrorPopup(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Log in failed"),
          content: Text(message, style: const TextStyle(fontSize: 16)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "OK",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
Future<void> _login() async {
  setState(() => _isLoading = true);

  final String username = _usernameController.text.trim();
  final String password = _passwordController.text.trim();

  try {
    final response = await http.post(
      Uri.parse('${dotenv.env['BASE_URL']}/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data['token'] != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', data['token']);
      await prefs.setString('username', username); // ✅ เก็บ username
      
      // ✅ ดึงข้อมูลจาก JWT (decode)
      final userData = _decodeJWT(data['token']);
      if (userData != null) {
        await ref.read(userProvider.notifier).setUser(userData, username); // ✅ ส่ง username ไปที่ setUser()
      }

      // ✅ รอให้ setUser() ทำงานเสร็จก่อนจะเปลี่ยนหน้า
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushNamed(context, '/home');
      });
    } else {
      _showErrorPopup(data['error'] ?? "Invalid credentials.");
    }
  } catch (error) {
    _showErrorPopup("Network error. Please check your internet connection.");
  } finally {
    setState(() => _isLoading = false);
  }
}



  /// ✅ ฟังก์ชัน Decode JWT Token เพื่อดึงข้อมูล User
  Map<String, dynamic>? _decodeJWT(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;
      final payload = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
      );
      return payload;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed:
                      () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _login,
                child:
                    _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("LOGIN"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
