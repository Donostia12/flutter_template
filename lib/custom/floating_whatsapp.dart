import 'package:flutter/material.dart';

class FloatingWhatsApp extends StatelessWidget {
  const FloatingWhatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: null,
      child: Image.asset(
          'assets/images/whatsapp.jpg'), // Pastikan Anda memiliki gambar di folder assets
    );
  }
}
