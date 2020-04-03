import 'package:flutter/material.dart';

class FormDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormDemoState();
  }
}

class FormDemoState extends State<FormDemoPage> {
  String _userName = "";
  String _password = "";
  bool _isOpen = true;
  int _sex = 1;
  List _hobbyList = [
    {"checked": true, "title": "语文"},
    {"checked": true, "title": "数学"},
    {"checked": true, "title": "英文"},
    {"checked": true, "title": "政治"},
    {"checked": true, "title": "历史"},
    {"checked": true, "title": "物理"},
    {"checked": true, "title": "化学"},
  ];
  String _remark = "";

  List<Widget> _getHobbyCheckBoxList() {
    List<Widget> _hobbyCheckBoxList = new List();
    for (var hobby in _hobbyList) {
      _hobbyCheckBoxList.add(Row(
        children: <Widget>[
          Text(hobby['title']),
          Checkbox(
            value: hobby['checked'],
            onChanged: (v) {
              setState(() {
                hobby['checked'] = v;
              });
            },
          ),
        ],
      ));
    }
    return _hobbyCheckBoxList;
  }

  void _changSex(value) {
    setState(() {
      this._sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('获取表单参数演示'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // 用户名 - 输入框
            TextField(
              decoration: InputDecoration(
                labelText: '用户名',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  this._userName = value;
                });
              },
            ),
            SizedBox(height: 20),
            // 密码 - 模糊输入框
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '密码',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  this._password = value;
                });
              },
            ),
            // 性别 - 单选框
            Row(
              children: <Widget>[
                Text('性别:'),
                SizedBox(width: 20),
                Text('男:'),
                Radio(
                  value: 1,
                  onChanged: this._changSex,
                  groupValue: this._sex,
                ),
                SizedBox(width: 20),
                Text('女:'),
                Radio(
                  value: 2,
                  onChanged: this._changSex,
                  groupValue: this._sex,
                ),
              ],
            ),
            // 报考科目 - 多选框
            Column(
              children: <Widget>[
                Text('报考科目:'),
                SizedBox(width: 20),
                Wrap(
                  children: _getHobbyCheckBoxList(),
                ),
              ],
            ),
            // 是否保存信息 - 开关
            Row(
              children: <Widget>[
                Text('是否保存信息:'),
                SizedBox(width: 20),
                Switch(
                  value: _isOpen,
                  onChanged: (v) {
                    setState(() {
                      this._isOpen = v;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            // 备注 - 多行输入框
            TextField(
              // 多行文本框行数
              maxLines: 4,
              // 最多可输入的内容长度
              maxLength: 100,
              decoration: InputDecoration(
                labelText: '备注',
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                setState(() {
                  this._remark = v;
                });
              },
            ),
            SizedBox(height: 10),
            // 登录 - 获取所有参数
            Container(
              // 宽度自适应上级组件宽度
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('登录'),
                onPressed: () {
                  print("用户名: " + _userName);
                  print("密码: " + _password);
                  print("性别: " + _sex.toString());
                  print("是否保存信息: " + this._isOpen.toString());
                  print("科目: " + _hobbyList.toString());
                  print("备注: " + _remark);
                },
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
