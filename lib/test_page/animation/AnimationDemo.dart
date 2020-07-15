import 'package:flutter/material.dart';

import 'AnimatedBackground.dart';
import 'DemoCard.dart';
import 'Item.dart';

class AnimationDemoPage extends StatefulWidget {
  @override
  AnimationDemoPageState createState() => AnimationDemoPageState();
}

class AnimationDemoPageState extends State<AnimationDemoPage> {
  ScrollController _controller = new ScrollController();

  List<DemoCard> get _cards =>
      items.map((Item _item) => DemoCard(_item)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('滑动-背景齿轮滚动'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          AnimatedBackground(controller: _controller),
          Center(
            child: ListView(controller: _controller, children: _cards),
          ),
        ],
      ),
    );
  }
}
