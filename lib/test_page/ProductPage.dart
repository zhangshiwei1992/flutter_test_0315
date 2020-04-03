import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  String title;

  ProductPage({this.title = "默认ImageGridViewPage标题"});

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
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        height: 200.0,
        width: 300.0,
        // 内边距 四边所有
//        padding: EdgeInsets.all(20),
        // 内边距 四边设置
        padding: EdgeInsets.fromLTRB(10, 30, 0, 5),
        // 外边距
        margin: EdgeInsets.all(10),
        // 旋转
//        transform: Matrix4.rotationZ(0.1),
        // 位移
        transform: Matrix4.translationValues(10, 0, 0),
        // 内容对齐方式 bottomLeft左下
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          // 背景颜色
          color: Colors.blue,
          // 边框
          border: Border.all(
            // 颜色
            color: Colors.yellow,
            // 宽度
            width: 6.0,
          ),
          // 圆角
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: <Widget>[
            new Text(
              '20190717test001 东方闪电防守打法水电费水电费水电费东方闪电防守打法水电费水电费水电费',
              // 文本对齐方式
              textAlign: TextAlign.center,
              // 文本最多显示行数
              maxLines: 2,
              // 文本超出处理  ellipsis --- 三个点省略
              overflow: TextOverflow.ellipsis,
              // 字体放大倍数
              textScaleFactor: 2,
              // 字体样式
              style: new TextStyle(
                fontSize: 10,
                color: Colors.red,
                // 字体宽度 FontWeight.w500 --- 加粗5倍
                fontWeight: FontWeight.w500,
                // 字体倾斜
                fontStyle: FontStyle.italic,
                // 下划线
                decoration: TextDecoration.underline,
                // 下划线颜色
                decorationColor: Colors.black,
                // 下划线样式 dashed --- 虚线
                decorationStyle: TextDecorationStyle.dashed,
                // 字体间距 3倍
                letterSpacing: 3.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('跳转到商品详情页面'),
              onPressed: () {
                Navigator.pushNamed(context, '/ProductInfoPage', arguments: {
                  "title": "传参-商品详情-map的title",
                  "imageName": "19"
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
