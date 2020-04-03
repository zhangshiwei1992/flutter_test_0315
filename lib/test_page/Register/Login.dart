import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Map arguments;

  Login({this.arguments});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Column(
        children: <Widget>[
          Image.asset('images/8.png'),
          SizedBox(
            height: 20,
          ),
          Text(
            '这里登录页面:请输入手机号和密码',
            style: TextStyle(fontSize: 20),
          ),
          RaisedButton(
            child: Text(
              '确定登录',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/CardPage');
            },
          )
        ],
      ),
    );
  }
}
