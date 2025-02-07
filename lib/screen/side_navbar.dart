import 'package:flutter/material.dart';
import 'package:template_scaffold/color/steamcolor.dart';
import 'package:template_scaffold/main.dart';
import 'package:template_scaffold/screen/about/about_us.dart';
import 'package:template_scaffold/screen/blog/blog_news.dart';
import 'package:template_scaffold/screen/portopolio.dart';
import 'package:template_scaffold/screen/product/product.dart';
import 'package:template_scaffold/screen/service/service_view.dart';

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
                _createRoute(const MyApp()),
              );
            },
            title: const Text('Home'),
          ),
          ExpansionTile(
            title: const Text('Our Profile'),
            leading: const Icon(Icons.work_outline_rounded),
            children: [
              ListTile(
                leading: const Icon(Icons.person_3),
                title: const Text('About Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    _createRoute(const AboutUs()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.web),
                title: const Text('Services'),
                onTap: () {
                  Navigator.push(
                    context,
                    _createRoute(const ServiceView()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.adb_outlined),
                title: const Text('product'),
                onTap: () {
                  Navigator.push(
                    context,
                    _createRoute(const Product()),
                  );
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
                _createRoute(const BlogNews()),
              );
            },
            title: const Text('Blogs'),
          ),
          ListTile(
            iconColor: SteamColors.bottomBarBackground,
            leading: const Icon(Icons.contact_page),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                _createRoute(const Portfolio()),
              );
            },
            title: const Text('Portfolio'),
          ),
        ],
      ),
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(seconds: 1),
    );
  }
}
