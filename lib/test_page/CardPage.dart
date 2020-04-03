import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/listData.dart';

class CardPage extends StatelessWidget {
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
        title: Text('20190720CardTest002'),
      ),
      body: CardBody(),
    );
  }
}

class CardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: listData.map((value) {
            String imageName = value['imageName'];
            return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.blue,
                ),
              ),
              child: Card(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Image.asset(
                        'images/$imageName',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ListTile(
                      leading: ClipOval(
                        child: Image.asset(
                          'images/$imageName',
                        ),
                      ),
                      title: Text(value['title']),
                      subtitle: Text(
                        value['subTitle'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
