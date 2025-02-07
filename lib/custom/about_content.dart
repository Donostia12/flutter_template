import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutContent extends StatefulWidget {
  final String titleAbout;
  final String shortDescAbout;
  final String imageUrlAbout;
  final String contentAbout;

  const AboutContent({
    required this.titleAbout,
    required this.shortDescAbout,
    required this.imageUrlAbout,
    required this.contentAbout,
  });

  @override
  _AboutContentState createState() => _AboutContentState();
}

class _AboutContentState extends State<AboutContent> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString('''
        <!DOCTYPE html>
        <html>
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <style>
            body { margin: 0; padding: 0; }
            iframe { width: 100%; height: 50vh; border: 0; }
          </style>
        </head>
        <body>
          <iframe 
            src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7620.457024738037!2d115.21167400000002!3d-8.716168!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dd246b2ca586587%3A0xa03facb8882128fe!2sBali%20Gatra%20Komunikasi!5e1!3m2!1sen!2sid!4v1737102210557!5m2!1sen!2sid"
            allowfullscreen
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade">
          </iframe>
        </body>
        </html>
      ''');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar di atas
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.imageUrlAbout),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten Judul dan Deskripsi Pendek
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Us",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Html(
                  data: widget.contentAbout,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          // Google Maps Embed dengan HTML langsung dalam WebView
          SizedBox(
            height: 200,
            child: WebViewWidget(controller: _controller),
          ),
        ],
      ),
    );
  }
}
