import 'dart:async';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/app_style.dart';
import 'package:fluttertest0315/utils/ScreenAdaper.dart';

import 'animation/HandlerWidget.dart';
import 'animation/HandlerWidget2.dart';

/// 使用动画实现手指戳按钮的动画 - 不需要重复加载
class AnimationButtonPage2 extends StatefulWidget {
  @override
  AnimationButtonPage2State createState() => new AnimationButtonPage2State();
}

class AnimationButtonPage2State extends State<AnimationButtonPage2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'AnimationButtonPage2State - build --------  加载 --------------------');
    return Scaffold(
      appBar: AppBar(
        title: Text('动态手指'),
      ),
      body: ListView(
        children: _widgetList(),
      ),
    );
  }

  /// listView的内容
  List<Widget> _widgetList() {
    List<Widget> _widgetList = [];
    for (int j = 0; j < 100; j++) {
      if (0 == j % 10) {
        _widgetList.add(_buttonAndHandWidgetStack());
      }
      _widgetList.add(Text(
        j.toString(),
        style: TextStyle(
          fontSize: ScreenAdapter.size(AppStyle.text_60),
        ),
      ));
    }
    return _widgetList;
  }

  /// 按钮 + 手指
  Widget _buttonAndHandWidgetStack() {
    return Container(
      child: Stack(
        children: <Widget>[
          /// 按钮
          _buttonWidget(),

          /// 手指图片
          HandWidget2(),
        ],
      ),
    );
  }

  /// 按钮
  Widget _buttonWidget() {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppStyle.radius_25,
            ),
          ),
        ),
        // 按钮颜色
        color: Colors.orange,
        // 字体颜色
        textColor: Colors.white,
        child: Text(
          '点此完善',
          style: TextStyle(
            fontSize: ScreenAdapter.size(100),
          ),
        ),
        onPressed: () {
          print('点击------RaisedButton按钮');
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
