import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar di atas
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrlAbout),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten Judul dan Deskripsi Pendek
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Us",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  contentAbout,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          // Konten Berita Utama
        ],
      ),
    );
  }
}
