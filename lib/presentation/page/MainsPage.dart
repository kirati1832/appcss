import 'package:flutter/material.dart';
import 'package:appcsall/presentation/widget/widget.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true; // ✅ ควบคุมการซ่อน/แสดงรหัสผ่าน
  bool _keepSignedIn = false; // ✅ ควบคุมค่า checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ ใช้ AppBar เดิมของคุณ
      appBar: Appbars(),

      // ✅ เนื้อหาหลัก
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Login",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              "Welcome back to the CIS APP",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),

            // ✅ ช่อง Email
            Text("Email Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "hello@example.com",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(height: 20),

            // ✅ ช่อง Password
            Text("Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: "Enter your password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: Icon(Icons.lock_outline),
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
                child: Text("Forgot Password?", style: TextStyle(color: Colors.blue)),
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
                Text("Keep me signed in"),
              ],
            ),

            SizedBox(height: 20),

            // ✅ ปุ่ม Login แบบ Gradient
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blueAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  print("Login Clicked");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
