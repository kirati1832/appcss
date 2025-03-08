import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarMenu extends StatelessWidget {
  final List<MenuItem> menuItems;

  const SidebarMenu({
    Key? key,
    required this.menuItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[800], // กำหนดให้สีฟ้าครอบคลุมทั้งหมด
        child: Column(
          children: [
            /// **Header ของ Sidebar (เฉพาะโลโก้มีพื้นหลังสีขาว)**
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              color: Colors.white, // ทำให้เฉพาะแถบโลโก้เป็นสีขาว
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// **โลโก้**
                  Image.network(
                    'http://cs.kmutnb.ac.th/img/logo.png',
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            /// **รายการเมนู (พื้นหลังสีน้ำเงิน)**
            Expanded(
              child: Container(
                width: double.infinity, // ให้เต็มจอ
                height: double.infinity, // ขยายเต็มพื้นที่
                color: Colors.blue[800], // สีพื้นหลังของเมนู
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(height: 10),
                    ...menuItems.map((item) => _buildDrawerItem(context, item)).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Widget สำหรับสร้างเมนู (รองรับเมนูหลักและเมนูย่อย)**
  Widget _buildDrawerItem(BuildContext context, MenuItem item) {
    if (item.subItems.isNotEmpty) {
      return ExpansionTile(
        leading: Icon(item.icon, color: Colors.white),
        title: Text(
          item.text,
          style: GoogleFonts.kanit(fontSize: 16, color: Colors.white),
        ),
        children: item.subItems
            .map((subItem) => Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: _buildDrawerItem(context, subItem),
                ))
            .toList(),
      );
    } else {
      return ListTile(
        leading: Icon(item.icon, color: Colors.white),
        title: Text(
          item.text,
          style: GoogleFonts.kanit(fontSize: 16, color: Colors.white),
        ),
        tileColor: Colors.blue[800],
        hoverColor: Colors.blue[600], // เปลี่ยนสีเมื่อโฮเวอร์
        selectedTileColor: Colors.blue[700], // เปลี่ยนสีเมื่อเลือก
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: item.onTap,
      );
    }
  }
}

/// **Model สำหรับสร้างเมนู**
class MenuItem {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final List<MenuItem> subItems;

  MenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
    this.subItems = const [], // ค่าเริ่มต้นเป็นเมนูหลัก
  });
}
