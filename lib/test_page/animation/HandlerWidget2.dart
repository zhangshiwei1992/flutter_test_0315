import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:fluttertest0315/utils/ScreenAdaper.dart';

/// 手指图片沿着特定线路来回移动
class HandWidget2 extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

/// 必须继承SingleTickerProviderStateMixin - 为了AnimationController
class _MyHomePageState extends State<HandWidget2>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;

  /// 动画重启次数
  int _retryCount = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    /// 监听动画状态 - 完成动画循环
    controller.addStatusListener((status) {
      // 动画状态: 结束 - 反转启动
      if (status == AnimationStatus.completed) {
        debugPrint('完成');
        controller.reverse();

        /// 动画状态: 开始时就停止即动画启动失败 - 重新启动
      } else if (status == AnimationStatus.dismissed) {
        _retryCount++;

        debugPrint('消失');
        controller.forward();

        /// 重启10次任然失败 - 关闭
        if (_retryCount == 10) {
          controller?.dispose();
        }
      }
    });

    /// 设定移动路线 - 坐标调试
    animation = Tween(
      begin: Offset(1.9, 0.6),
      end: Offset(2.2, 1.0),
    ).animate(controller);

    /// 开始执行动画
    controller.forward();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //SlideTransition 用于执行平移动画
        child: SlideTransition(
          position: animation,
          //将要执行动画的子view
          child: Image.network(
            'https://image.sdbao.com/sems/banner/iconImages/hand.png!webp',
            height: ScreenAdapter.height(150),
          ),
        ),
      ),
    );
  }

  dispose() {
    controller?.dispose();
    super.dispose();
  }
}
