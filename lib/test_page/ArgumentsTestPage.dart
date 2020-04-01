import 'package:flutter/material.dart';

class ArgumentsTestPage extends StatelessWidget {
  final Map arguments;
  ArgumentsTestPage({
    this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('传参测试'),
      ),
      body: Center(
        child: Text(
            " ${arguments != null ? arguments['name'] : 'null'}"),
      ),
    );
  }
}
