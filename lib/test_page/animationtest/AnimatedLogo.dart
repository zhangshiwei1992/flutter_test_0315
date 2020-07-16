import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:fluttertest0315/utils/ScreenAdaper.dart';

class AnimatedLogo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画测试1'),
      ),
      body: _handWidget(),
    );
  }

  Widget _handWidget() {
    return Animator<double>(
      duration: Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0, end: 300),
      cycles: 0,
      builder: (context, animatorState, child) => Center(
        // animatorState.value , 这个值会不停的变化,从0开始增长又回到0
        child: Container(
          margin: EdgeInsets.only(
            left: ScreenAdapter.width(
              int.parse(
                animatorState.value.toInt().toString(),
              ),
            ),
            top: ScreenAdapter.width(
              int.parse(
                animatorState.value.toInt().toString(),
              ),
            ),
          ),

          /// 设置高度宽度动态变化就是图片闪烁 - 放大缩小
//          height: animatorState.value,
//          width: animatorState.value,
          child: Image.network(
              'https://image.sdbao.com/sems/banner/iconImages/hand.png!webp'),
        ),
      ),
    );
  }

}
