import 'package:flutter/material.dart';

class RegisterSecond extends StatefulWidget {
  Map arguments;

  RegisterSecond({this.arguments});

  @override
  State<StatefulWidget> createState() {
    return RegisterSecondState();
  }
}

class RegisterSecondState extends State<RegisterSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Column(
        children: <Widget>[
          Image.asset('images/8.png'),
          SizedBox(
            height: 20,
          ),
          Text(
            '这里是第二个注册页面:请输入验证码',
            style: TextStyle(fontSize: 20),
          ),
          RaisedButton(
            child: Text(
              '注册完成-跳转到登录页面',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/RegisterThird');
            },
          )
        ],
      ),
    );
  }
}
