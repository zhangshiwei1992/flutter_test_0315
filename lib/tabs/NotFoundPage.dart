import 'package:flutter/material.dart';

class NotFoundPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotFoundPageState();
  }
}

class NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('空白页'),
      ),
      body: Center(
        child: Text('跳转错误 - 空白页'),
      ),
    );
  }
}
