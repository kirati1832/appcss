import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:appcsall/presentation/widget/widget.dart' ;
class LinkPage extends StatelessWidget {
  const LinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(icon: Icons.group, label: "ระบบเพื่ออำนวย\nทะเบียนนักศึกษา", onTap: () => launchUrl(Uri.parse("http://klogic.kmutnb.ac.th:8080/kris/index.jsp"))),
      MenuItem(icon: Icons.description, label: "ระบบส่ง\nทกรด", onTap: () => launchUrl(Uri.parse("https://reg1.kmutnb.ac.th/registrar/home"))),
      MenuItem(icon: Icons.bar_chart, label: "ระบบเพื่อรายงาน\nข้อมูลและสถิติ", onTap: () => launchUrl(Uri.parse("https://ureport.kmutnb.ac.th/"))),
      MenuItem(icon: Icons.window, label: "Microsoft Azure Dev Tool\nfor Teaching", onTap: () => launchUrl(Uri.parse("https://azureforeducation.microsoft.com/devtools"))),
      MenuItem(icon: Icons.cast_for_education, label: "KMUTNB\nOnline Learning", onTap: () => launchUrl(Uri.parse("https://www.kmutnb.ac.th/kmutnb-online-learning.aspx"))),
      MenuItem(icon: Icons.compare_arrows, label: "บริการซอฟต์แวร์\nลิขสิทธิ์", onTap: () => launchUrl(Uri.parse("https://software.kmutnb.ac.th/"))),
      MenuItem(icon: Icons.account_balance, label: "ระบบบริหาร\nลูกหนี้เงินยืม", onTap: () => launchUrl(Uri.parse("http://loan.kmutnb.ac.th/"))),
      MenuItem(icon: Icons.medical_services, label: "ระบบเบิกจ่าย\nสวัสดิการรักษา", onTap: () => launchUrl(Uri.parse("https://medical.kmutnb.ac.th/index.php?r=site%2Flogin"))),
      MenuItem(icon: Icons.school, label: "ระบบสวัสดิการ\nเกี่ยวกับการศึกษา", onTap: () => launchUrl(Uri.parse("https://edufee.kmutnb.ac.th/"))),
      MenuItem(icon: Icons.gavel, label: "สหกรณ์\nออมทรัพย์", onTap: () => launchUrl(Uri.parse("https://www.ppn-scc.com/"))),
      MenuItem(icon: Icons.event, label: "ระบบลา\nออนไลน์", onTap: () => launchUrl(Uri.parse("https://pls.kmutnb.ac.th/site/login"))),
    ];

    return Scaffold(
      appBar: const Appbarback(titleText: 'Link สำหรับบุคลากร'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // แสดง 3 คอลัมน์ต่อแถว
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2, // ปรับสัดส่วน
          ),
          itemBuilder: (context, index) {
            return _buildMenuItem(menuItems[index]);
          },
        ),
      ),
    );
  }

  /// **Widget สำหรับแสดงเมนูแต่ละตัว**
  Widget _buildMenuItem(MenuItem item) {
    return GestureDetector(
      onTap: item.onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 40, color: Colors.blueAccent),
            const SizedBox(height: 8),
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  MenuItem({required this.icon, required this.label, required this.onTap});
}
//  launchUrl(Uri.parse(link["url"]!)),