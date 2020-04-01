import 'package:flutter/material.dart';

import '../constant/ItemList.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Item> _itemList;
  ScrollController _listViewController;

  @override
  void initState() {
    print('###################_ListPageState初始化############################');
    super.initState();

    _itemList = itemList;
    if (_itemList.isNotEmpty) {
      for (Item _item in _itemList) {
        if (1 == _item.id) {
          _item.selected = true;
        } else {
          _item.selected = false;
        }
      }
    }

    _listViewController = new ScrollController();

    // controller增加监听事件
    _listViewController.addListener(() {
      print(
          '滚动条滚动的高度 : ${_listViewController.position.pixels} ###### 页面高度 : ${_listViewController.position.maxScrollExtent}');

      if (_listViewController.position.pixels < 200) {
        if (_itemList.isNotEmpty) {
          List<Item> newList = _itemList;
          for (Item _item in newList) {
            if (1 == _item.id) {
              _item.selected = true;
            } else {
              _item.selected = false;
            }
          }
          setState(() {
            _itemList = newList;
          });
        }
      }

      if (200 <= _listViewController.position.pixels &&
          _listViewController.position.pixels < 440) {
        print('当前位置到了200 - 400 之间');
        if (_itemList.isNotEmpty) {
          List<Item> newList = _itemList;
          for (Item _item in newList) {
            if (6 == _item.id) {
              _item.selected = true;
            } else {
              _item.selected = false;
            }
          }
          setState(() {
            print('当前位置到了200 - 400 之间 - 刷新 - _itemList');
            _itemList = newList;
          });
        }
      }
      if (440 <= _listViewController.position.pixels &&
          _listViewController.position.pixels < 1080) {
        if (_itemList.isNotEmpty) {
          List<Item> newList = _itemList;
          for (Item _item in newList) {
            if (12 == _item.id) {
              _item.selected = true;
            } else {
              _item.selected = false;
            }
          }
          setState(() {
            _itemList = newList;
          });
        }
      }
      if (_listViewController.position.pixels >= 1080) {
        if (_itemList.isNotEmpty) {
          List<Item> newList = _itemList;
          for (Item _item in newList) {
            if (28 == _item.id) {
              _item.selected = true;
            } else {
              _item.selected = false;
            }
          }
          setState(() {
            _itemList = newList;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动到列表指定item位置"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _topButtonWidget('商品'),
                _topButtonWidget('评价'),
                _topButtonWidget('详情'),
                _topButtonWidget('推荐'),
              ],
            ),
            Expanded(
              child: ListView(
                  controller: _listViewController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: _itemList.map((Item item) {
                    return _singleItemDisplay(item);
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }

  /// 头部按钮
  Widget _topButtonWidget(String _buttonName) {
    Color textColor = Colors.blueGrey;
    for (Item item in _itemList) {
      if (item.selected && item.name == _buttonName) {
        textColor = Colors.red;
      }
    }
    return FlatButton(
      textColor: textColor,
      color: Colors.white,
      child: Text(_buttonName),
      onPressed: () {
        print('===========点击头部按钮: ${_buttonName}');
        List<Item> _newList = _itemList;
        if (_newList.isNotEmpty) {
          for (Item item in _newList) {
            if (item.name == _buttonName) {
              item.selected = true;
            } else {
              item.selected = false;
            }
          }
        }
        setState(() {
          _itemList = _newList;
          if (_itemList.isNotEmpty) {
            for (int i = 0; i < _itemList.length; i++) {
              Item _item = _itemList.elementAt(i);
              if (_item.selected) {
                _listViewController.animateTo(0 != i ? i * 40.0 : 1,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              }
            }
          }
        });
      },
    );
  }

  /// 单个内容展示
  Widget _singleItemDisplay(Item item) {
    return Container(
      color: Color(item.selected ? 0xFFF8D45B : 0xFF999999),
      height: 40.0,
      padding: EdgeInsets.all(2.0),
      child: Text(
        item.name,
        style: TextStyle(
          color: item.selected ? Color(0xFFFF4545) : Color(0xFF000000),
          fontSize: 20,
        ),
      ),
    );
  }
}
