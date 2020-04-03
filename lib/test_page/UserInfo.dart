import 'package:flutter/material.dart';


import 'ExpandedPage.dart';

class UserInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserState();
  }
}

class UserState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户中心'),
      ),
      body: ExpandedBody(),
    );
  }
}
