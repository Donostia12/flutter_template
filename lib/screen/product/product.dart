import 'package:flutter/material.dart';
import 'package:template_scaffold/custom/custom_appbar.dart';
import 'package:template_scaffold/custom/product_content.dart';
import 'package:template_scaffold/http/fetchproduct.dart';
import 'package:template_scaffold/screen/side_navbar.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final ScrollController _scrollController = ScrollController();
  List<ProductModel> _productList = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        _fetchProducts();
      }
    });
  }

  Future<void> _fetchProducts() async {
    if (_isLoading || !_hasMore) return;
    setState(() {
      _isLoading = true;
    });

    try {
      final newProducts = await fetchProduct(page: _currentPage);
      setState(() {
        _currentPage++;
        _productList.addAll(newProducts);
        _hasMore = newProducts.length ==
            5; // Assume that if less than 5 items, there's no more data
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Product'),
      drawer: const SideNavbar(),
      body: _productList.isEmpty && _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: _productList.length + (_hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _productList.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                final product = _productList[index];
                return ProductContent(
                  title: product.title,
                  shortContent: product.shortDesc,
                  imgurl: product.imageUrl,
                  content: product.desc,
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
