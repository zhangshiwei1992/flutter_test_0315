import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'component/Transfer.dart';
import 'component/TransferObject.dart';

class TransferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferPageState();
  }
}

class TransferPageState extends State<TransferPage> {
  List<TransferObject> targetList = [];
  List<TransferObject> selectedList = [];

  @override
  void initState() {
    super.initState();
    TransferObject transferObject1 = new TransferObject(1, '张三', false);
    TransferObject transferObject2 = new TransferObject(2, '李四', false);
    TransferObject transferObject3 = new TransferObject(3, '王五', false);
    TransferObject transferObject4 = new TransferObject(4, '赵六', false);
    TransferObject transferObject5 = new TransferObject(5, '沈七', false);
    TransferObject transferObject6 = new TransferObject(6, '朱八', false);
    targetList.add(transferObject1);
    targetList.add(transferObject2);
    targetList.add(transferObject3);
    targetList.add(transferObject4);
    targetList.add(transferObject5);
    targetList.add(transferObject6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('穿梭框'),
      ),
      body: TransferInfoPage(targetList, selectedList),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
