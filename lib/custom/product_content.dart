import 'package:flutter/material.dart';
import 'package:template_scaffold/screen/blog/detail_news.dart';

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
              width: 150, // Tambahkan lebar agar gambar tidak terlalu besar
              height: 150, // Tambahkan tinggi agar gambar tetap proporsional
              fit: BoxFit.cover, // Pastikan gambar tidak pecah
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
                      shortContent.length > 50
                          ? "${shortContent.substring(0, 170)}..."
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
                                  builder: (context) => DetailNews(
                                      titlenews: title,
                                      shortDescNews: shortContent,
                                      imageUrlNews: img_url,
                                      contentNews: content)));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            textStyle: const TextStyle(fontSize: 14),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            side: BorderSide(
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
