import 'dart:ui';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  String title;
  int position;
  String content;
  String time;
  String coverUrl;
  CallBack callBack;

  HomeItem({
    this.title,
    this.position,
    this.content,
    this.time,
    this.coverUrl,
    this.callBack,
  });
  @override
  Widget build(BuildContext context) {
    print('bookId:$position');
    Widget titleSection = Container(
      padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
      child: Card(
        elevation: 5.0,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 100.0,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                child: Image.network(
                  coverUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 18, color: Color(0xFF333333)),
              ),
            ],
          ),
        ),
      ),
    );
    return GestureDetector(
      child: titleSection,
      onTap: () {
        callBack(position, this);
      },
    );
  }
}

typedef void CallBack(
  int position,
  HomeItem item,
);
