import 'package:flutter/material.dart';

class InkWellPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InkWellState();
  }
}

class InkWellState extends State<InkWellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('20190726test001'),
      ),
      body: Center(
        child: InkWell(
          child: Text('20190726test002'),
          onTap: () {
            showDialog(
              // 表示点击灰色背景的时候是否消失弹出框
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示信息!"),
                  content: Text("您确定要取消吗?"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("取消"),
                      onPressed: () {
                        print("取消");
                        Navigator.pop(context, 'Cancle');
                      },
                    ),
                    FlatButton(
                      child: Text("确定"),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
