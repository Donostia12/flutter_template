import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/Detail_content.dart';

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
                headers: const {
                  'Connection': 'keep-alive', // Menjaga koneksi tetap hidup
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 50, color: Colors.red);
                },
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
                              builder: (context) => DetailContent(
                                titlenews: title,
                                shortDescNews: shortContent,
                                imageUrlNews: img_url,
                                contentNews: content,
                                createdAtNews: '',
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
