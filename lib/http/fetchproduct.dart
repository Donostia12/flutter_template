import 'package:dio/dio.dart'; // Import Dio

Future<List<ProductModel>> fetchProduct() async {
  try {
    Dio dio = Dio();

    dio.options.connectTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveTimeout = const Duration(milliseconds: 60000);

    // Menambahkan header Connection: keep-alive
    dio.options.headers = {
      'Connection': 'keep-alive',
    };

    // Melakukan GET request dengan Dio
    final response = await dio.get('http://192.168.1.5:8000/products/api');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = response.data;

      if (jsonData['success'] == true && jsonData['data'] != null) {
        List<ProductModel> newsList = [];
        for (var item in jsonData['data']) {
          newsList.add(ProductModel.fromJson(item));
        }
        return newsList;
      } else {
        throw Exception('Data tidak valid atau kosong');
      }
    } else {
      throw Exception(
          'Failed to load news. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load news: $e');
  }
}

class ProductModel {
  final String title;
  final String shortDesc;
  final String imageUrl;
  final String createdAt;
  final String desc;
  ProductModel({
    required this.title,
    required this.shortDesc,
    required this.imageUrl,
    required this.createdAt,
    required this.desc,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'] ?? 'No Title',
      shortDesc: json['short_desc'] ?? 'No Description',
      imageUrl: 'http://192.168.1.5:8000/' + (json['image'] ?? ''),
      createdAt: json['created_at'] ?? 'No Date',
      desc: json['desc'] ?? 'No Description',
    );
  }
}
