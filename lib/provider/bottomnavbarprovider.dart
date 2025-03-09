import 'package:flutter_riverpod/flutter_riverpod.dart';

// สร้าง StateNotifier สำหรับจัดการ currentIndex
class NavigationIndexNotifier extends StateNotifier<int> {
  NavigationIndexNotifier() : super(2); // ค่าเริ่มต้นเป็น Home

  void updateIndex(int newIndex) => state = newIndex;
}

// สร้าง Provider ที่ใช้ได้ในทุกหน้า
final navigationIndexProvider =
    StateNotifierProvider<NavigationIndexNotifier, int>(
  (ref) => NavigationIndexNotifier(),
);
