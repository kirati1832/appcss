import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sidebar.dart';
import 'package:appcsall/provider/loginprovider.dart'; // ✅ Import authProvider

class Sidebarmenus extends ConsumerWidget implements PreferredSizeWidget {
  const Sidebarmenus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isLoggedIn = authState.when(
      data: (auth) => auth.token != null, // ✅ ตรวจสอบว่าล็อกอินอยู่หรือไม่
      loading: () => false,
      error: (error, _) => false,
    );

    return SidebarMenu(
      menuItems: [
        MenuItem(
          icon: Icons.home,
          text: 'Home',
          onTap: () => Navigator.pushNamed(context, '/'),
        ),
        MenuItem(
          icon: Icons.book,
          text: 'About',
          onTap: () => Navigator.pushNamed(context, '/history'),
        ),

        /// ✅ แสดง `Login` และ `Signup` **ถ้ายังไม่ล็อกอิน**
        if (!isLoggedIn) ...[
          MenuItem(
            icon: Icons.signpost_outlined,
            text: 'Signup',
            onTap: () => Navigator.pushNamed(context, '/register'),
          ),
          MenuItem(
            icon: Icons.login_rounded,
            text: 'Login',
            onTap: () => Navigator.pushNamed(context, '/logins'),
          ),
        ],

        MenuItem(
          icon: Icons.person_search,
          text: 'Contact',
          onTap: () => Navigator.pushNamed(context, '/contact'),
        ),

        /// ✅ แสดง `Logout` **ถ้าผู้ใช้ล็อกอิน**
        if (isLoggedIn)
          MenuItem(
            icon: Icons.logout,
            text: 'Logout',
            onTap: () {
              ref.read(authProvider.notifier).logout();
              Navigator.pushReplacementNamed(context, '/logins');
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
