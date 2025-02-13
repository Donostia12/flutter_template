import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/floating_whatsapp.dart';
import 'package:template_scaffold/header_page.dart';
import 'package:template_scaffold/screen/side_navbar.dart';
import 'package:template_scaffold/sidebar.dart';

class DetailProduct extends StatelessWidget {
  final String titleproduct;
  final String shortDescproduct;
  final String imageUrlproduct;

  final String contentproduct;

  const DetailProduct({
    required this.titleproduct,
    required this.shortDescproduct,
    required this.imageUrlproduct,
    required this.contentproduct,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingWhatsApp(),
      appBar: HeaderPage(),
      endDrawer: Sidebar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrlproduct),
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
                    titleproduct,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              contentproduct,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
