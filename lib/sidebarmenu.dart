import 'package:flutter/material.dart';
import 'sidebar.dart';
class Sidebarmenus extends StatelessWidget {
  const Sidebarmenus({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarMenu(
        menuItems: [
          MenuItem(
            icon: Icons.home,
            text: 'หน้าหลัก',
            onTap: () => print("Navigating to Home"),
          ),
          MenuItem(
            icon: Icons.book,
            text: 'แนะนำภาควิชาฯ',
            onTap: () => print("Navigating to Shop"),
            subItems: [
              MenuItem(
                icon: Icons.local_offer,
                text: 'ประวัติภาควิชา',
                onTap: () => print("Navigating to Offers"),
              ),
              MenuItem(
                icon: Icons.system_security_update,
                text: 'โครงสร้างภาควิชา',
                onTap: () => print("Navigating to Categories"),
              ),
              MenuItem(
                icon: Icons.people_alt,
                text: 'บุคลากรสายวิชา',
                onTap: () => print("Navigating to Categories"),
              ),
              MenuItem(
                icon: Icons.people_alt_outlined,
                text: 'บุคลากรสายสนับสนุน',
                onTap: () => print("Navigating to Categories"),
              ),
              MenuItem(
                icon: Icons.mail,
                text: 'ติดต่อเรา',
                onTap: () => print("Navigating to Categories"),
              ),
            ],
          ),
          MenuItem(
              icon: Icons.settings,
              text: 'หลักสูตร',
              onTap: () => print("Navigating to Settings"),
              subItems: [
                MenuItem(
                    icon: Icons.people,
                    text: 'ปริญญาตรี',
                    onTap: () => print("Navigating to Categories"),
                    subItems: [
                      MenuItem(
                        icon: Icons.people,
                        text: 'ภาคปกติ',
                        onTap: () => print("Navigating to Categories"),
                      ),
                      MenuItem(
                        icon: Icons.language,
                        text: 'โครงการพิเศษ สองภาษา',
                        onTap: () => print("Navigating to Categories"),
                      ),
                    ]),
                MenuItem(
                    icon: Icons.people_alt_outlined,
                    text: 'ปริญญาโท',
                    onTap: () => print("Navigating to Categories"),
                    subItems: [
                      MenuItem(
                        icon: Icons.computer,
                        text: 'สาขาวิชาวิทยาการคอมพิวเตอร์',
                        onTap: () => print("Navigating to Categories"),
                      ),
                      MenuItem(
                        icon: Icons.engineering,
                        text: 'สาขาวิชาวิศวกรรมซอฟแวร์',
                        onTap: () => print("Navigating to Categories"),
                      ),
                    ]),
                MenuItem(
                  icon: Icons.people_alt_rounded,
                  text: 'ปริญญาเอก',
                  onTap: () => print("Navigating to Categories"),
                ),
              ]),
          MenuItem(
            icon: Icons.newspaper,
            text: 'ข่าวสารและกิจกรรม',
            onTap: () => print("Navigating to Shop"),
            subItems: [
              MenuItem(
                icon: Icons.local_offer,
                text: 'ข่าวภาควิชาฯ',
                onTap: () => print("Navigating to Offers"),
              ),
              MenuItem(
                icon: Icons.school_outlined,
                text: 'ข่าวคณะและมหาลัย',
                onTap: () => print("Navigating to Categories"),
              ),
              MenuItem(
                icon: Icons.money,
                text: 'ข่าวทุนการศึกษา',
                onTap: () => print("Navigating to Categories"),
              ),
              MenuItem(
                icon: Icons.handshake,
                text: 'ข่าวรับสมัคงาน/ประชาสัมพันธ์',
                onTap: () => print("Navigating to Categories"),
              )
            ],
          ),
          MenuItem(
            icon: Icons.language_outlined,
            text: 'โครงการพิเศษ(สองภาษา)',
            onTap: () => print("Navigating to Categories"),
          ),
          MenuItem(
              icon: Icons.download,
              text: 'ดาวน์โหลด',
              onTap: () => print("Navigating to Shop"),
              subItems: [
                MenuItem(
                  icon: Icons.people,
                  text: 'นักศึกษา',
                  onTap: () => print("Navigating to Offers"),
                ), MenuItem(
                  icon: Icons.people_alt,
                  text: 'บุคลากร',
                  onTap: () => print("Navigating to Offers"),
                ),
              ]),
               MenuItem(
              icon: Icons.people_alt_sharp,
              text: 'บริการนักศึกษา/บุคลากร',
              onTap: () => print("Navigating to Shop"),
              subItems: [
                MenuItem(
                  icon: Icons.people_alt_outlined,
                  text: 'อาจารย์ที่ปรึกษา',
                  onTap: () => print("Navigating to Offers"),
                ),MenuItem(
                  icon: Icons.calendar_month,
                  text: 'ปฏิทินการศึกษา',
                  onTap: () => print("Navigating to Offers"),
                ),MenuItem(
                  icon: Icons.book_online,
                  text: 'ขบวนวิชา',
                  onTap: () => print("Navigating to Offers"),
                ),MenuItem(
                  icon: Icons.people_outline,
                  text: 'คู่มือนักศึกษา',
                  onTap: () => print("Navigating to Offers"),
                ),MenuItem(
                  icon: Icons.link,
                  text: 'Link สำหรับนักศึกษา',
                  onTap: () => print("Navigating to Offers"),
                ),MenuItem(
                  icon: Icons.link_outlined,
                  text: 'Link สำหรับบุคลากร',
                  onTap: () => print("Navigating to Offers"),
                ),]),
                MenuItem(
              icon: Icons.campaign,
              text: 'ระเบียบ/ประกาศ',
              onTap: () => print("Navigating to Shop"),
              subItems: [
                MenuItem(
                  icon: Icons.money_rounded,
                  text: 'งานการเงิน',
                  onTap: () => print("Navigating to Offers"),
                ),
                MenuItem(
                  icon: Icons.book_online,
                  text: 'งานวิชาการ',
                  onTap: () => print("Navigating to Offers"),
                ),
                MenuItem(
                  icon: Icons.people,
                  text: 'งานบุคคล',
                  onTap: () => print("Navigating to Offers"),
                ),
                MenuItem(
                  icon: Icons.school,
                  text: 'ระดับบัณฑิตศึกษา',
                  onTap: () => print("Navigating to Offers"),
                ),
                MenuItem(
                  icon: Icons.people_alt_outlined,
                  text: 'งานกิจการนักศึกษา',
                  onTap: () => print("Navigating to Offers"),
                ),
                MenuItem(
                  icon: Icons.schedule,
                  text: 'สหกิจศึกษา',
                  onTap: () => print("Navigating to Offers"),
                ),])
        ],
      );
  }
}