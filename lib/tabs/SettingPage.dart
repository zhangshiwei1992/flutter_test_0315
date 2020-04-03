import 'package:flutter/material.dart';
import 'package:fluttertest0315/test_page/CardPage.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SetPageWidget();
  }
}

class SetPageWidget extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '我是Setting页面',
          style: TextStyle(
            fontSize: 30,
            color: Colors.orange,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text('跳转到名片页面'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CardPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
