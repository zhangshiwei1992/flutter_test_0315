import 'package:flutter/material.dart';

class RowPage extends StatefulWidget {
  Map arguments;
  RowPage({
    this.arguments,
  });
  @override
  State<StatefulWidget> createState() {
    return ListViewState();
  }
}

class ListViewState extends State<RowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarController'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Text(
                '111111111111111111111111111111111111111111111111111111111111'),
          ),
        ],
      ),
    );
  }
}
