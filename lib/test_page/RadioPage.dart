import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RadioState();
  }
}

class RadioState extends State<RadioPage> {
  int _sex = 1;
  int _grade = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioPage演示'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("男"),
                Radio(
                  value: 1,
                  onChanged: (v) {
                    setState(() {
                      this._sex = v;
                    });
                  },
                  groupValue: this._sex,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("女"),
                Radio(
                  value: 2,
                  onChanged: (v) {
                    setState(() {
                      this._sex = v;
                    });
                  },
                  groupValue: this._sex,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(this._sex == 1 ? "男" : "女"),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: <Widget>[
                RadioListTile(
                  value: 1,
                  title: Text('标题'),
                  subtitle: Text('二级标题'),
                  onChanged: (v) {
                    setState(() {
                      this._grade = v;
                    });
                  },
                  groupValue: this._grade,
                  secondary: Icon(Icons.message),
                  // 选中 - 标题高亮
                  selected: this._grade == 1,
                ),
                RadioListTile(
                  value: 2,
                  title: Text('标题2'),
                  subtitle: Text('二级标题'),
                  onChanged: (v) {
                    setState(() {
                      this._grade = v;
                    });
                  },
                  groupValue: this._grade,
                  secondary: Image.asset('images/1.png'),
                  // 选中 - 标题高亮
                  selected: this._grade == 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
