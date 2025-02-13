import 'package:flutter/material.dart';

import 'package:template_scaffold/custom/floating_whatsapp.dart';
import 'package:template_scaffold/custom/header_content.dart';

import 'package:template_scaffold/custom/service_content.dart';
import 'package:template_scaffold/header_page.dart';
import 'package:template_scaffold/http/fetchservice.dart';

import 'package:template_scaffold/sidebar.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingWhatsApp(),
      appBar: HeaderPage(),
      endDrawer: Sidebar(),
      body: Column(
        children: [
          const HeaderContent(
            title: "Services",
            shortDesc:
                "Our services include developing web applications, internet promotion SEO, integration of computer network equipment, IT Security, IoT and Artificial Intelligence Implementors.",
          ),
          Expanded(
            // Tambahkan Expanded di sini
            child: FutureBuilder<List<ServicesModel>>(
              future: fetchService(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final newsList = snapshot.data!;

                  return ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      final news = newsList[index];
                      return ServiceContent(
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
          ),
        ],
      ),
    );
  }
}
