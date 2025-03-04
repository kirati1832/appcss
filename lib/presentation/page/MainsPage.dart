import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appcsall/presentation/widget/widget.dart';
import 'package:appcsall/provider/loginprovider.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _keepSignedIn = false;

  /// ✅ ฟังก์ชัน Login
  void _login() async {
    final notifier = ref.read(authProvider.notifier);
    await notifier.login(
      _usernameController.text.trim(),
      _passwordController.text.trim(),
    );

    // ✅ ถ้าล็อกอินสำเร็จ -> ไปหน้า Home
    final loginState = ref.read(authProvider);
    loginState.whenData((token) {
      if (token != null) {
        Navigator.pushReplacementNamed(context, '/'); // ✅ ไปหน้า Home
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(authProvider);

    return Scaffold(
      appBar: Appbars(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Login",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Welcome back to the CIS APP",
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

            // ✅ Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  print("Forgot Password Clicked");
                },
                child: const Text("Forgot Password?", style: TextStyle(color: Colors.blue)),
              ),
            ),

            // ✅ Keep me signed in (Checkbox)
            Row(
              children: [
                Checkbox(
                  value: _keepSignedIn,
                  onChanged: (value) {
                    setState(() {
                      _keepSignedIn = value!;
                    });
                  },
                ),
                const Text("Keep me signed in"),
              ],
            ),

            const SizedBox(height: 20),

            // ✅ ปุ่ม Login
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: loginState is AsyncLoading ? null : _login, // ปิดปุ่มตอนโหลด
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: loginState.when(
                  data: (token) => const Text("Login", style: TextStyle(color: Colors.white, fontSize: 16)),
                  loading: () => const CircularProgressIndicator(color: Colors.white),
                  error: (err, _) => const Text("Login", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),

            // ✅ แสดง Error Message
            if (loginState is AsyncError)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "❌ ${loginState.error}",
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
          
          ],
        ),
      ),
    );
  }
}
