import 'package:dio/dio.dart'; // Import Dio

Future<List<NewsModel>> fetchNews() async {
  try {
    Dio dio = Dio();

    // Menambahkan header Connection: keep-alive
    dio.options.headers = {
      'Connection': 'keep-alive',
    };

    // Melakukan GET request dengan Dio
    final response = await dio.get('http://192.168.1.2:8000/blogs/api');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = response.data;

      if (jsonData['success'] == true && jsonData['data'] != null) {
        List<NewsModel> newsList = [];
        for (var item in jsonData['data']) {
          newsList.add(NewsModel.fromJson(item));
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

class NewsModel {
  final String title;
  final String shortDesc;
  final String imageUrl;
  final String createdAt;
  final String desc;
  NewsModel({
    required this.title,
    required this.shortDesc,
    required this.imageUrl,
    required this.createdAt,
    required this.desc,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'No Title',
      shortDesc: json['short_desc'] ?? 'No Description',
      // ignore: prefer_interpolation_to_compose_strings
      imageUrl: 'http://192.168.1.2:8000/storage/images/${json['image'] ?? ''}',
      createdAt: json['created_at'] ?? 'No Date',
      desc: json['desc'] ?? 'No Description',
    );
  }
}
