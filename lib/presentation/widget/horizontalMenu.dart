import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HorizontalMenu extends StatelessWidget {
  final List<MenuItems> MenuItemss = [
    MenuItems("ภาควิชา", Icons.school, "https://www.facebook.com"),
    MenuItems("คณะและมหาลัย", Icons.business, "https://www.google.com"),
    MenuItems("ทุนการศึกษา", Icons.monetization_on, "https://www.youtube.com"),
    MenuItems("ประชาสัมพันธ์", Icons.campaign, "https://github.com"),
    MenuItems("ปฎิทินการศึกษา", Icons.calendar_month, "https://acdserv.kmutnb.ac.th/"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 253, 253, 253),
      height: 100, // ✅ ปรับขนาดให้รองรับการเลื่อน
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // ✅ เปิด Scroll แนวนอน
        child: Row(
          children: MenuItemss.map((item) => _buildMenuItems(item)).toList(),
        ),
      ),
    );
  }

  /// ✅ ฟังก์ชันสร้างไอคอนเมนู + ชื่อ + คลิกได้
  Widget _buildMenuItems(MenuItems item) {
    return GestureDetector(
      onTap: () => _launchURL(item.url),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 40, color: Colors.blueAccent), // ✅ ไอคอนใหญ่ขึ้น
            SizedBox(height: 5),
            Text(
              item.title,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ ฟังก์ชันเปิดลิงก์เมื่อกดเมนู
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'ไม่สามารถเปิด URL: $url';
    }
  }
}

/// ✅ คลาสข้อมูลเมนู
class MenuItems {
  final String title;
  final IconData icon;
  final String url;
  MenuItems(this.title, this.icon, this.url);
}
