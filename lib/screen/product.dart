import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/header_content.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class Product extends StatelessWidget {
  const Product({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Product'),
      drawer: SideNavbar(),
      body: HeaderContent(title: "Product", shortDesc: "empty"),
    );
  }
}
