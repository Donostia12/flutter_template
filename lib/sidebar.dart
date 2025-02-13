import 'package:flutter/material.dart';
import 'package:template_scaffold/main.dart';
import 'package:template_scaffold/screen/about/about_us.dart'; // Pastikan impor ini benar
import 'package:template_scaffold/screen/service/service_view.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF0D1B2A), // Warna hitam kebiruan
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerItem(Icons.home, "Home", context),
            _buildDrawerItem(Icons.info, "About Us", context),
            _buildDrawerItem(Icons.build, "Services", context),
            _buildDrawerItem(
                Icons.shopping_bag, "Products & Solutions", context),
            _buildDrawerItem(Icons.article, "Blog", context),
            _buildDrawerItem(Icons.work, "Portfolio", context),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () {
        switch (title) {
          case "About Us":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUs()),
            );
            break;
          case "Home":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            break;
          case "Services":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServiceView()),
            );
            break;
          case "Products & Solutions":
            // Navigasi untuk "Products & Solutions"
            break;
          case "Blog":
            // Navigasi untuk "Blog"
            break;
          case "Portfolio":
            // Navigasi untuk "Portfolio"
            break;
          default:
            break;
        }
      },
    );
  }
}
