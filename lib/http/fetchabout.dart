import 'package:dio/dio.dart'; // Import Dio

Future<List<AboutModel>> fetchAbout() async {
  try {
    Dio dio = Dio();

    dio.options.headers = {
      'Connection': 'keep-alive',
    };

    final response = await dio.get('https://baligatra.com/about/api');

    if (response.statusCode == 200) {
      final jsonData = response.data as Map<String, dynamic>;

      if (jsonData['success'] == true && jsonData['data'] != null) {
        List<AboutModel> aboutList = [];
        for (var item in jsonData['data']) {
          aboutList.add(AboutModel.fromJson(item));
        }
        return aboutList;
      } else {
        throw Exception('Data tidak valid atau kosong');
      }
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load data: $e');
  }
}

class AboutModel {
  final String title;
  final String shortDesc;
  final String imageUrl;
  final String createdAt;
  final String desc;

  AboutModel({
    required this.title,
    required this.shortDesc,
    required this.imageUrl,
    required this.createdAt,
    required this.desc,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      title: json['title'] ?? 'No Title',
      shortDesc: json['short_desc'] ?? 'No Description',
      imageUrl: 'https://baligatra.com/${json['image'] ?? ''}',
      createdAt: json['created_at'] ?? 'No Date',
      desc: json['content_desc'] ?? 'No Description',
    );
  }
}
