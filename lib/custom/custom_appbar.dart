import 'package:flutter/material.dart';
import 'package:template_scaffold/color/steamcolor.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleTextStyle: const TextStyle(
        color: SteamColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor:
          Colors.transparent, // Agar gambar latar belakang terlihat
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/header_pages.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60); // Tentukan tinggi AppBar
}
