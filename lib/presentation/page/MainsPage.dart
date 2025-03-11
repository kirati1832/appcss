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

  void _login() async {
    final notifier = ref.read(authProvider.notifier);
    await notifier.login(
      _usernameController.text.trim(),
      _passwordController.text.trim(),
    );

    final loginState = ref.read(authProvider);
    loginState.whenData((auth) {
      if (auth.token != null) {
        Navigator.pushReplacementNamed(context, '/'); // ✅ ไปหน้า Home
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(authProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// ✅ Logo
                Image.network(
                  "http://cs.kmutnb.ac.th/img/logo.png",
                  height: 120,
                  fit: BoxFit.fitHeight, 
                ),
                
                SizedBox(height: 20),

                /// ✅ Title
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Welcome back to CIS KMUTNB",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

                const SizedBox(height: 30),

                /// ✅ ช่อง Username
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text("Username",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: "Enter your username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 20),

                /// ✅ ช่อง Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text("Password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),

                /// ✅ Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print("Forgot Password Clicked");
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),

                /// ✅ Keep me signed in (Checkbox)
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

                const SizedBox(height: 10),

                /// ✅ ปุ่ม Login
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: loginState is AsyncLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: loginState.when(
                      data: (auth) => const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      loading: () =>
                          const CircularProgressIndicator(color: Colors.white),
                      error: (err, _) => const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// ✅ ปุ่ม Login as Guest
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,'/');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Login as Guest",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// ✅ Create an Account
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,'/register');
                  },
                  child: const Text(
                    "Create an Account one",
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
