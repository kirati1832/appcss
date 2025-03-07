import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:appcsall/presentation/widget/widget.dart' ;

class StudentLinkPage extends StatelessWidget {
  const StudentLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(icon: Icons.table_chart, label: "ตารางสอน/ตารางสอบ", url: "http://klogic.kmutnb.ac.th:8080/kris/tess/dataQuery.jsp"),
      MenuItem(icon: Icons.calendar_today, label: "ปฏิทินการศึกษา", url: "https://reg.kmutnb.ac.th/registrar/home"),
      MenuItem(icon: Icons.payment, label: "ระบบการชำระเงินนักศึกษาใหม่", url: "https://newstudent.kmutnb.ac.th/Student/StudentLogin"),
      MenuItem(icon: Icons.school, label: "ระบบขึ้นทะเบียนนักศึกษาใหม่", url: "http://stdregis.kmutnb.ac.th/"),
      MenuItem(icon: Icons.person_add, label: "ระบบลงทะเบียน", url: "http://klogic.kmutnb.ac.th:8080/kris/index.jsp"),
      MenuItem(icon: Icons.assignment, label: "ระบบดูผลการเรียน", url: "http://grade-report.icit.kmutnb.ac.th/"),
      MenuItem(icon: Icons.checklist, label: "ระบบประเมินการสอน", url: "https://reg1.kmutnb.ac.th/registrar/home"),
      MenuItem(icon: Icons.live_tv, label: "ระบบคำร้องออนไลน์", url: "https://reg3.kmutnb.ac.th/registrar/home"),
      MenuItem(icon: Icons.verified_user, label: "ระบบขอเอกสารสำคัญทางการศึกษา", url: "http://e-service.acdserv.kmutnb.ac.th/regReqDoc/login/"),
      MenuItem(icon: Icons.account_balance, label: "ระบบ e-Studentloan\nสำหรับผู้กู้ กยศ. และ กรอ.", url: "https://eservices.studentloan.or.th/SLFSTUDENT/html/index.html"),
      MenuItem(icon: Icons.sync_alt, label: "บริการซอฟต์แวร์ลิขสิทธิ์", url: "https://software.kmutnb.ac.th/"),
      MenuItem(icon: Icons.school_outlined, label: "บัณฑิตวิทยาลัย", url: "https://www.grad.kmutnb.ac.th/index.php"),
      MenuItem(icon: Icons.link, label: "แบบฟอร์มขออนุมัติตัวนักศึกษา", url: "https://docs.google.com/forms/d/e/1FAIpQLSfBW8Dj47DlKvgdTu2EHHeQpTrCeBlJP0yu_lbuDPC4gn-8fA/viewform?vc=0&c=0&w=1&flr=0&pli=1"),
    ];

    return Scaffold(
      appBar: const Appbarback(titleText: 'Link สำหรับนักศึกษา'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // ปรับเป็น 4 คอลัมน์ตามภาพ
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2, // ปรับสัดส่วนให้ใกล้เคียง
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
      onTap: () => _launchURL(item.url),
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

  /// **ฟังก์ชันเปิด URL**
  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }
}

/// **Model สำหรับเมนู**
class MenuItem {
  final IconData icon;
  final String label;
  final String url;

  MenuItem({required this.icon, required this.label, required this.url});
}
