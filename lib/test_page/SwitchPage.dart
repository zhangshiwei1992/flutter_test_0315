import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SwitchState();
  }
}

class SwitchState extends State<SwitchPage> {
  bool _isOpen = true;

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
                Switch(
                  value: _isOpen,
                  onChanged: (v) {
                    setState(() {
                      this._isOpen = v;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
