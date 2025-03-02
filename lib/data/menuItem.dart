import 'package:flutter/material.dart';
class MenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  MenuItem({required this.icon, required this.label, required this.onTap});
}
//  launchUrl(Uri.parse(link["url"]!)),