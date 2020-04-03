import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
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
        title: Text('WrapPage页面'),
      ),
      body: WrapBody(),
    );
  }
}

class WrapBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<WrapBody> {
  bool _bool = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        // 主轴 X轴的间距
        spacing: 20,
        // Y轴的间距
        runSpacing: 8,
        children: generateWordPairs().take(30).map((value) {
          return RaisedButton(
            child: Text(
              value.toString(),
              style: TextStyle(color: _bool ? Colors.red : Colors.blue),
            ),
            onPressed: () {
              _bool = !_bool;
            },
          );
          ;
        }).toList(),
      ),
    );
  }
}
