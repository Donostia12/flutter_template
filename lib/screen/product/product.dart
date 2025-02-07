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
            final productList = snapshot.data!;
            return AnimatedList(
              initialItemCount: productList.length,
              itemBuilder: (context, index, animation) {
                final product = productList[index];
                return SlideTransition(
                  position: animation.drive(Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeInOut))),
                  child: ProductContent(
                    title: product.title,
                    shortContent: product.shortDesc,
                    img_url: product.imageUrl,
                    content: product.desc,
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
