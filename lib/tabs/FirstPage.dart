import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertest0315/test_page/Draw.dart';

import 'CategoryPage.dart';
import 'HomePage.dart';
import 'PersonPage.dart';
import 'SettingPage.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabsState();
  }
}

class TabsState extends State<FirstPage> {
  List _pageList = [HomePage(), CategoryPage(), SettingPage(), PersonPage()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 750,
      height: 1334,
    )..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('20190721test002'),
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航条按钮集合
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('分类')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('设置')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我')),
        ],
        // 图标大小
        iconSize: 35.0,
        // 当前被选中的是第几个(从0开始计算)
        currentIndex: this._currentIndex,
        // 选中的颜色
        fixedColor: Colors.red,
        // 选中触发的方法
        onTap: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        // 底部导航栏类型 fixed-可以有多个按钮
        type: BottomNavigationBarType.fixed,
      ),
      // 抽屉组件: 左侧栏
      drawer: MyDraw(),
      endDrawer: MyDraw(),
    );
  }
}
