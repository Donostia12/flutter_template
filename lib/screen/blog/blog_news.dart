import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/floating_whatsapp.dart';
import 'package:template_scaffold/custom/news_content.dart';
import 'package:template_scaffold/http/fetchnews.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class BlogNews extends StatefulWidget {
  const BlogNews({super.key});

  @override
  _BlogNewsState createState() => _BlogNewsState();
}

class _BlogNewsState extends State<BlogNews> {
  int _currentPage = 1;
  final int _limit = 5;
  List<NewsModel> _newsList = [];
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final newNews = await fetchNews(_currentPage, limit: _limit);
      setState(() {
        _newsList.addAll(newNews);
        _isLoading = false;
        _currentPage++;
        if (newNews.length < _limit) {
          _hasMore = false;
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load news: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingWhatsApp(),
      appBar: const CustomAppBar(title: 'Blog & News'),
      drawer: const SideNavbar(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _fetchNews();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: _newsList.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _newsList.length) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final news = _newsList[index];
            return NewsContent(
              date: news.createdAt,
              title: news.title,
              imageUrl: news.imageUrl,
              shortContent: news.shortDesc,
              desc: news.desc,
            );
          },
        ),
      ),
    );
  }
}
