import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/app_style.dart';
import 'package:fluttertest0315/utils/ScreenAdaper.dart';
import 'package:video_player/video_player.dart';

import 'TransferObject.dart';

class TransferInfoPage extends StatefulWidget {
  /// 左侧 - 全量集合
  List<TransferObject> leftList = [];

  /// 右侧 - 已选中集合
  List<TransferObject> rightList = [];

  /// 左侧 - 全量目标是否全选
  bool leftListAllSelected = false;

  /// 右侧 - 已选中的项目是否全选
  bool rightListAllSelected = false;

  TransferInfoPage(this.leftList, this.rightList);

  @override
  State<StatefulWidget> createState() {
    return TransferInfoState();
  }
}

class TransferInfoState extends State<TransferInfoPage> {
  /// 左侧全量集合
  List<TransferObject> _leftList = [];

  /// 右侧选中集合
  List<TransferObject> _rightList = [];

  /// 左侧目标是否全选
  bool _leftListAllSelected = false;

  /// 右侧模板是否全选
  bool _rightListAllSelected = false;

  @override
  void initState() {
    super.initState();
    _leftList = widget.leftList;
    _rightList = widget.rightList;
    _leftListAllSelected = widget.leftListAllSelected;
    _rightListAllSelected = widget.rightListAllSelected;
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: Container(
        padding: EdgeInsets.all(
          ScreenAdapter.height(AppStyle.mp_10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: ScreenAdapter.width(300),
              height: ScreenAdapter.width(600),
              decoration: BoxDecoration(
                color: Color(AppStyle.color_white),
                border: Border.all(
                  color: Color(AppStyle.color_black_00),
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppStyle.radius_5,
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenAdapter.height(50),
                    padding: EdgeInsets.all(
                      ScreenAdapter.height(AppStyle.mp_5),
                    ),
                    child: Row(
                      children: <Widget>[
                        allSelectedWidget(1),
                        Text('共 ${_leftList.length} 项'),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(AppStyle.color_black_00),
                  ),
                  Container(
                    height: ScreenAdapter.height(550),
                    child: ListView(
                      children: _leftList.map((_info) {
                        return _objectInfo(_info, 1);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(
                ScreenAdapter.height(AppStyle.mp_5),
              ),
              child: Column(
                children: <Widget>[
                  _transferButtonWidget(1),
                  _transferButtonWidget(2),
                ],
              ),
            ),
            Container(
              width: ScreenAdapter.width(300),
              height: ScreenAdapter.width(600),
              decoration: BoxDecoration(
                color: Color(AppStyle.color_white),
                border: Border.all(
                  color: Color(AppStyle.color_black_00),
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppStyle.radius_5,
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenAdapter.height(50),
                    padding: EdgeInsets.all(
                      ScreenAdapter.height(AppStyle.mp_5),
                    ),
                    child: Row(
                      children: <Widget>[
                        allSelectedWidget(2),
                        Text('已选中 ${_rightList.length} 项'),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(AppStyle.color_black_00),
                  ),
                  Container(
                    height: ScreenAdapter.height(550),
                    child: ListView(
                      children: _rightList.map((_info) {
                        return _objectInfo(_info, 2);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return scaffold;
  }

  /// 中间穿梭框按钮 - type: 1-左侧选中项目向右, 2-右侧选中项目向左
  Widget _transferButtonWidget(int type) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(
          ScreenAdapter.width(AppStyle.mp_5),
        ),
        margin: EdgeInsets.all(
          ScreenAdapter.width(AppStyle.mp_5),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(AppStyle.color_black_00),
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppStyle.radius_5,
            ),
          ),
        ),
        child: Text(
          1 == type ? '>' : '<',
          style: TextStyle(
            fontSize: ScreenAdapter.size(AppStyle.text_48),
          ),
        ),
      ),
      onTap: () {
        print('点击中间穿梭按钮 : ${type}');

        /// 新的左侧项目 , 新的右侧项目
        List<TransferObject> _newLeftList = [];
        List<TransferObject> _newRightList = [];

        List<TransferObject> _currentInfoList = [];
        if (1 == type) {
          _currentInfoList = _leftList;
          _newRightList = _rightList;
        } else {
          _currentInfoList = _rightList;
          _newLeftList = _leftList;
        }

        List<TransferObject> _newSelectedList = [];
        List<TransferObject> _newNoeSelectedList = [];
        for (TransferObject info in _currentInfoList) {
          if (info.isSelected) {
            info.isSelected = false;
            _newSelectedList.add(info);
          } else {
            _newNoeSelectedList.add(info);
          }
        }

        if (1 == type) {
          _newRightList.addAll(_newSelectedList);
        } else {
          _newLeftList.addAll(_newSelectedList);
        }

        // 刷新页面
        setState(() {
          if (1 == type) {
            _leftList = _newNoeSelectedList;
            _rightList = _newRightList;
          } else {
            _leftList = _newLeftList;
            _rightList = _newNoeSelectedList;
          }

          if (0 == _newRightList.length) {
            _rightListAllSelected = false;
          }
          if (0 == _newLeftList.length) {
            _leftListAllSelected = false;
          }
        });
      },
    );
  }

  /// 单个信息 - type: 1-左侧全部项目, 2-右侧选中项目
  Widget _objectInfo(TransferObject _transferObject, int type) {
    return Container(
      child: Row(
        children: <Widget>[
          _checkTransferObjectWidget(_transferObject, type),
          Text(_transferObject.name),
        ],
      ),
    );
  }

  // 单个选项的勾选框 - type: 1-左侧全部项目, 2-右侧选中项目
  Widget _checkTransferObjectWidget(TransferObject _record, int type) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(
          left: ScreenAdapter.width(
            AppStyle.mp_5,
          ),
        ),
        child: Icon(
          _record.isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          size: ScreenAdapter.width(AppStyle.mp_40),
          color: Color(
            _record.isSelected
                ? AppStyle.color_blue_7e
                : AppStyle.color_grey_99,
          ),
        ),
      ),
      onTap: () {
        bool _isSelected = _record.isSelected;
        print('点击单个选项 - 此选中原本是否选中: ${_isSelected}');

        bool _newAllSelected = true;
        int _selectedCount = 0;

        List<TransferObject> _currentInfoList = [];
        if (1 == type) {
          _currentInfoList = _leftList;
        } else {
          _currentInfoList = _rightList;
        }

        for (TransferObject info in _currentInfoList) {
          if (info.isSelected) {
            _selectedCount++;
          }
        }
        print('点击单个选项 - 原本已经选中: ${_selectedCount} 个');
        if (!_isSelected) {
          _selectedCount++;
        } else {
          _selectedCount--;
        }
        print('点击单个选项 - 现在选中: ${_selectedCount} 个');
        if (_selectedCount != _currentInfoList.length) {
          _newAllSelected = false;
        }

        // 刷新页面
        setState(() {
          _record.isSelected = !_isSelected;
          if (1 == type) {
            _leftListAllSelected = _newAllSelected;
          } else {
            _rightListAllSelected = _newAllSelected;
          }
        });
      },
    );
  }

  // 目标是否全选 - type: 1-左侧全部项目, 2-右侧选中项目
  Widget allSelectedWidget(int type) {
    print('加载 - 目标是否全选 - type: 1-左侧全部项目, 2-右侧选中项目 ======= ${type}');

    bool _isAllSelected;
    List<TransferObject> _currentInfoList = [];
    if (1 == type) {
      _currentInfoList = _leftList;

      print(
          '左侧 - 全项目 - 是否全选 当前参数 - _targetListAllSelected ======= ${_leftListAllSelected}');
      _isAllSelected = _leftListAllSelected;
      if (0 == _leftList.length) {
        _isAllSelected = false;
      }
    } else {
      _currentInfoList = _rightList;

      print(
          '右侧 - 选中项目 - 是否全选 当前参数 - _checkListAllSelected ======= ${_rightListAllSelected}');
      _isAllSelected = _rightListAllSelected;
      if (0 == _rightList.length) {
        _isAllSelected = false;
      }
    }

    return GestureDetector(
      child: Container(
        child: Icon(
          _isAllSelected ? Icons.check_box : Icons.check_box_outline_blank,
          size: ScreenAdapter.width(40),
          color: Color(
            _isAllSelected ? AppStyle.color_blue_7e : AppStyle.color_grey_99,
          ),
        ),
      ),
      onTap: () {
        print('全部选项 - 点击全选 ======= ${_isAllSelected}');
        bool _newAllSelected = false;

        for (TransferObject info in _currentInfoList) {
          if (!_isAllSelected) {
            print('已选中 - 修改是否全选 - 是是是是是是');
            info.isSelected = true;
            _newAllSelected = true;
          } else {
            print('已选中 - 修改是否全选 - 否否否否否否');
            info.isSelected = false;
          }
        }
        // 刷新页面
        setState(() {
          print('刷新 _newAllSelected ======= ${_newAllSelected}');
          if (1 == type) {
            _leftList = _currentInfoList;
            _leftListAllSelected = _newAllSelected;
          } else {
            _rightList = _currentInfoList;
            _rightListAllSelected = _newAllSelected;
          }
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
