import 'package:flutter/material.dart';

class ProductInfoPage extends StatelessWidget {
  Map arguments;

  ProductInfoPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 页面底部的浮动按钮
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
        title: Text(arguments["title"]),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Image.asset('images/${this.arguments["imageName"]}.png'),
            SizedBox(
              height: 20,
            ),
            Text('当前图片:${this.arguments["imageName"]}'),
          ],
        ),
      ),
    );
  }
}
