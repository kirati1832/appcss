import 'package:flutter/material.dart';
import 'package:appcsall/presentation/widget/widget.dart';
import 'url.dart';
import '../../bottom_navbar.dart';
import '../widget/menusub.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appcsall/provider/bottomnavbarprovider.dart';
class Menusubmain extends ConsumerWidget {
  const Menusubmain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);
    final navigationIndexNotifier = ref.read(navigationIndexProvider.notifier);

    final List<MenuItem> menuData1 = [
      MenuItem(
        icon: Icons.newspaper,
        label: "ประวัติภาควิชาฯ",
        onTap: () => Navigator.pushNamed(context, '/history'),
        colors: Colors.deepPurple,
      ),
      MenuItem(
        icon: Icons.account_tree_rounded,
        label: "โครงสร้างภาควิชา",
        onTap: () => Navigator.pushNamed(context, '/organization'),
        colors: Colors.deepPurple,
      ),
      MenuItem(
        icon: Icons.people,
        label: "บุคลากรภาควิชา",
        onTap: () => Navigator.pushNamed(context, '/staff'),
        colors: Colors.deepPurple,
      ),
      MenuItem(
        icon: Icons.phone,
        label: "ติดต่อเรา",
        onTap: () => Navigator.pushNamed(context, '/contact'),
        colors: Colors.deepPurple,
      ),
    ];

    final List<MenuItem> menuData2 = [
      MenuItem(
        icon: Icons.book,
        label: "ปริญญาตรี CS",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Url(url: 'http://cs.kmutnb.ac.th/course-list.jsp'),
              ),
            ),
        colors: Colors.deepOrange,
      ),
      MenuItem(
        icon: Icons.book_outlined,
        label: "ปริญญาตรี CSB",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(
                      url: 'http://cs.kmutnb.ac.th/course-list-inter.jsp',
                    ),
              ),
            ),
        colors: Colors.deepOrange,
      ),
      MenuItem(
        icon: Icons.menu_book,
        label: "ปริญญาโท CS",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(
                      url: 'http://cs.kmutnb.ac.th/course-list_ms_cs.jsp',
                    ),
              ),
            ),
        colors: Colors.deepOrange,
      ),
      MenuItem(
        icon: Icons.library_books,
        label: "ปริญญาโท SE",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(
                      url: 'http://cs.kmutnb.ac.th/course-list_ms_se.jsp',
                    ),
              ),
            ),
        colors: Colors.deepOrange,
      ),
      MenuItem(
        icon: Icons.school,
        label: "ปริญญาเอก",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Url(url: 'http://cs.kmutnb.ac.th/course-list_phd.jsp'),
              ),
            ),
        colors: Colors.deepOrange,
      ),
    ];

    final List<MenuItem> menuData3 = [
      MenuItem(
        icon: Icons.insert_drive_file,
        label: "ข่าวสาร",
        onTap: () => Navigator.pushNamed(context, '/news'),
        colors: Colors.blue.shade800,
      ),
    ];

    final List<MenuItem> menuData4 = [
      MenuItem(
        icon: Icons.translate,
        label: "CSB",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/csb.jsp'),
              ),
            ),
        colors: Colors.green.shade700,
      ),
    ];
    final List<MenuItem> menuData5 = [
      MenuItem(
        icon: Icons.downloading,
        label: "นักศึกษา",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Url(url: 'http://cs.kmutnb.ac.th/student_download.jsp'),
              ),
            ),
        colors: Colors.brown.shade800,
      ),
      MenuItem(
        icon: Icons.download_for_offline_outlined,
        label: "บุคลากร",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Url(url: 'http://cs.kmutnb.ac.th/staff_download.jsp'),
              ),
            ),
        colors: Colors.brown.shade800,
      ),
    ];

    final List<MenuItem> menuData6 = [
      MenuItem(
        icon: Icons.people,
        label: "อาจารย์ที่ปรึกษา",
        onTap: () => Navigator.pushNamed(context, '/advisors'),
        colors: Colors.pink.shade700,
      ),
      MenuItem(
        icon: Icons.edit_calendar_outlined,
        label: "ปฏิทินการศึกษา",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Url(url: 'https://acdserv.kmutnb.ac.th/'),
              ),
            ),
        colors: Colors.pink.shade700,
      ),
      MenuItem(
        icon: Icons.table_chart_outlined,
        label: "ขบวนวิชา",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(url: 'http://cs.kmutnb.ac.th/course.jsp'),
              ),
            ),
        colors: Colors.pink.shade700,
      ),
      MenuItem(
        icon: Icons.menu_book,
        label: "คู่มือนักษา",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Url(url: 'http://cs.kmutnb.ac.th/guide-step.jsp'),
              ),
            ),
        colors: Colors.pink.shade700,
      ),
      MenuItem(
        icon: Icons.link,
        label: "Link สำหรับนักศึกษา",
        onTap: () => Navigator.pushNamed(context, '/studentlink'),
        colors: Colors.pink.shade700,
      ),
      MenuItem(
        icon: Icons.add_link,
        label: "Link สำหรับบุคลากร",
        onTap: () => Navigator.pushNamed(context, '/stafflink'),
        colors: Colors.pink.shade700,
      ),
    ];

    final List<MenuItem> menuData7 = [
      MenuItem(
        icon: Icons.attach_money,
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
        colors: Colors.black,
      ),
      MenuItem(
        icon: Icons.article,
        label: "งานวิชาการ",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Url(url: 'http://cs.kmutnb.ac.th/reg-academic.jsp'),
              ),
            ),
        colors: Colors.black,
      ),
      MenuItem(
        icon: Icons.person,
        label: "งานบุคคล",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        Url(url: 'http://cs.kmutnb.ac.th/reg-personnel.jsp'),
              ),
            ),
        colors: Colors.black,
      ),
      MenuItem(
        icon: Icons.school,
        label: "ระดับบัณฑิตศึกษา",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(
                      url: 'http://cs.kmutnb.ac.th/reg-graduate-student.jsp',
                    ),
              ),
            ),
        colors: Colors.black,
      ),
      MenuItem(
        icon: Icons.handshake,
        label: "งานกิจการนักศึกษา",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(
                      url: 'http://cs.kmutnb.ac.th/reg-student-affairs.jsp',
                    ),
              ),
            ),
        colors: Colors.black,
      ),
      MenuItem(
        icon: Icons.business_center,
        label: "สหกิจศึกษา",
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Url(
                      url:
                          'http://cs.kmutnb.ac.th/reg-cooperative-education.jsp',
                    ),
              ),
            ),
        colors: Colors.black,
      ),
    ];

    return Scaffold(
      appBar: const Appbarback(titleText: 'เมนูลัดทั้งหมด'),
      backgroundColor: const Color.fromARGB(255, 236, 233, 233),
     bottomNavigationBar: BottomNavbar(
        onTap: (index) {
          if (currentIndex == index) return; // ป้องกันการกดซ้ำหน้าเดิม
          
          navigationIndexNotifier.updateIndex(index); // อัปเดต index

          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/news');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/student');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/staff');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/submenu');
              break;
          }
        },
      ),
      body: ListView(
        children: [
          GridMenu(
            title: "แนะนำภาควิชา",
            menuItems: menuData1,
            titleColor: Colors.black,
          ),
          GridMenu(
            title: "หลักสูตร",
            menuItems: menuData2,
            titleColor: Colors.black,
          ),
          GridMenu(
            title: "ข่าวสาร",
            menuItems: menuData3,
            titleColor: Colors.black,
          ),
          GridMenu(
            title: "โครงการพิเศษ(สองภาษา)",
            menuItems: menuData4,
            titleColor: Colors.black,
          ),
          GridMenu(
            title: "ดาวน์โหลด",
            menuItems: menuData5,
            titleColor: Colors.black,
          ),
          GridMenu(
            title: "บริการนักศึกษา/บุคลากร",
            menuItems: menuData6,
            titleColor: Colors.black,
          ),
          GridMenu(
            title: "ระเบียบ/ประกาศ",
            menuItems: menuData7,
            titleColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
