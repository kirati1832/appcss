import 'package:flutter/material.dart';
import 'package:appcsall/presentation/widget/widget.dart';
import 'url.dart';

class Menusubmain extends StatelessWidget {
  const Menusubmain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuData1 = [
      MenuItem(
        icon: Icons.school,
        label: "ภาควิชา",
        onTap: () => print("ภาควิชา"),
      ),
      MenuItem(
        icon: Icons.business,
        label: "คณะและมหาลัย",
        onTap: () => print("คณะและมหาลัย"),
      ),
      MenuItem(
        icon: Icons.monetization_on,
        label: "ทุนการศึกษา",
        onTap: () => print("ทุนการศึกษา"),
      ),
      MenuItem(
        icon: Icons.campaign,
        label: "ประชาสัมพันธ์",
        onTap: () => print("ประชาสัมพันธ์"),
      ),
    ];

    final List<MenuItem> menuData2 = [
      MenuItem(
        icon: Icons.computer,
        label: "ปริญญาตรี CS",
        onTap: () => print("ตรี CS"),
      ),
      MenuItem(
        icon: Icons.code,
        label: "ปริญญาตรี CSB",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/csb.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.computer,
        label: "ปริญญาโท CS",
        onTap: () => print("โท CS"),
      ),
      MenuItem(
        icon: Icons.code,
        label: "ปริญญาโท SE",
        onTap: () => print("โท SE"),
      ),
      MenuItem(
        icon: Icons.folder,
        label: "ปริญญาเอก",
        onTap: () => print("เอก"),
      ),
      MenuItem(
        icon: Icons.article,
        label: "แบบฟอร์ม",
        onTap: () => print("แบบฟอร์ม"),
      ),
      MenuItem(
        icon: Icons.folder,
        label: "ลงทะเบียน",
        onTap: () => print("ลงทะเบียน"),
      ),
      MenuItem(
        icon: Icons.book,
        label: "ดาวโหลด",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Url(url: 'http://cs.kmutnb.ac.th/student_download.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.menu_book,
        label: "คู่มือ",
        onTap: () => print("คู่มือ"),
      ),
      MenuItem(
        icon: Icons.person,
        label: "ที่ปรึกษา",
        onTap: () => Navigator.pushNamed(context,'/staff'),
      ),
      MenuItem(
        icon: Icons.book,
        label: "ขอบเขตวิชา",
        onTap: () => print("ขอบเขตวิชา"),
      ),
    ];

    final List<MenuItem> menuData3 = [
      MenuItem(
        icon: Icons.book,
        label: "ประวัติภาควิชาฯ",
        onTap: () => Navigator.pushNamed(context,'/history'),
      ),
      MenuItem(
        icon: Icons.book,
        label: "โครงสร้างภาควิชาฯ",
        onTap: () => Navigator.pushNamed(context,'/organization'),
      ),
      MenuItem(
        icon: Icons.home_filled,
        label: "Cs Greenoffice",
        onTap: () => Navigator.pushNamed(context,'/csgreen'),
      ),
      MenuItem(
        icon: Icons.home_filled,
        label: "ติดต่อเรา",
        onTap: () => Navigator.pushNamed(context,'/contact'),
      ),
      MenuItem(
        icon: Icons.login,
        label: "login",
        onTap:
            () => Navigator.pushNamed(context, '/logins'),
      ),
      MenuItem(
        icon: Icons.app_registration_outlined,
        label: "register",
        onTap:
            () => Navigator.pushNamed(context, '/register'),
      ),
      
    ];

    final List<MenuItem> menuData4 = [
      MenuItem(
        icon: Icons.book,
        label: "ดาวโหลด",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Url(url: 'http://cs.kmutnb.ac.th/staff_download.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.book,
        label: "งานการเงิน",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Url(url: 'http://cs.kmutnb.ac.th/reg-finance.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.book,
        label: "งานการเงิน",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Url(url: 'http://cs.kmutnb.ac.th/course.jsp'),
              ),
            ),
      ),
    ];

    return Scaffold(
      appBar: const Appbarback(titleText: 'เมนูลัดทั้งหมด'),
      body: ListView(
        children: [
          GridMenu(title: "ข่าวสารและกิจกรรม", menuItems: menuData1),
          GridMenu(title: "นักศึกษา", menuItems: menuData2),
          GridMenu(title: "บุคลากร", menuItems: menuData4),
          GridMenu(title: "อื่นๆ", menuItems: menuData3),
        ],
      ),
    );
  }
}

// ✅ คลาสเก็บข้อมูลเมนู
