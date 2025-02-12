import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'sidebar.dart';

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
  int _currentIndex = 0;

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/logo_baligatra.png',
          height: 50,
        ),
        centerTitle: false,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: Sidebar(), // Gunakan Sidebar dari file sidebar.dart
      body: Stack(
        children: [
          if (sliderData.isNotEmpty)
            CarouselSlider(
              options: CarouselOptions(
                height: screenHeight,
                autoPlay: true,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: sliderData.map((item) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.matrix([
                        0.65,
                        0.35,
                        0.35,
                        0,
                        0,
                        0.35,
                        0.65,
                        0.35,
                        0,
                        0,
                        0.35,
                        0.35,
                        0.65,
                        0,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                      ]),
                      child: Image.asset(
                        item['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Container(color: Colors.black.withOpacity(0.3)),
                  ],
                );
              }).toList(),
            ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sliderData.isNotEmpty
                        ? sliderData[_currentIndex]['tittle']['english']
                        : '',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      sliderData.isNotEmpty
                          ? sliderData[_currentIndex]['text']['english']
                          : '',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
