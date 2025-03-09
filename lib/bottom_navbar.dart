import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appcsall/provider/bottomnavbarprovider.dart';
// ใช้ ConsumerWidget เพื่อให้สามารถอ่านค่า currentIndex จาก Riverpod
class BottomNavbar extends ConsumerWidget {
  final Function(int) onTap;
  const BottomNavbar({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider); // อ่านค่า currentIndex จาก Provider

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue, // สีของไอคอนที่เลือก
      unselectedItemColor: Colors.grey, // สีของไอคอนที่ไม่ได้เลือก
      currentIndex: currentIndex,
      onTap: (index) {
        if (currentIndex != index) {
          ref.read(navigationIndexProvider.notifier).updateIndex(index); // อัปเดตค่า index
          onTap(index);
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.article), label: 'News'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'นักศึกษา'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'บุคลากร'),
        BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'เมนู'),
      ],
    );
  }
}
