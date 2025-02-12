import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/about_content.dart';

import 'package:template_scaffold/custom/floating_whatsapp.dart';
import 'package:template_scaffold/header_page.dart';

import 'package:template_scaffold/http/fetchabout.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingWhatsApp(),
      appBar: HeaderPage(),
      drawer: const SideNavbar(),
      body: FutureBuilder<List<AboutModel>>(
        future: fetchAbout(),
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
                return AboutContent(
                    titleAbout: news.title,
                    shortDescAbout: news.shortDesc,
                    imageUrlAbout: news.imageUrl,
                    contentAbout: news.desc);
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
