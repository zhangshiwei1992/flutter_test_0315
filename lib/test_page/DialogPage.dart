import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertest0315/components/LoadingDialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DialogState();
  }
}

class DialogState extends State<DialogPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: new Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('alert弹出框-alertDialog'),
              onPressed: _alertDialog,
            ),
            RaisedButton(
              child: Text('select弹出框-simpleDialog'),
              onPressed: _simpleDialog,
            ),
            RaisedButton(
              child: Text('actionSheet底部弹出框-showModalButtonDialog'),
              onPressed: _modalButtonSheet,
            ),
            RaisedButton(
              child: Text('toast-flutterToast第三方库'),
              onPressed: _toast,
            ),
            RaisedButton(
              child: Text('自定义dialog'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return LoadingDialog();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _alertDialog() {
    showDialog(
      // 表示点击灰色背景的时候是否消失弹出框
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示信息!"),
          content: Text("您确定要取消吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () {
                print("取消");
                Navigator.pop(context, 'Cancle');
              },
            ),
            FlatButton(
              child: Text("确定"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  _simpleDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('选择内容'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('篮球'),
              onPressed: () {
                print('篮球!');
                Navigator.pop(context, 'basketBall');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('游泳'),
              onPressed: () {
                print('游泳!');
                Navigator.pop(context, 'swim');
              },
            ),
            SimpleDialogOption(
              child: Text('跑步'),
              onPressed: () {
                print('跑步!');
                Navigator.pop(context, 'run');
              },
            ),
          ],
        );
      },
    );
  }

  var mapData = {"name": "张飞", "性别": "男", "age": "28"};
  var strData = '{"name": "张飞", "性别": "男", "age": "28"}';

  _modalButtonSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('分享'),
                  onTap: () {
                    print('分享!');
                    print('map转为json字符串: ' + json.encode(mapData));
                    Navigator.pop(context, 'share');
                  },
                ),
                ListTile(
                  title: Text('转发'),
                  onTap: () {
                    print('转发!');
                    print('json字符串转为map: ' + json.decode(strData)['name']);
                    Navigator.pop(context, '转发');
                  },
                ),
                ListTile(
                  title: Text('取消'),
                  onTap: () {
                    print('取消!');
                    Navigator.pop(context, 'cancle');
                  },
                ),
              ],
            ),
          );
        });
  }

  _toast() async {
    Fluttertoast.showToast(msg: '下部弹出小提示框信息');
  }


}
