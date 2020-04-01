import 'package:flutter/material.dart';

class MenuHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuHomePageState();
  }
}

class MenuHomePageState extends State<MenuHomePage> {
  String _bodyText = '点击效果';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹出菜单演示'),
        actions: <Widget>[
          PopupMenuButton<String>(
              onSelected: (String value) {
                setState(() {
                  _bodyText = value;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('增加'),
                          Icon(Icons.add_circle),
                        ],
                      ),
                      value: '这是增加',
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('增加'),
                          Icon(Icons.remove_circle),
                        ],
                      ),
                      value: '这是删除',
                    )
                  ]),
        ],
      ),
      body: Center(
        child: Text(
          _bodyText,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
