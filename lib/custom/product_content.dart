import 'package:flutter/material.dart';

class ProductContent extends StatelessWidget {
  ProductContent(
      {super.key,
      required this.title,
      required this.shortContent,
      required this.img_url});

  final String title;
  final String shortContent;
  final String img_url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
              img_url,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(shortContent),
                  ElevatedButton(
                      onPressed: () {
                        print("test");
                      },
                      child: Text('Read'))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
