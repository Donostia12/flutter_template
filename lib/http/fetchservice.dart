import 'package:dio/dio.dart'; // Import Dio

Future<List<ServicesModel>> fetchService() async {
  try {
    Dio dio = Dio();

    // Menambahkan header Connection: keep-alive
    dio.options.headers = {
      'Connection': 'keep-alive',
    };

    // Melakukan GET request dengan Dio
    final response = await dio.get('https://baligatra.com/services/api');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = response.data;

      if (jsonData['success'] == true && jsonData['data'] != null) {
        List<ServicesModel> newsList = [];
        for (var item in jsonData['data']) {
          newsList.add(ServicesModel.fromJson(item));
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

class ServicesModel {
  final String title;
  final String shortDesc;
  final String imageUrl;
  final String createdAt;
  final String desc;
  ServicesModel({
    required this.title,
    required this.shortDesc,
    required this.imageUrl,
    required this.createdAt,
    required this.desc,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      title: json['title'] ?? 'No Title',
      shortDesc: json['short_desc'] ?? 'No Description',
      imageUrl: 'https://baligatra.com/${json['image'] ?? ''}',
      createdAt: json['created_at'] ?? 'No Date',
      desc: json['desc'] ?? 'No Description',
    );
  }
}
