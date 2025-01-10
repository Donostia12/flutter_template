import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoadImage extends StatefulWidget {
  final String imageUrl;

  const LoadImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _LoadImageState createState() => _LoadImageState();
}

class _LoadImageState extends State<LoadImage> {
  Image? image;

  @override
  void initState() {
    super.initState();
    _loadImage(widget
        .imageUrl); // Panggil fungsi untuk memuat gambar saat inisialisasi
  }

  Future<void> _loadImage(String url) async {
    try {
      var response = await Dio()
          .get(url, options: Options(responseType: ResponseType.bytes));
      setState(() {
        // Menggunakan bytes untuk memuat gambar
        image = Image.memory(response.data);
      });
    } catch (e) {
      print("Error loading image: $e");
      setState(() {
        image = Image.asset(
            'assets/images/404_image.jpg'); // Ganti dengan gambar error jika ada
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return const Center(
          child:
              CircularProgressIndicator()); // Menampilkan loader jika gambar sedang dimuat
    } else {
      return image!;
    }
  }
}
