import 'package:flutter/material.dart';
import 'package:appcsall/presentation/widget/widget.dart';
import 'url.dart';

class Menusubmain extends StatelessWidget {
  const Menusubmain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuData1 = [
      MenuItem(
        icon: Icons.newspaper,
        label: "ประวัติภาควิชาฯ",
        onTap: () => Navigator.pushNamed(context,'/history'),
      ),
      MenuItem(
        icon: Icons.account_tree_rounded,
        label: "โครงสร้างภาควิชา",
        onTap: () => Navigator.pushNamed(context,'/organization'),
      ),
      MenuItem(
        icon: Icons.people,
        label: "บุคลากรภาควิชา",
        onTap: () => Navigator.pushNamed(context,'/staff'),
      ),
     MenuItem(
        icon: Icons.phone,
        label: "ติดต่อเรา",
        onTap: () => Navigator.pushNamed(context,'/contact'),
      ),
    ];

    final List<MenuItem> menuData2 = [
      MenuItem(
        icon: Icons.book,
        label: "ปริญญาตรี CS",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/course-list.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.book_outlined,
        label: "ปริญญาตรี CSB",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/course-list-inter.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.menu_book,
        label: "ปริญญาโท CS",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/course-list_ms_cs.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.library_books,
        label: "ปริญญาโท SE",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/course-list_ms_se.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.school,
        label: "ปริญญาเอก",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/course-list_phd.jsp'),
              ),
            ),
      ),
    ];

    final List<MenuItem> menuData3 = [
      
      MenuItem(
        icon: Icons.insert_drive_file,
        label: "ข่าวสาร",
        onTap: () => Navigator.pushNamed(context,'/news'),
      ), 
    ];

    final List<MenuItem> menuData4 = [
      MenuItem(
        icon: Icons.translate,
        label: "CSB",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/csb.jsp'),
              ),
            ),
      ),
    ];
    final List<MenuItem> menuData5 = [
      MenuItem(
        icon: Icons.downloading,
        label: "นักศึกษา",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/student_download.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.download_for_offline_outlined,
        label: "บุคลากร",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/staff_download.jsp'),
              ),
            ),
      ),
    ];

    final List<MenuItem> menuData6 = [
      MenuItem(
        icon: Icons.people,
        label: "อาจารย์ที่ปรึกษา",
        onTap: () => Navigator.pushNamed(context,'/advisors'),
      ),
      MenuItem(
        icon: Icons.edit_calendar_outlined,
        label: "ปฏิทินการศึกษา",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'https://acdserv.kmutnb.ac.th/'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.table_chart_outlined,
        label: "ขบวนวิชา",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/course.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.menu_book,
        label: "คู่มือนักษา",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/guide-step.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.link,
        label: "Link สำหรับนักศึกษา",
        onTap: () => Navigator.pushNamed(context,'/studentlink')
      ),
      MenuItem(
        icon: Icons.add_link,
        label: "Link สำหรับบุคลากร",
        onTap: () => Navigator.pushNamed(context,'/stafflink')
      ),
    ];

    final List<MenuItem> menuData7 = [
      MenuItem(
        icon: Icons.attach_money,
        label: "งานการเงิน",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/reg-finance.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.article,
        label: "งานวิชาการ",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/reg-academic.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.person,
        label: "งานบุคคล",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/reg-personnel.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.school,
        label: "ระดับบัณฑิตศึกษา",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/reg-graduate-student.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.handshake,
        label: "งานกิจการนักศึกษา",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/reg-student-affairs.jsp'),
              ),
            ),
      ),
      MenuItem(
        icon: Icons.business_center,
        label: "สหกิจศึกษา",
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/reg-cooperative-education.jsp'),
              ),
            ),
      ),
    ];

    return Scaffold(
      appBar: const Appbarback(titleText: 'เมนูลัดทั้งหมด'),
      body: ListView(
        children: [
          GridMenu(title: "แนะนำภาควิชา", menuItems: menuData1),
          GridMenu(title: "หลักสูตร", menuItems: menuData2),
          GridMenu(title: "ข่าวสาร", menuItems: menuData3),
          GridMenu(title: "โครงการพิเศษ(สองภาษา)", menuItems: menuData4),
          GridMenu(title: "ดาวน์โหลด", menuItems: menuData5),
          GridMenu(title: "บริการนักศึกษา/บุคลากร", menuItems: menuData6),
          GridMenu(title: "ระเบียบ/ประกาศ", menuItems: menuData7),
        ],
      ),
    );
  }
}

// ✅ คลาสเก็บข้อมูลเมนู
