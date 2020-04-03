import 'package:flutter/material.dart';
import 'package:fluttertest0315/tabs/FirstPage.dart';

class RegisterThird extends StatefulWidget {
  Map arguments;

  RegisterThird({this.arguments});

  @override
  State<StatefulWidget> createState() {
    return RegisterThirdState();
  }
}

class RegisterThirdState extends State<RegisterThird> {
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
            '这里是第3个注册页面:请输入密码!!!!!!',
            style: TextStyle(fontSize: 20),
          ),
          RaisedButton(
            child: Text('注册完成-跳转到登录页面'),
            onPressed: () {
//              Navigator.of(context).pop();
              // 返回指定的根页面
              Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(
                  builder: (context) => FirstPage(),
                ),
                (route) => route == null,
              );
            },
          )
        ],
      ),
    );
  }
}
