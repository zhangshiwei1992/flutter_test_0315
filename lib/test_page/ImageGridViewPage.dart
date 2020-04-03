import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/listData.dart';

class ImageGridViewPage extends StatelessWidget {
  String title;

  ImageGridViewPage({this.title = "默认ImageGridViewPage标题"});

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
        title: Text(title),
      ),
      body: MyBody(),
    );
  }
}

Widget _getMyImage(String imagePath) {
  return Container(
    // 高度
    height: 110,
    // 外边距
//    margin: EdgeInsets.all(10),
    // 内边距
    padding: EdgeInsets.all(8),
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
      imagePath,
      fit: BoxFit.cover,
    ),
  );
}

List<Widget> _getList() {
  return listData.map((value) {
    return new Column(
      children: <Widget>[
        _getMyImage(value["filePath"]),
        SizedBox(
          height: 5,
        ),
        Text(value["title"]),
      ],
    );
  }).toList();
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // 每行展示几列
      crossAxisCount: 2,
      // 内部 横向元素之间的距离
      crossAxisSpacing: 8,
      // 内部 纵向元素之间的距离
      mainAxisSpacing: 8.0,
      // 距离屏幕的边距
      padding: EdgeInsets.all(10.0),
      // 内部元素的宽度与高度的比例 GridView内部元素不能直接设置高度和宽度
//      childAspectRatio: 0.8,
      children: _getList(),
    );
  }
}
