import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 页面底部的浮动按钮
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
        title: Text('照片Expanded页面'),
      ),
      body: ExpandedBody(),
    );
  }
}

class ExpandedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow),
                  ),
                  child: Image.asset('images/1.png'),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  height: 120,
                  child: Image.asset('images/2.png', fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Container(
                    height: 120,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 55,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                            ),
                            child:
                                Image.asset('images/13.png', fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 55,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                            ),
                            child:
                                Image.asset('images/29.png', fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 91,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  child: Image.asset(
                    'images/11.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
