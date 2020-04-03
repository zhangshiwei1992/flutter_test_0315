import 'package:flutter/material.dart';

class RegisterFirst extends StatefulWidget {
  Map arguments;

  RegisterFirst({this.arguments});

  @override
  State<StatefulWidget> createState() {
    return RegisterFirstState();
  }
}

class RegisterFirstState extends State<RegisterFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Column(
        children: <Widget>[
          Image.asset('images/5.png'),
          SizedBox(
            height: 20,
          ),
          Text(
            '这里是第1个注册页面:请输入手机号!!!!!!',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text('下一步'),
            onPressed: () {
//              Navigator.pushNamed(context, '/RegisterSecond');
              // 替换路由 用这个替换当前路由,再点击上面的返回按钮,就会回到此页面的上个页面,而不是此页面
              Navigator.of(context).pushReplacementNamed('/RegisterSecond');
            },
          )
        ],
      ),
    );
  }
}
