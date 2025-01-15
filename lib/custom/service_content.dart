import 'package:flutter/material.dart';
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailNews(
                                title_news: title,
                                createdAt_news: date,
                                shortDesc_news: shortContent,
                                imageUrl_news: imageUrl,
                                content_news: desc,
                              )),
                    );
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
