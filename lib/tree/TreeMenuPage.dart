import 'package:flutter/material.dart';
import 'package:fluttertest0315/test_page/RowPage.dart';
import 'package:fluttertest0315/utils/ScreenAdaper.dart';

import 'TreeNode.dart';

class TreeMenuPage extends StatefulWidget {
  Map arguments;
  TreeMenuPage({
    this.arguments,
  });
  @override
  State<StatefulWidget> createState() {
    return MyTreeState();
  }
}

class MyTreeState extends State<TreeMenuPage> {
  /// 展示的菜单列表
  List<TreeNode> expandMenuList = new List();

  /// 保存所有数据的List
  List<TreeNode> allMenuList = new List();

  /// 标记节点编号
  List<int> mark = new List();

  /// 点击选中的List
  List<TreeNode> selectedMenuList = new List();

  /// 正文部分
  Widget _contextWidget;

  @override
  void initState() {
    buildNode();
    _contextWidget = Container(child: Text('正文部分'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('菜单测试'),
      ),
      body: Container(
        padding: EdgeInsets.all(ScreenAdapter.width(10)),
        child: Row(
          children: <Widget>[
            /// 左侧菜单栏
            _menuTreeWidget(),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Text('当前登录人: 四维空间'),
                    ),
                  ],
                ),

                /// 已选择的菜单
                _selectedMenuListWidget(),

                /// 正文部分
                _contextWidget,
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 左侧菜单栏
  Widget _menuTreeWidget() {
    return Column(
      children: expandMenuList.map((_currentNode) {
        return GestureDetector(
          child: _menuWidget(_currentNode),
          onTap: () {
            List<TreeNode> _selectedList = new List();
            for (TreeNode node in expandMenuList) {
              if (node.nodeId == _currentNode.nodeId) {
                node.isChecked = true;

                /// 无子菜单
                if (!_currentNode.hasChildren) {
                  /// 已被选中
                  if (selectedMenuList.contains(_currentNode)) {
                    selectedMenuList.remove(_currentNode);
                  }
                  _selectedList.add(_currentNode);
                  if (selectedMenuList.isNotEmpty) {
                    _selectedList.addAll(selectedMenuList);
                  }
                }
              } else {
                node.isChecked = false;
              }
            }
            if (_currentNode.hasChildren) {
              if (_currentNode.expand) {
                // 之前是扩展状态，收起列表
                _currentNode.expand = false;
                _collect(_currentNode.nodeId);
              } else {
                // 之前是收起状态，扩展列表
                _currentNode.expand = true;
                _expand(_currentNode.nodeId);
              }
            }
            setState(() {
              print('点击了菜单: ${_currentNode.menuName}');
              if (!_currentNode.hasChildren &&
                  !selectedMenuList.contains(_currentNode)) {
                selectedMenuList = _selectedList;
                print('_currentNode.url : ${_currentNode.url}');
              }
              if (!_currentNode.hasChildren && _currentNode.url != '') {
                _contextWidget = Container(
                  width: ScreenAdapter.width(480),
                  height: ScreenAdapter.height(660),
                  child: ListView.builder(
                    itemCount: 40,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text('${_currentNode.menuName}   $index '),
                      );
                    },
                  ),
                );
              }
            });
          },
        );
      }).toList(),
    );
  }

  /// 已选中的菜单
  Widget _selectedMenuListWidget() {
    return Container(
      width: ScreenAdapter.width(480),
      height: ScreenAdapter.height(60),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: selectedMenuList.map((_selectMenu) {
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color:
                      _selectMenu.isChecked ? Colors.blueAccent : Colors.white),
              margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
              child: Text(_selectMenu.menuName),
            ),
            onTap: () {
              print('已选中的菜单 - 点击 - ${_selectMenu.menuName}');
              for (TreeNode node in expandMenuList) {
                if (node.nodeId == _selectMenu.nodeId) {
                  node.isChecked = true;
                } else {
                  node.isChecked = false;
                }
              }

              Widget _widget = Container(
                width: ScreenAdapter.width(480),
                height: ScreenAdapter.height(660),
                child: ListView.builder(
                  itemCount: 40,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text('${_selectMenu.menuName}   $index '),
                    );
                  },
                ),
              );
              setState(() {
                _contextWidget = _widget;
              });
            },
          );
        }).toList(),
      ),
    );
  }

  ///第一个节点的index
  int nodeId = 1;

  ///扩展机构树：id代表被点击的机构id
  /// 做法是遍历整个list列表，将直接挂在该机构下面的节点增加到一个临时列表中，
  ///然后将临时列表插入到被点击的机构下面
  void _expand(int id) {
    //保存到临时列表
    List<TreeNode> tmp = new List();
    for (TreeNode node in allMenuList) {
      if (node.parentId == id) {
        tmp.add(node);
      }
    }
    //找到插入点
    int index = -1;
    int length = expandMenuList.length;
    for (int i = 0; i < length; i++) {
      if (id == expandMenuList[i].nodeId) {
        index = i + 1;
        break;
      }
    }
    //插入
    expandMenuList.insertAll(index, tmp);
  }

  /// 收起机构树：id代表被点击的机构id
  /// 做法是遍历整个expand列表，将直接和间接挂在该机构下面的节点标记，
  /// 将这些被标记节点删除即可，此处用到的是将没有被标记的节点加入到新的列表中
  void _collect(int id) {
    // 清除之前的标记
    mark.clear();
    // 标记
    _mark(id);
    //重新对expand赋值
    List<TreeNode> tmp = new List();
    for (TreeNode node in expandMenuList) {
      if (mark.indexOf(node.nodeId) < 0) {
        tmp.add(node);
      } else {
        node.expand = false;
      }
    }
    expandMenuList.clear();
    expandMenuList.addAll(tmp);
    setState(() {});
  }

  /// 标记，在收起机构树的时候用到
  void _mark(int id) {
    for (TreeNode node in expandMenuList) {
      if (id == node.parentId) {
        if (node.hasChildren) {
          _mark(node.nodeId);
        }
        mark.add(node.nodeId);
      }
    }
  }

  void buildNode() {
    TreeNode<String> node1 = new TreeNode(
        false, 1, 1, 0, '一级菜单A', true, true, '/url', Icons.account_balance);
    TreeNode<String> node2 =
        new TreeNode(false, 1, 2, 0, '一级菜单B', true, false, '/url', Icons.phone);
    TreeNode<String> node3 = new TreeNode(
        false, 1, 3, 0, '一级菜单C', false, false, '/url', Icons.alarm);
    TreeNode<String> node4 = new TreeNode(
        false, 1, 4, 0, '一级菜单D', false, false, '/url', Icons.place);

    TreeNode<String> node5 = new TreeNode(
        false, 2, 5, 1, '二级菜单A', true, false, '/url', Icons.audiotrack);
    TreeNode<String> node6 = new TreeNode(
        false, 3, 6, 5, '三级菜单A', false, false, '/row', Icons.account_circle);
    TreeNode<String> node7 =
        new TreeNode(false, 3, 7, 5, '三级菜单B', false, false, '/url', Icons.map);

    TreeNode<String> node8 = new TreeNode(
        false, 2, 8, 1, '二级菜单B', true, false, '/url', Icons.all_inclusive);
    TreeNode<String> node9 = new TreeNode(
        false, 3, 9, 8, '三级菜单C', false, false, '/url', Icons.airport_shuttle);
    TreeNode<String> node10 = new TreeNode(
        false, 3, 10, 8, '三级菜单D', false, false, '/url', Icons.add_call);

    TreeNode<String> node11 = new TreeNode(
        false, 2, 11, 2, '二级菜单C', true, false, '/url', Icons.ac_unit);
    TreeNode<String> node12 = new TreeNode(
        false, 3, 12, 11, '三级菜单E', false, false, '/url', Icons.add);
    TreeNode<String> node13 = new TreeNode(false, 3, 13, 11, '三级菜单F', false,
        false, '/url', Icons.add_shopping_cart);

    expandMenuList.add(node1);
    expandMenuList.add(node2);
    expandMenuList.add(node3);
    expandMenuList.add(node4);

    allMenuList.add(node1);
    allMenuList.add(node2);
    allMenuList.add(node3);
    allMenuList.add(node4);
    allMenuList.add(node5);
    allMenuList.add(node6);
    allMenuList.add(node7);
    allMenuList.add(node8);
    allMenuList.add(node9);
    allMenuList.add(node10);
    allMenuList.add(node11);
    allMenuList.add(node12);
    allMenuList.add(node13);

    print('创建数据 - expandMenuList：' + expandMenuList.length.toString());
    print('创建数据 - allMenuList：' + allMenuList.length.toString());
  }

  /// 单个菜单展示
  Widget _menuWidget(TreeNode _node) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: _node.isChecked ? Colors.greenAccent : Colors.white),
//      width: (ScreenAdapter.getScreenWidth() / 3) - 20.0 * (_node.depth - 1),
      width: ScreenAdapter.width(250) - 20.0 * (_node.depth - 1),
      height: ScreenAdapter.height(60),
      margin: EdgeInsets.only(left: 20.0 * (_node.depth - 1)),
      child: Row(
        children: <Widget>[
          Icon(_node.iconData),
          Container(
            margin: EdgeInsets.only(left: ScreenAdapter.width(5)),
            child: Text(
              _node.menuName,
              style: TextStyle(fontSize: ScreenAdapter.size(20)),
            ),
          ),
        ],
      ),
    );
  }

  void dispose() {
    super.dispose();
  }
}
