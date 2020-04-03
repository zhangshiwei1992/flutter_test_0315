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
            "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000027_V15637857830000002549_0.png?Expires=4719487151&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=mBEMULoAq2xGWIiLm7EzRpgzHLE%3D",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
