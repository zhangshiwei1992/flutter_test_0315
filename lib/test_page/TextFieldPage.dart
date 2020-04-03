import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextFieldState();
  }
}

class TextFieldState extends State<TextFieldPage> {
  // TextEditingController用于初始化时复制
  var _userName = new TextEditingController();
  var _password;

  @override
  void initState() {
    super.initState();
    this._userName.text = "初始值";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单页面'),
      ),
//      body: myTextFieldBody(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10),
            TextField(
              controller: _userName,
              decoration: InputDecoration(
                labelText: '请输入用户名',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  _userName.text = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '请输入密码',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(height: 10),
            Container(
              // 宽度自适应上级组件宽度
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('登录'),
                onPressed: () {
                  print("用户名: " + _userName.text + "; 密码: " + _password);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class myTextFieldBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          TextField(),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              // 提示语
              helperText: "请输入姓名",
              // 加边框
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            // 多行文本框行数
            maxLines: 4,
            // 最多可输入的内容长度
            maxLength: 100,
            decoration: InputDecoration(
              helperText: "多行文本框",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            maxLength: 6,
            // 是否模糊
            obscureText: true,
            decoration: InputDecoration(
              helperText: "密码框",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '昵称',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: '昵称-加样式',
              border: OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.red),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.message),
              labelText: '昵称-前面加图标',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
