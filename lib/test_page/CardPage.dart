import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/listData.dart';
import 'package:fluttertest0315/utils/ScreenAdaper.dart';

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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(ScreenAdapter.height(10)),
                  alignment: Alignment.center,
                  color: Colors.red,
                  child: Text(
                    '应付金额:1000',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(ScreenAdapter.height(10)),
                  color: Colors.blue,
                  child: Text(
                    '确认',
                    style: TextStyle(fontSize: 20),
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

class CardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: listData.map((value) {
            String imageName = value['filePath'];
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
                      child: Image.network(
                        imageName,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ListTile(
                      leading: ClipOval(
                        child: Image.network(
                          imageName,
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
