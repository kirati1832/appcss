import 'package:flutter/material.dart';

class Appbars extends StatelessWidget implements PreferredSizeWidget {
  const Appbars({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90, // ปรับความสูงของ AppBar ให้ใหญ่พอ
      title: Image.network(
        'https://lh3.googleusercontent.com/d/1vOAxsOruch4kDHI_JiZQURCXsQlCx-s6=w1000',
        height: 70, // คงขนาดของโลโก้
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 3,
      shadowColor: Colors.black26,
    );
  }

  // ✅ ต้องเพิ่มส่วนนี้เพื่อให้รองรับ PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(90); // กำหนดความสูงที่ต้องการ
}

class Appbarback extends StatelessWidget implements PreferredSizeWidget {
  final String titleText; // รับข้อความเป็นพารามิเตอร์

  const Appbarback({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90, // กำหนดความสูงของ AppBar
      backgroundColor: Colors.blueAccent, // ✅ เปลี่ยนสีเป็น BlueAccent
      elevation: 3,
      shadowColor: Colors.black26,
      leading: Navigator.canPop(context) // ✅ ถ้ากลับได้ ให้แสดงปุ่ม Back
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        titleText, // ✅ ใช้พารามิเตอร์ที่รับมา
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true, // จัดให้อยู่ตรงกลาง
    );
  }

  // ✅ รองรับ PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(90);
}