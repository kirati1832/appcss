import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appcsall/provider/loginprovider.dart'; // ✅ Import authProvider

class SidebarMenu extends ConsumerWidget {
  final List<MenuItem> menuItems;

  const SidebarMenu({Key? key, required this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider); // ✅ ดึง authProvider
    final username = authState.when(
      data: (auth) => auth.username?.isNotEmpty == true ? auth.username! : "Guest",
      loading: () => "กำลังโหลด...",
      error: (error, _) => "Error",
    );

    return Drawer(
      child: Container(
        color: Colors.blue[800], // พื้นหลัง Sidebar
        child: Column(
          children: [
            /// **Header ของ Sidebar (แสดง Username)**
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'http://cs.kmutnb.ac.th/img/logo.png',
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome, $username", // ✅ แสดงชื่อผู้ใช้
                    style: GoogleFonts.kanit(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),

            /// **รายการเมนู**
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.blue[800],
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(height: 10),
                    ...menuItems.map((item) => _buildDrawerItem(context, item)).toList(),
                    const SizedBox(height: 20),

                    /// **ปุ่ม Logout**
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.white),
                      title: Text("Logout", style: GoogleFonts.kanit(fontSize: 16, color: Colors.white)),
                      onTap: () {
                        ref.read(authProvider.notifier).logout();
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **สร้าง Widget เมนู**
  Widget _buildDrawerItem(BuildContext context, MenuItem item) {
    if (item.subItems.isNotEmpty) {
      return ExpansionTile(
        leading: Icon(item.icon, color: Colors.white),
        title: Text(item.text, style: GoogleFonts.kanit(fontSize: 16, color: Colors.white)),
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
        title: Text(item.text, style: GoogleFonts.kanit(fontSize: 16, color: Colors.white)),
        tileColor: Colors.blue[800],
        hoverColor: Colors.blue[600],
        selectedTileColor: Colors.blue[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: item.onTap,
      );
    }
  }
}

/// **Model สำหรับเมนู**
class MenuItem {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final List<MenuItem> subItems;

  MenuItem({required this.icon, required this.text, required this.onTap, this.subItems = const []});
}
