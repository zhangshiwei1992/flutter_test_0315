import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertest0315/constant/FilePathList.dart';
import 'package:fluttertest0315/image_pdf/app_image_show.dart';

import 'JumpPage.dart';
import 'ListViewPage.dart';
import 'ListViewPage2.dart';
import 'MenuOverlayPage.dart';
import 'PopupMenuButtonPage.dart';
import 'SliverPersistentHeader.dart';

class PdfTestPage extends StatefulWidget {
  @override
  PdfTestPageState createState() => new PdfTestPageState();
}

class PdfTestPageState extends State<PdfTestPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 750,
      height: 1334,
    )..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Plugin example app'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 5,
          children: <Widget>[
            Container(
              child: WrapAppImageShow(
                filePathList: filePathList,
              ),
            ),
            RaisedButton(
              child: Text('tableBar'),
              onPressed: () {
                Navigator.of(context).pushNamed("/TabBarPage");
              },
            ),
            RaisedButton(
              child: Text('菜单测试'),
              onPressed: () {
                Navigator.of(context).pushNamed("/TreeMenuPage");
              },
            ),
            RaisedButton(
              child: Text('HomePage22'),
              onPressed: () {
                Navigator.of(context).pushNamed("/HomePage22");
              },
            ),
            RaisedButton(
              child: Text('传参测试'),
              onPressed: () {
                Navigator.of(context).pushNamed('/ArgumentsTestPage',
                    arguments: {"name": 'hello'}).then(
                  (data) {
                    //接受返回的参数
                    print(data.toString());
                  },
                );
              },
            ),
            RaisedButton(
              child: Text('LoginPage'),
              onPressed: () {
                Navigator.of(context).pushNamed("/LoginPage");
              },
            ),
            RaisedButton(
              child: Text('Row-flex组件不换行'),
              onPressed: () {
                Navigator.of(context).pushNamed("/RowPage");
              },
            ),
            RaisedButton(
              child: Text('ListViewPage'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewPage()),
                );
              },
            ),
            RaisedButton(
              child: Text('ListViewPage2'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewPage2()),
                );
              },
            ),
            RaisedButton(
              child: Text('隐藏头部'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NestedScrollViewPage()),
                );
              },
            ),
            RaisedButton(
              child: Text('列表滚动到指定位置'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage()),
                );
              },
            ),
            RaisedButton(
              child: Text('菜单收放-还要定位-不好用'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuOverlayPage()),
                );
              },
            ),
            RaisedButton(
              child: Text('菜单弹出'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuHomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
