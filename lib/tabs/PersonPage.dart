import 'package:flutter/material.dart';

import '../test_page/ClipOvalPage.dart';

class PersonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonPageState();
  }
}

class PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '我是Person页面',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
        RaisedButton(
          child: Text('跳转到ClipOvalPage页面'),
          onPressed: () {
            // 路由跳转
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ClipOvalPage()));
          },
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text('跳转到登录页面'),
          onPressed: () {
            // 路由跳转
            Navigator.pushNamed(context, '/Login');
          },
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text('跳转到注册页面'),
          onPressed: () {
            // 路由跳转
            Navigator.pushNamed(context, '/RegisterFirst');
          },
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
