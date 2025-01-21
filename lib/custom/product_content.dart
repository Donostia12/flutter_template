import 'package:flutter/material.dart';

import 'package:template_scaffold/screen/product/detail_product.dart';

class ProductContent extends StatelessWidget {
  ProductContent({
    super.key,
    required this.title,
    required this.content,
    required this.shortContent,
    required this.img_url,
  });

  final String title;
  final String content;
  final String shortContent;
  final String img_url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      height: 200,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 150,
              width: 150,
              child: Image.network(
                img_url,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      shortContent.length > 80
                          ? "${shortContent.substring(0, 80)}..."
                          : shortContent,
                      style: TextStyle(fontSize: 14),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailProduct(
                                titleproduct: title,
                                shortDescproduct: shortContent,
                                imageUrlproduct: img_url,
                                contentproduct: content,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          textStyle: const TextStyle(fontSize: 14),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          side: const BorderSide(
                              color: Color.fromARGB(157, 4, 41, 84)),
                        ),
                        child: Text('Read More'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
