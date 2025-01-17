import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/product_content.dart';
import 'package:template_scaffold/http/fetchproduct.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Product'),
      drawer: SideNavbar(),
      body: FutureBuilder<List<ProductModel>>(
          future: fetchProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final newsList = snapshot.data!;
              return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final news = newsList[index];
                  return ProductContent(
                      title: news.title,
                      shortContent: news.shortDesc,
                      img_url: news.imageUrl,
                      content: news.desc);
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          }),
    );
  }
}
