import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/header_content.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class DetailNews extends StatelessWidget {
  final String title_news;
  final String shortDesc_news;
  final String imageUrl_news;
  final String createdAt_news;
  final String content_news;

  DetailNews({
    required this.title_news,
    required this.shortDesc_news,
    required this.imageUrl_news,
    required this.createdAt_news,
    required this.content_news,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Detail News'),
      drawer: SideNavbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Header
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl_news),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Konten Berita
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title_news,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Published on: $createdAt_news',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              content_news,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
