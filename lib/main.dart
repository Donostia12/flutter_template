import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> sliderData = [];
  int _currentIndex = 0; // Menyimpan indeks slide aktif

  @override
  void initState() {
    super.initState();
    loadSliderData();
  }

  Future<void> loadSliderData() async {
    final String response =
        await rootBundle.loadString('assets/json/home.json');
    final data = json.decode(response);
    setState(() {
      sliderData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true, // Agar AppBar transparan di atas slider
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/logo_baligatra.png',
          height: 50, // Ukuran logo diperbesar
        ),
        centerTitle: false,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () =>
                  Scaffold.of(context).openEndDrawer(), // Buka drawer kanan
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          if (sliderData.isNotEmpty)
            CarouselSlider(
              options: CarouselOptions(
                height: screenHeight, // Slider memenuhi layar
                autoPlay: true,
                viewportFraction: 1.0, // Gambar full tanpa efek samping
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index; // Perbarui indeks aktif
                  });
                },
              ),
              items: sliderData.map((item) {
                return Container(
                  width: double.infinity,
                  child: Image.asset(
                    item['image'],
                    fit: BoxFit.cover, // Pastikan gambar memenuhi layar
                  ),
                );
              }).toList(),
            ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center, // Posisikan teks di tengah layar
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.5), // Background semi-transparan
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  sliderData.isNotEmpty
                      ? sliderData[_currentIndex]['text']['english']
                      : '',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks putih agar kontras
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
