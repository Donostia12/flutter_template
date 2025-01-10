import 'package:flutter/material.dart';

import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/header_content.dart';
import 'package:template_scaffold/custom/news_content.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Service',
      ),
      drawer: SideNavbar(),
      body: Column(
        children: [
          HeaderContent(
            title: "Services",
            shortDesc:
                "Our services include developing web applications, internet promotion SEO, integration of computer network equipment, IT Security, IoT and Artificial Intelligence Implementors.",
          ),
          NewsContent(
              date: "Senin, 9 Januari 2025",
              title:
                  "Website Creation Services in Bali Digital Solutions for Your Business",
              imageUrl:
                  "http://192.168.1.5:91/images/openart-image_6f494exJ_1725241969371_raw.jpg",
              shortContent:
                  "The primary purpose of the web application is to facilitate the performance of certain tasks by the user.",
              desc: "empty"),
        ],
      ),
    );
  }
}
