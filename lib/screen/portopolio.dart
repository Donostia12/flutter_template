import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/header_content.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class Portopolio extends StatelessWidget {
  const Portopolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Portopolio'),
      drawer: SideNavbar(),
      body: HeaderContent(title: "Portopolio", shortDesc: "empty"),
    );
  }
}
