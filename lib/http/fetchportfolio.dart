import 'package:dio/dio.dart'; // Import Dio

Future<List<PortfolioModel>> fetchPortfolio() async {
  try {
    Dio dio = Dio();

    dio.options.headers = {
      'Connection': 'keep-alive',
    };

    final response = await dio.get('http://192.168.1.7:8000/blogs/api');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = response.data;

      if (jsonData['success'] == true && jsonData['data'] != null) {
        List<PortfolioModel> newsList = [];
        for (var item in jsonData['data']) {
          newsList.add(PortfolioModel.fromJson(item));
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

class PortfolioModel {
  final String imageUrl;

  PortfolioModel({
    required this.imageUrl,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      imageUrl: 'http://192.168.1.5:8000/' + (json['image'] ?? ''),
    );
  }
}
