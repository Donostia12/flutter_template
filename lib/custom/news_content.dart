import 'package:flutter/material.dart';
import 'package:template_scaffold/screen/blog/detail_news.dart';

class NewsContent extends StatelessWidget {
  final String title;
  final String date;
  final String shortContent;
  final String imageUrl;
  final String desc;

  const NewsContent({
    super.key,
    required this.title,
    required this.date,
    required this.shortContent,
    required this.imageUrl,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Berita
            Container(
              height: 200,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailNews(
                              titlenews: title,
                              createdAtNews: date,
                              shortDescNews: shortContent,
                              imageUrlNews: imageUrl,
                              contentNews: desc,
                            )),
                  );
                },
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  headers: const {
                    'Connection': 'keep-alive', // Menjaga koneksi tetap hidup
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, size: 50, color: Colors.red);
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(
                  date,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              shortContent,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
