import 'package:flutter/material.dart';
import 'package:fluttertest0315/routes/routes.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  标题是否居中显示
        centerTitle: true,
        title: Text('MenuPage页面'),
      ),
      body: MenuPageBody(),
    );
  }
}

class MenuPageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<MenuPageBody> {
  @override
  Widget build(BuildContext context) {
    List menuList = new List();
    Map menuMap = routes;
    for (String key in routes.keys) {
      menuList.add(key);
    }
    int i = 1;
    return ListView(
      children: menuList.map((value) {
        return ListTile(
          leading: Image.asset('images/${i++}.png'),
          title: Text(value),
        );
      }).toList(),
    );
  }
}
