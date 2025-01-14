import 'package:flutter/material.dart';

class ServiceContent extends StatelessWidget {
  final String title;
  final String date;
  final String shortContent;
  final String imageUrl;
  final String desc;

  const ServiceContent({
    super.key,
    required this.title,
    required this.date,
    required this.shortContent,
    required this.imageUrl,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar di sebelah kiri
          Expanded(
            flex: 1, // Lebar relatif untuk gambar
            child: Container(
              height: 150, // Tinggi gambar
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.circular(8), // Border radius untuk gambar
              ),
            ),
          ),
          const SizedBox(width: 16), // Spasi antara gambar dan deskripsi

          // Kolom untuk teks (deskripsi)
          Expanded(
            flex: 2, // Lebar relatif untuk teks
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  shortContent,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 7),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk navigasi ke detail berita
                  },
                  child: const Text("Read More"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
