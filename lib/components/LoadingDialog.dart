import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertest0315/utils/ScreenAdaper.dart';

class LoadingDialog extends Dialog {
  _showTimer(context) {
    var timer;
    timer = Timer.periodic(Duration(milliseconds: 3000), (t) {
      print('3000ms已过,自动关闭!!!');
      Navigator.pop(context);
      timer.cancel(); // 最后 定时器需要取消
    });
  }

  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center(
        //保证控件居中效果
        child: new SizedBox(
          width: 120.0,
          height: 120.0,
          child: new Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(),
                new Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: new Text(
                    '3s后自动关闭',
                    style: new TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
