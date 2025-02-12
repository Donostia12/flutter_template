import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF0D1B2A), // Warna hitam kebiruan
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerItem(Icons.home, "Home"),
            _buildDrawerItem(Icons.info, "About Us"),
            _buildDrawerItem(Icons.build, "Services"),
            _buildDrawerItem(Icons.shopping_bag, "Products & Solutions"),
            _buildDrawerItem(Icons.article, "Blog"),
            _buildDrawerItem(Icons.work, "Portfolio"),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () {
        // Tambahkan aksi navigasi jika diperlukan
      },
    );
  }
}
