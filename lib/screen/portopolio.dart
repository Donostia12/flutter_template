import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/header_content.dart';
import 'package:template_scaffold/custom/image_gallery.dart';
import 'package:template_scaffold/http/fetchportfolio.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Portopolio'),
      drawer: SideNavbar(),
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
                padding: const EdgeInsets.all(8.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Menghitung lebar gambar berdasarkan lebar layar
                    final double itemWidth = constraints.maxWidth / 3 -
                        16; // 16 untuk padding antara gambar

                    return ListView.builder(
                      itemCount:
                          (newsList.length / 3).ceil(), // Menghitung jumlah row
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
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  portfolio
                                      .imageUrl, // Asumsi portfolio memiliki imageUrl
                                  width: itemWidth,
                                  height:
                                      itemWidth, // Sesuaikan dengan lebar agar persegi
                                  fit: BoxFit.cover,
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
