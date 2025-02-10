import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(title: 'Main'),
        drawer: const SideNavbar(),
        body: const MySlider(),
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> sliderData = [
    {
      'imageUrl':
          'https://baligatra.com/assets/general/images/home/mobile_app_development.webp',
      'text':
          'Transform your Business app with Mobile Apps. We help you grow your business through mobile apps with web, native and hybrid solutions, contact us for more info.',
    },
    {
      'imageUrl':
          'https://baligatra.com/assets/general/images/home/web_development.webp',
      'text':
          'What we do is create dynamic web applications that run on web servers and can be used by many different people.',
    },
    {
      'imageUrl':
          'https://baligatra.com/assets/general/images/home/digital_marketing.webp',
      'text':
          'With your existing business environment, we help to make businesses ready to compete in the digital age today.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 5), () {
      if (_pageController.hasClients) {
        if (_currentPage < sliderData.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: sliderData.length,
      itemBuilder: (context, index) {
        return SliderItem(
          imageUrl: sliderData[index]['imageUrl']!,
          text: sliderData[index]['text']!,
        );
      },
    );
  }
}

class SliderItem extends StatelessWidget {
  final String imageUrl;
  final String text;

  const SliderItem({Key? key, required this.imageUrl, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.5),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
