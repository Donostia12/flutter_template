import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/news_content.dart';
import 'package:template_scaffold/http/fetchnews.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class BlogNews extends StatelessWidget {
  const BlogNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Blog & News'),
      drawer: const SideNavbar(),
      body: FutureBuilder<List<NewsModel>>(
        future: fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Mengiterasi seluruh data berita dan menampilkannya
            final newsList = snapshot.data!;

            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return NewsContent(
                  date: news.createdAt,
                  title: news.title,
                  imageUrl: news.imageUrl,
                  shortContent: news.shortDesc,
                  desc: news.desc,
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
