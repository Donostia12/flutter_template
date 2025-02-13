import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      backgroundColor: const Color.fromARGB(0, 252, 252, 252),
      elevation: 0,
      title: Image.asset(
        'assets/images/logo_baligatra.png',
        height: 50,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white, // Change the color to white
      ),
      systemOverlayStyle: SystemUiOverlayStyle
          .light, // Add this line to set the overlay style to light
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu,
                color: const Color.fromARGB(255, 255, 255, 255)),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }
}
