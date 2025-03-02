import 'package:flutter/material.dart';

class GridMenu extends StatelessWidget {
  final String title;
  final List<MenuItem> menuItems;

  const GridMenu({Key? key, required this.title, required this.menuItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ หัวข้อหลัก (Title) สีดำ
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Card.filled(color: Colors.blueAccent,child: Text('|',style: TextStyle(color: Colors.blueAccent),)),
                  SizedBox(width: 5,),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // ✅ GridView แสดงเมนู
        Container(
          color: Colors.white, // ✅ พื้นหลังสีขาว
          padding: const EdgeInsets.all(14),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // ✅ แถวละ 4 ไอคอน
              childAspectRatio: 0.8, // ✅ อัตราส่วนทำให้ปุ่มสมดุล
            ),
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return GestureDetector(
                onTap: item.onTap, // ✅ กดแล้วทำงานตาม onTap
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ✅ ไอคอน (สี BlueAccent)
                    Icon(item.icon, size: 45, color: Colors.blueAccent),

                    // ✅ ชื่อเมนู (สี BlueAccent)
                    const SizedBox(height: 5),
                    Text(
                      item.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
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