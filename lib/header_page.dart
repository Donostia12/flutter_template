import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  HeaderPage({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/header_pages.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Image.asset(
        'assets/images/logo_baligatra.png',
        height: 50,
      ),
      centerTitle: false,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }
}
