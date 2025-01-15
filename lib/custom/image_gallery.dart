import 'package:flutter/material.dart';

class ImageGallery extends StatelessWidget {
  final String imageUrls;

  const ImageGallery({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Pisahkan URL berdasarkan '\n' untuk mendapatkan daftar gambar
    final List<String> imageList =
        imageUrls.split('\n').where((url) => url.isNotEmpty).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true, // Agar GridView tidak memenuhi seluruh layar
        physics:
            const NeverScrollableScrollPhysics(), // Non-scroll untuk integrasi dalam ListView
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 kolom per row
          crossAxisSpacing: 8.0, // Jarak antar kolom
          mainAxisSpacing: 8.0, // Jarak antar row
        ),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageList[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.broken_image,
                size: 50,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
