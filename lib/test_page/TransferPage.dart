import 'package:flutter/material.dart';

import 'component/Transfer.dart';

class TransferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferPageState();
  }
}

class TransferPageState extends State<TransferPage> {
  List<TransferObject> leftList = [];
  List<TransferObject> rightList = [];

  @override
  void initState() {
    super.initState();
    leftList = [
      new TransferObject(1, '张三1', false),
      new TransferObject(2, '李四2', false),
      new TransferObject(3, '王五3', false),
      new TransferObject(4, '亚瑟4', false),
      new TransferObject(5, '后羿5', false),
      new TransferObject(6, '张飞6', false),
      new TransferObject(7, '关羽7', false),
      new TransferObject(8, '刘备8', false),
      new TransferObject(9, '诸葛亮9', false),
      new TransferObject(10, '曹操10', false),
      new TransferObject(11, '夏侯惇11', false),
      new TransferObject(12, '孙权12', false),
      new TransferObject(13, '孙尚香13', false),
      new TransferObject(14, '周瑜14', false),
      new TransferObject(15, '黄忠15', false),
      new TransferObject(16, '马超16', false),
      new TransferObject(17, '吕布17', false),
      new TransferObject(18, '蔡文姬18', false),
      new TransferObject(19, '孙悟空19', false),
      new TransferObject(20, '武则天20', false),
    ];

    rightList = [
      new TransferObject(21, '荆轲21', false),
      new TransferObject(22, '鲁班22', false),
      new TransferObject(23, '鲁班23', false),
      new TransferObject(24, '鲁班24', false),
      new TransferObject(25, '鲁班25', false),
      new TransferObject(26, '鲁班26', false),
      new TransferObject(27, '鲁班27', false),
      new TransferObject(28, '鲁班28', false),
      new TransferObject(29, '鲁班29', false),
      new TransferObject(30, '鲁班30', false),
      new TransferObject(31, '鲁班31', false),
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
