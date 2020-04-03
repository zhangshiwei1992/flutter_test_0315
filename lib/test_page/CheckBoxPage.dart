import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckBoxState();
  }
}

class CheckBoxState extends State<CheckBoxPage> {
  bool _isCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxPage演示'),
      ),
      body: Column(
        children: <Widget>[
          Checkbox(
            value: this._isCheck,
            onChanged: (v) {
              setState(() {
                this._isCheck = v;
              });
            },
            // 选中的颜色
            activeColor: Colors.red,
          ),
          Text(_isCheck ? "选中" : "未选中"),
          SizedBox(height: 20),
          CheckboxListTile(
            title: Text('标题'),
            subtitle: Text('二级标题'),
            value: this._isCheck,
            onChanged: (v) {
              setState(() {
                this._isCheck = v;
              });
            },
          ),
          Divider(),
          CheckboxListTile(
            title: Text('带图标的标题'),
            subtitle: Text('二级标题'),
            value: this._isCheck,
            onChanged: (v) {
              setState(() {
                this._isCheck = v;
              });
            },
            secondary: Icon(Icons.settings),
            // 选中 - 标题高亮
            selected: this._isCheck,
          ),
        ],
      ),
    );
  }
}
