import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'test_page/JumpPage.dart';
import 'test_page/ListViewPage.dart';
import 'test_page/ListViewPage2.dart';
import 'test_page/MenuOverlayPage.dart';
import 'test_page/PopupMenuButtonPage.dart';
import 'test_page/SliverPersistentHeader.dart';
import 'image_pdf/app_image_show.dart';
import 'test_page/TabBarPage.dart';
import 'tree/TreeMenuPage.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'flutter example app 0315',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 750,
      height: 1334,
    )..init(context);

    List<String> filePathList = [
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/%E7%A6%BE%E4%B8%8B%E4%B8%BB%E5%90%88%E5%90%8C_%E6%B1%BD%E8%BD%A6%E7%A7%9F%E8%B5%81%E5%90%88%E5%90%8C%E4%B9%A6_OR202003042515.pdf?Expires=4738983262&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=mKpVx1I2t3%2FiD0HL98PM4HOwGPY%3D",
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000017_GPS_O_15638127740000000741_0.png?Expires=4719486397&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=TB6sctRhQnUltL1qy6tOPEbvavE%3D",
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000027_V15637857830000002549_0.png?Expires=4719487151&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=mBEMULoAq2xGWIiLm7EzRpgzHLE%3D",
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000005_OR201911082335_8056.png?Expires=4728854407&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=8vsIbn6UGWc3MTCuv37DWgeQ92I%3D",
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000005_OR201911072311_7735.png?Expires=4728770204&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=mhlKtN2ieGw1fjLmTI7Cvem8Ak0%3D",
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000005_OR201911072311_7735.png?Expires=4728770204&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=mhlKtN2ieGw1fjLmTI7Cvem8Ak0%3D",
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Plugin example app')),
      body: Container(
        padding: EdgeInsets.only(left: 10),
        child: Wrap(
          spacing: 5,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20),
              child: WrapAppImageShow(
                filePathList: filePathList,
              ),
            ),
            RaisedButton(
              child: Text('普通tableBar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabBarPage()),
                );
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
            RaisedButton(
              child: Text('TreeMenuPage'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TreeMenuPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
