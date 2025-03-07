import 'package:flutter/material.dart';
import 'sidebar.dart';

class Sidebarmenus extends StatelessWidget implements PreferredSizeWidget {
  const Sidebarmenus({super.key});

  @override
  Widget build(BuildContext context) {
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
         MenuItem(
          icon: Icons.exit_to_app,
          text: 'Signout',
          onTap: () => {},
        ),
        MenuItem(
          icon: Icons.person_search,
          text: 'Contact',
          onTap: () => Navigator.pushNamed(context, '/contact'),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
