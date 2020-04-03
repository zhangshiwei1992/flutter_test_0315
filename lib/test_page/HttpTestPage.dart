import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertest0315/model/Result.dart';
import 'package:fluttertest0315/utils/HttpUtils.dart';

var httpClient = new HttpClient();

class HttpTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HttpState();
  }
}

class HttpState extends State<HttpTestPage> {
  String _brandName;
  String _initial;

  _alertDialog(var text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示信息'),
          content: Text(text),
          actions: <Widget>[
            RaisedButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('20190726HttpTestPage001'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: TextField(
              decoration: InputDecoration(
                labelText: '请输入品牌名称',
                labelStyle: TextStyle(fontSize: 25),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                this._brandName = value;
              },
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: TextField(
              decoration: InputDecoration(
                labelText: '请输入品牌首字母',
                labelStyle: TextStyle(fontSize: 25),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                this._initial = value;
              },
            ),
          ),
          RaisedButton(
            child: Text('条件查询品牌信息'),
            onPressed: () async {
              Result result = await post('/vehicleBrand/findPage', {
                "extraInfo": {"nameLike": this._brandName},
                "pageNum": 1,
                "pageSize": 20,
                "param": {"initial": this._initial}
              });

              if (result == null ||
                  result.value == null ||
                  result.value.length == 0) {
                return showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return new AlertDialog(
                      title: Text('条件查询品牌信息'),
                      content: Text('未查询到对应信息!'),
                      actions: <Widget>[
                        new FlatButton(
                          child: Text('确定'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                Navigator.pushNamed(context, '/VehicleBrandPage',
                    arguments: result);
              }
            },
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Image.network(
              "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000027_V15637857830000002549_0.png?Expires=4719487151&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=mBEMULoAq2xGWIiLm7EzRpgzHLE%3D",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
