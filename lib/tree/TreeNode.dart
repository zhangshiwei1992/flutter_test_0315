import 'package:flutter/cupertino.dart';

class TreeNode<T> {
  /// 是否展开
  bool expand;

  /// 深度
  int depth;

  /// id
  int nodeId;

  /// 父类id
  int parentId;

  /// 菜单名称
  String menuName;

  /// 是否有孩子节点
  bool hasChildren;

  /// 是否选中
  bool isChecked;

  /// 跳转地址
  String url;

  /// 按钮图标
  IconData iconData;

  TreeNode(
    this.expand,
    this.depth,
    this.nodeId,
    this.parentId,
    this.menuName,
    this.hasChildren,
    this.isChecked,
    this.url,
    this.iconData,
  );
}
