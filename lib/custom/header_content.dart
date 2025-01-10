import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  // Mendeklarasikan title dan shortDesc sebagai parameter konstruktor
  final String title;
  final String shortDesc;

  const HeaderContent({
    super.key,
    required this.title,
    required this.shortDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menampilkan title
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
              height: 10), // Memberikan jarak antara title dan shortDesc

          // Menampilkan shortDesc
          Text(
            shortDesc,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
