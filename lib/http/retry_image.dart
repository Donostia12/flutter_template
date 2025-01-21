import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RetryImageLoader extends StatefulWidget {
  final String imgUrl;

  const RetryImageLoader({Key? key, required this.imgUrl}) : super(key: key);

  @override
  _RetryImageLoaderState createState() => _RetryImageLoaderState();
}

class _RetryImageLoaderState extends State<RetryImageLoader> {
  bool _isLoading = true;
  bool _hasError = false;

  Future<void> _loadImage() async {
    while (true) {
      try {
        // Coba request untuk gambar
        final response = await http.get(Uri.parse(widget.imgUrl)).timeout(
          const Duration(seconds: 5),
          onTimeout: () {
            return http.Response('Timeout', 408);
          },
        );

        // Periksa status code response
        if (response.statusCode == 200) {
          // Jika berhasil, keluar dari loop
          setState(() {
            _isLoading = false;
            _hasError = false;
          });
          break;
        } else if (response.statusCode == 404) {
          // Jika gambar tidak ditemukan, tampilkan error dan keluar
          setState(() {
            _isLoading = false;
            _hasError = true;
          });
          break;
        } else {
          // Menangani status code lain jika diperlukan
          setState(() {
            _isLoading = false;
            _hasError = true;
          });
          break;
        }
      } catch (e) {
        // Jika ada error saat request, ulangi setelah 1 detik
        print('Error loading image, retrying: $e');
        await Future.delayed(Duration(seconds: 1));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImage(); // Panggil fungsi untuk mulai mencoba memuat gambar
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : _hasError
            ? Icon(Icons.error, size: 50, color: Colors.red)
            : Image.network(
                widget.imgUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image: $error');
                  return const Icon(Icons.error, size: 50, color: Colors.red);
                },
              );
  }
}
