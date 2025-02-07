import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/floating_whatsapp.dart';

import 'package:template_scaffold/http/fetchportfolio.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingWhatsApp(),
      appBar: const CustomAppBar(title: 'Portopolio'),
      drawer: const SideNavbar(),
      body: FutureBuilder<List<PortfolioModel>>(
          future: fetchPortfolio(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final newsList = snapshot.data!;

              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 1), // Padding tipis di kiri dan kanan
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Menghitung lebar gambar berdasarkan lebar layar
                    final double itemWidth = constraints.maxWidth / 3 -
                        4; // Mengurangi 8 untuk padding kiri dan kanan

                    return ListView.builder(
                      itemCount: (newsList.length / 3).ceil(),
                      itemBuilder: (context, rowIndex) {
                        // Mengambil sublist untuk row
                        int startIndex = rowIndex * 3;
                        int endIndex = (startIndex + 3) < newsList.length
                            ? startIndex + 3
                            : newsList.length;

                        List<PortfolioModel> rowImages =
                            newsList.sublist(startIndex, endIndex);

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: rowImages.map((portfolio) {
                            return Padding(
                              padding: const EdgeInsets.all(
                                  2), // Padding kecil antar gambar
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    0), // Sedikit radius untuk sudut gambar
                                child: Image.network(
                                  portfolio.imageUrl,
                                  width:
                                      itemWidth, // Lebar gambar yang dihitung
                                  height:
                                      itemWidth, // Tinggi gambar yang dihitung
                                  fit: BoxFit
                                      .cover, // Menyesuaikan ukuran gambar agar tetap proporsional
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          }),
    );
  }
}
