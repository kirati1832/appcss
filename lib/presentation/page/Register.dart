import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appcsall/presentation/widget/widget.dart';
import 'package:appcsall/provider/registerprovider.dart'; // ✅ Import Riverpod Provider

class RegisterPage extends ConsumerStatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true; // ✅ ควบคุมการซ่อน/แสดงรหัสผ่าน

  /// ✅ ฟังก์ชันลงทะเบียน
  void _register() async {
    final notifier = ref.read(registerProvider.notifier);
    await notifier.register(
      _usernameController.text.trim(),
      _passwordController.text.trim(),
      _emailController.text.trim(),
    );
    final RegisterState = ref.read(registerProvider);
    RegisterState.whenData((result) {
    if (result == 'success') {
      Navigator.pushReplacementNamed(context, '/login'); // ✅ ไปหน้า Home
    }
  });
  }

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerProvider);

    return Scaffold(
      appBar: Appbars(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Register",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Create a new account",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // ✅ ช่อง Username
            const Text("Username", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Enter your username",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 20),

            // ✅ ช่อง Email
            const Text("Email Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "hello@example.com",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.email_outlined),
              ),
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
            ),
            const SizedBox(height: 30),

            // ✅ ปุ่ม Register แบบ Gradient
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: registerState is AsyncLoading ? null : _register, // ปิดปุ่มตอนโหลด
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: registerState.when(
                  data: (result) => const Text("Register", style: TextStyle(color: Colors.white, fontSize: 16)),
                  loading: () => const CircularProgressIndicator(color: Colors.white),
                  error: (err, _) => const Text("Register", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),

            // ✅ แสดง Error Message
            if (registerState is AsyncError)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "❌ ${registerState.error}",
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),

            // ✅ กลับไปหน้า Login
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context); // กลับไปหน้า Login
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
