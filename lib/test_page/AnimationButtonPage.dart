import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/app_style.dart';
import 'package:fluttertest0315/utils/ScreenAdaper.dart';

class AnimationButtonPage extends StatefulWidget {
  @override
  AnimationButtonPageState createState() => new AnimationButtonPageState();
}

class AnimationButtonPageState extends State<AnimationButtonPage> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    countdown();
  }

  @override
  Widget build(BuildContext context) {
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
      if (10 == j) {
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
          _handWidget(),
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

  /// 手指图片
  Widget _handWidget() {
    /// 屏幕的一半宽度
    double _halfScreenWidth = ScreenAdapter.getScreenWidth() / 2;

    /// count是否为奇数
    bool _isOddNumber = 1 == count % 2 ? true : false;

    /// Transform.translate接收一个offset参数，可以在绘制时沿x、y轴对子组件平移指定的距离
    return Transform.translate(
      // 默认原点为左上角，第一个参数: 正数向右平移; 第二个参数: 正数向下平移
      offset: Offset(
        // 左右移动的范围
        _isOddNumber ? _halfScreenWidth + 80 : _halfScreenWidth + 90,
        // 上下移动的范围
        _isOddNumber ? 50.0 : 60.0,
      ),
      child: Image.network(
          'https://image.sdbao.com/sems/banner/iconImages/hand.png!webp'),
    );
  }

  void countdown() {
    print("start");

    /// 1秒执行一次
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      // 30秒后关闭
      if (timer.tick == 30) {
        timer.cancel();
        print("finish");
      }
      setState(() {
        count++;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
