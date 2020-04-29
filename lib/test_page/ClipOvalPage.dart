import 'package:flutter/material.dart';

class ClipOvalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // 页面底部的浮动按钮
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      appBar: new AppBar(
        title: new Text('20190717test002'),
      ),
      body: new Center(
        child: ClipOval(
          child: Image.asset(
            "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
