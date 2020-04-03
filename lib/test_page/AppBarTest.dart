import 'package:flutter/material.dart';

class AppBarTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  标题是否居中显示
        centerTitle: true,
// 前面加了按钮,就会隐藏返回箭头
//        leading: IconButton(
//          icon: Icon(Icons.menu),
//          onPressed: () {
//            print('菜单');
//            Navigator.pushNamed(context, '/MenuPage');
//          },
//        ),
        title: Text('AppBarTest'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('搜索');
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('菜单');
              Navigator.pushNamed(context, '/MenuPage');
            },
          ),
        ],
      ),
      body: Text(
        '右上角菜单可跳转',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
