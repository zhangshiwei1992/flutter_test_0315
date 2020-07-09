import 'package:flutter/material.dart';

import 'component/Transfer.dart';

class TransferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferPageState();
  }
}

class TransferPageState extends State<TransferPage> {
  List<TransferObject> leftList = [
    new TransferObject(1, '张三', false),
    new TransferObject(2, '张三', false),
    new TransferObject(3, '张三', false),
    new TransferObject(4, '张三', false),
    new TransferObject(5, '张三', false),
    new TransferObject(6, '张三', false),
    new TransferObject(7, '张三', false),
    new TransferObject(8, '张三', false),
    new TransferObject(9, '张三', false),
    new TransferObject(10, '张三', false),
    new TransferObject(11, '张三', false),
    new TransferObject(12, '张三', false),
    new TransferObject(13, '张三', false),
    new TransferObject(14, '张三', false),
    new TransferObject(15, '张三', false),
    new TransferObject(16, '张三', false),
    new TransferObject(17, '张三', false),
    new TransferObject(18, '张三', false),
    new TransferObject(19, '张三', false),
    new TransferObject(20, '张三', false),
  ];
  List<TransferObject> rightList = [];

  @override
  void initState() {
    super.initState();
    leftList = [
      new TransferObject(1, '张三', false),
      new TransferObject(2, '李四', false),
      new TransferObject(3, '王五', false),
      new TransferObject(4, '亚瑟', false),
      new TransferObject(5, '后羿', false),
      new TransferObject(6, '张飞', false),
      new TransferObject(7, '关羽', false),
      new TransferObject(8, '刘备', false),
      new TransferObject(9, '诸葛亮', false),
      new TransferObject(10, '曹操', false),
      new TransferObject(11, '夏侯惇', false),
      new TransferObject(12, '孙权', false),
      new TransferObject(13, '孙尚香', false),
      new TransferObject(14, '周瑜', false),
      new TransferObject(15, '黄忠', false),
      new TransferObject(16, '马超', false),
      new TransferObject(17, '吕布', false),
      new TransferObject(18, '蔡文姬', false),
      new TransferObject(19, '孙悟空', false),
      new TransferObject(20, '武则天', false),
    ];

    rightList = [
      new TransferObject(21, '荆轲', false),
      new TransferObject(22, '鲁班', false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('穿梭框'),
      ),
      body: TransferInfoPage(
        leftList: leftList,
        rightList: rightList,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
