import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appcsall/provider/forgetpasswordprovider.dart'; // ✅ Import Provider

class ForgotPasswordPage extends ConsumerStatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  /// ✅ ฟังก์ชันส่งอีเมลผ่าน Provider
  void _sendResetLink() async {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(forgotPasswordProvider.notifier);
      await notifier.sendResetLink(_emailController.text.trim(),_usernameController.text.trim());

      // อ่านค่า State ปัจจุบัน
      final responseState = ref.read(forgotPasswordProvider);
      responseState.whenData((message) {
        if (message != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message), backgroundColor: Colors.green),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final resetState = ref.watch(forgotPasswordProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Enter your email to reset your password",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),

                /// ✅ Form กรอกอีเมล
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Username",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Enter your Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.people),
                        ),
                      ),
                      SizedBox(height: 15,),
                      const Text(
                        "Email",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          final emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                          if (!emailRegex.hasMatch(value)) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// ✅ ปุ่ม Send
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: resetState is AsyncLoading ? null : _sendResetLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: resetState.when(
                      data: (_) => const Text("Send", style: TextStyle(color: Colors.white, fontSize: 16)),
                      loading: () => const CircularProgressIndicator(color: Colors.white),
                      error: (err, _) => const Text("Send", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// ✅ แสดง Error Message (ถ้ามี)
                if (resetState is AsyncError)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "❌ ${resetState.error}",
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),

                /// ✅ ปุ่ม Back to Login
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back to Login",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
