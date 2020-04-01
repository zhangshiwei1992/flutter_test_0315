import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 屏幕适配类
 */
class ScreenAdapter {
  static init(context) {
    ScreenUtil.instance = ScreenUtil(
      width: 750,
      height: 1334,
      allowFontScaling: true,
    )..init(context);
  }

  /**
   * 获取计算后的高度
   */
  static height(int value) {
    return ScreenUtil.getInstance().setHeight(value);
  }

  /**
   * 获取计算后的宽度
   */
  static width(int value) {
    return ScreenUtil.getInstance().setWidth(value);
  }

  /**
   * 获取当前屏幕的高度
   */
  static getScreenHeight() {
    return ScreenUtil.screenHeightDp;
  }

  /**
   * 获取当前屏幕的宽度
   */
  static getScreenWidth() {
    return ScreenUtil.screenWidthDp;
  }

  /**
   * 获取计算后的字体大小
   */
  static size(int value) {
    return ScreenUtil.getInstance().setSp(value);
  }
}
