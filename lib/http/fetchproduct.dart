import 'package:dio/dio.dart'; // Import Dio

Future<List<ProductModel>> fetchProduct({int page = 1, int limit = 5}) async {
  try {
    // Melakukan GET request dengan Dio
    final response =
        await Dio().get('https://baligatra.com/products/api', queryParameters: {
      'page': page,
      'limit': limit,
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = response.data;

      if (jsonData['success'] == true && jsonData['data'] != null) {
        List<ProductModel> productList = [];
        for (var item in jsonData['data']) {
          productList.add(ProductModel.fromJson(item));
        }
        return productList;
      } else {
        throw Exception('Data tidak valid atau kosong');
      }
    } else {
      throw Exception(
          'Failed to load products. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load products: $e');
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
      imageUrl: 'https://baligatra.com/${json['image'] ?? ''}',
      createdAt: json['created_at'] ?? 'No Date',
      desc: json['desc'] ?? 'No Description',
    );
  }
}
