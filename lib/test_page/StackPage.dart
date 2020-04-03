import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/listData.dart';

class StackPage extends StatelessWidget {
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
        title: Text('StackPage页面'),
      ),
      body: StackBody(),
    );
  }
}

List<Widget> _getList() {
  return listData.map((value) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              // 边框
              border: Border.all(
                width: 2.0,
                color: Colors.blue,
              ),
              // 背景颜色
              color: Colors.white,
            ),
            child: Image.network(value["filePath"]),
          ),
          Text(
            value['title'],
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }).toList();
}

class StackBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getList(),
    );
  }
}
