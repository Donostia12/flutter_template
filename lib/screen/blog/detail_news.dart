import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/floating_whatsapp.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class DetailNews extends StatelessWidget {
  final String titlenews;
  final String shortDescNews;
  final String imageUrlNews;
  final String createdAtNews;
  final String contentNews;

  const DetailNews({
    required this.titlenews,
    required this.shortDescNews,
    required this.imageUrlNews,
    required this.createdAtNews,
    required this.contentNews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingWhatsApp(),
      appBar: const CustomAppBar(title: 'Detail News'),
      drawer: const SideNavbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrlNews),
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
                    titlenews,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Published on: $createdAtNews',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Html(
              data: contentNews,
              style: {
                "p": Style(
                  fontSize: FontSize(16),
                  textAlign: TextAlign.justify,
                ),
                "h2": Style(
                  fontSize: FontSize(24),
                  fontWeight: FontWeight.bold,
                ),
                "h3": Style(
                  fontSize: FontSize(20),
                  fontWeight: FontWeight.bold,
                ),
                "h4": Style(
                  fontSize: FontSize(18),
                  fontWeight: FontWeight.bold,
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
