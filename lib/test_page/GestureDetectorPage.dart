import 'package:flutter/material.dart';

class GestureDetectorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureDetectorState();
  }
}

class GestureDetectorState extends State<GestureDetectorPage> {
  @override
  Widget build(BuildContext context) {
    String _text = '20190726test002-----GestureDetector测试: ';
    return Scaffold(
      appBar: AppBar(
        title: Text('20190726test002'),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: Text(_text),
            onTap: () {
              _text = _text + ' tap事件触发';
            },
            onLongPress: () {
              _text = '指针在相同位置长时间保持与屏幕接触';
            },
            onDoubleTap: () {
              _text = '用户快速连续两次在同一位置轻敲屏幕';
            },
          ),
        ],
      ),
    );
  }
}
