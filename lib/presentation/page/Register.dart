import 'package:flutter/material.dart';
import 'package:appcsall/presentation/widget/widget.dart' ;
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true; // ✅ ควบคุมการซ่อน/แสดงรหัสผ่าน

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
              "Register",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              "Create a new account",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),

            // ✅ ช่อง Username
            Text("Username", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your username",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            SizedBox(height: 20),

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
            SizedBox(height: 30),

            // ✅ ปุ่ม Register แบบ Gradient
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.teal],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  print("Register Clicked");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),

            // ✅ กลับไปหน้า Login
            Center(
              child: TextButton(
                onPressed: () {
                  print("Go to Login Page");
                },
                child: Text("Already have an account? Login", style: TextStyle(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
