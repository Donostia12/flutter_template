import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/Detail_content.dart';
import 'package:template_scaffold/screen/blog/detail_news.dart';

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
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Pastikan tinggi sejajar
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons
                          .error); // Menampilkan ikon error jika gambar gagal
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Distribusi elemen agar rapi
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Text(
                      shortContent.length > 150
                          ? "${shortContent.substring(0, 150)}..."
                          : shortContent,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                      maxLines: 3,
                      overflow:
                          TextOverflow.ellipsis, // Mencegah teks melebihi batas
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailContent(
                              titlenews: title,
                              createdAtNews: date,
                              shortDescNews: shortContent,
                              imageUrlNews: imageUrl,
                              contentNews: desc,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          textStyle: const TextStyle(fontSize: 14),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          side: const BorderSide(
                              color: const Color.fromARGB(157, 4, 41, 84))),
                      child: Text('Read More'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
