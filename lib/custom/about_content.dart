import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class AboutContent extends StatelessWidget {
  final String titleAbout;
  final String shortDescAbout;
  final String imageUrlAbout;
  final String contentAbout;

  const AboutContent({
    required this.titleAbout,
    required this.shortDescAbout,
    required this.imageUrlAbout,
    required this.contentAbout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'About Us'),
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
                  image: NetworkImage(imageUrlAbout),
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
                    titleAbout,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              contentAbout,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
