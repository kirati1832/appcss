import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appcsall/presentation/widget/widget.dart';
import 'package:appcsall/provider/registerprovider.dart';

class RegisterPage extends ConsumerStatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _passwordStrength = "Weak"; // ระดับความปลอดภัย
  Color _strengthColor = Colors.red; // สีของระดับรหัสผ่าน

  /// ✅ ฟังก์ชันตรวจสอบอีเมล Gmail
  bool _isValidGmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$|^[a-zA-Z0-9._%+-]+@googlemail\.com$');
    return regex.hasMatch(email);
  }

  /// ✅ ฟังก์ชันตรวจสอบความปลอดภัยของรหัสผ่าน
  void _checkPasswordStrength(String password) {
    if (password.length < 8) {
      setState(() {
        _passwordStrength = "Weak";
        _strengthColor = Colors.red;
      });
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(password)) {
      setState(() {
        _passwordStrength = "Medium";
        _strengthColor = Colors.orange;
      });
    } else {
      setState(() {
        _passwordStrength = "Strong";
        _strengthColor = Colors.green;
      });
    }
  }

  /// ✅ ฟังก์ชันลงทะเบียน
  void _register() async {
    if (_usernameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username is required.")),
      );
      return;
    }
    if (!_isValidGmail(_emailController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email format. Please use a Gmail address.")),
      );
      return;
    }
    if (_passwordStrength != "Strong") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password is not strong enough.")),
      );
      return;
    }

    final notifier = ref.read(registerProvider.notifier);
    await notifier.register(
      _usernameController.text.trim(),
      _passwordController.text.trim(),
      _emailController.text.trim(),
    );
    
    final registerState = ref.read(registerProvider);
    registerState.whenData((result) {
      if (result == 'success') {
        Navigator.pushReplacementNamed(context, '/logins');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerProvider);
    bool isFormValid = _isValidGmail(_emailController.text) && _passwordStrength == "Strong";

    return Scaffold(
      appBar: Appbars(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text("Register", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Text("Create a new account", style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 30),

            // ✅ ช่อง Email
            const Text("Email Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "hello@gmail.com",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 20),

            // ✅ ช่อง Password
            const Text("Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: "Enter your password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              onChanged: _checkPasswordStrength,
            ),
            const SizedBox(height: 5),

            // ✅ แสดงระดับความปลอดภัยของรหัสผ่าน
            Row(
              children: [
                Text("Password Strength: ", style: TextStyle(fontSize: 14, color: Colors.black54)),
                Text(
                  _passwordStrength,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: _strengthColor),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // ✅ ปุ่ม Register (ปิดใช้งานถ้าข้อมูลไม่ถูกต้อง)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isFormValid && registerState is! AsyncLoading ? _register : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFormValid ? Colors.green : Colors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: registerState.when(
                  data: (result) => const Text("Register", style: TextStyle(color: Colors.white, fontSize: 16)),
                  loading: () => const CircularProgressIndicator(color: Colors.white),
                  error: (err, _) => const Text("Register", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),

            // ✅ กลับไปหน้า Login
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/logins');
                },
                child: const Text("Already have an account? Login", style: TextStyle(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
