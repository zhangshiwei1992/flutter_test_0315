import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/listData.dart';

class ImageListViewPage extends StatelessWidget {
  String title;

  ImageListViewPage({this.title = "默认ImageListViewPage标题"});

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
        title: Text(this.title),
      ),
      body: MyBody(),
    );
  }
}

Widget _getImageContainer(int index) {
  return Container(
    // 高度
    height: 200,
    // 外边距
    margin: EdgeInsets.all(10),
    // 内边距
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      // 边框
      border: Border.all(
        width: 2.0,
        color: Colors.blue,
      ),
      // 背景颜色
      color: Colors.white,
    ),
    child: Image.network(
      listData[index]["filePath"],
      fit: BoxFit.cover,
    ),
  );
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return _getImageContainer(index);
      },
    );
  }
}
