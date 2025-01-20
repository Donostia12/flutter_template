import 'package:flutter/material.dart';

import 'package:template_scaffold/screen/product/detail_product.dart';

class ProductContent extends StatelessWidget {
  ProductContent(
      {super.key,
      required this.title,
      required this.content,
      required this.shortContent,
      required this.img_url});

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
          crossAxisAlignment:
              CrossAxisAlignment.start, // Pastikan konten sejajar di atas
          children: <Widget>[
            Image.network(
              img_url,
              fit: BoxFit.cover,
              width: 150,
              height: 150,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.error,
                  size: 150,
                  color: Colors.yellow,
                ); // Menampilkan ikon error jika gambar gagal
              },
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5), // Padding agar lebih nyaman dibaca
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Agar teks rata kiri
                  children: <Widget>[
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 2, // Batasi jumlah baris jika terlalu panjang
                      overflow: TextOverflow
                          .ellipsis, // Tambahkan "..." jika teks terlalu panjang
                    ),
                    SizedBox(height: 5), // Jarak antara title dan shortContent
                    Text(
                      shortContent.length > 80
                          ? "${shortContent.substring(0, 80)}..."
                          : shortContent,
                      style: TextStyle(fontSize: 14), // Ukuran font lebih kecil
                    ),
                    // Jarak sebelum tombolrigcenterRight
                    Align(
                      alignment: Alignment.centerRight, // Tombol rata kanan
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailProduct(
                                      titleproduct: title,
                                      shortDescproduct: shortContent,
                                      imageUrlproduct: img_url,
                                      contentproduct: content)));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            textStyle: const TextStyle(fontSize: 14),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            side: const BorderSide(
                                color: const Color.fromARGB(157, 4, 41, 84))),
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
