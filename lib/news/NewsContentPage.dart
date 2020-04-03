import 'package:flutter/material.dart';

class NewsContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewContentState();
  }
}

class NewContentState extends State<NewsContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: Text('新闻详情'),
    );
  }
}
