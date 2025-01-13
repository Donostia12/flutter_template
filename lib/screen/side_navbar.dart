import 'package:flutter/material.dart';
import 'package:template_scaffold/color/steamcolor.dart';
import 'package:template_scaffold/main.dart';
import 'package:template_scaffold/screen/blog/blog_news.dart';
import 'package:template_scaffold/screen/portopolio.dart';
import 'package:template_scaffold/screen/product.dart';
import 'package:template_scaffold/screen/service_view.dart';

class SideNavbar extends StatelessWidget {
  const SideNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/header_pages.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.menu_book,
                  color: SteamColors.primaryText,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Menu Side Bar',
                  style: TextStyle(
                    color: SteamColors.primaryText,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            iconColor: SteamColors.bottomBarBackground,
            leading: const Icon(Icons.home),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
            title: const Text('Home'),
          ),
          ExpansionTile(
            title: const Text('About Us'),
            leading: const Icon(Icons.person),
            children: [
              ListTile(
                leading: const Icon(Icons.web),
                title: const Text('Services'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ServiceView()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.adb_outlined),
                title: Text('product'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Product()));
                },
              ),
            ],
          ),
          ListTile(
            iconColor: SteamColors.bottomBarBackground,
            leading: const Icon(Icons.newspaper),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BlogNews()),
              );
            },
            title: const Text('Blog'),
          ),
          ListTile(
            iconColor: SteamColors.bottomBarBackground,
            leading: const Icon(Icons.contact_page),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Portopolio()),
              );
            },
            title: const Text('Portopolio'),
          ),
        ],
      ),
    );
  }
}
