import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/app_style.dart';
import 'package:fluttertest0315/utils/ScreenAdaper.dart';
import 'package:video_player/video_player.dart';

import 'TransferObject.dart';

class TransferInfoPage extends StatefulWidget {
  /// 全量集合
  List<TransferObject> targetList = [];

  /// 选中集合
  List<TransferObject> selectedList = [];

  /// 目标是否全选
  bool targetListAllSelected = false;

  /// 已选中的是否全选
  bool checkListAllSelected = false;

  TransferInfoPage(this.targetList, this.selectedList);

  @override
  State<StatefulWidget> createState() {
    return TransferInfoState();
  }
}

class TransferInfoState extends State<TransferInfoPage> {
  /// 全量集合
  List<TransferObject> _targetList = [];

  /// 选中集合
  List<TransferObject> _selectedList = [];

  /// 目标是否全选
  bool _targetListAllSelected = false;

  /// 已选中的是否全选
  bool _checkListAllSelected = false;

  @override
  void initState() {
    super.initState();
    _targetList = widget.targetList;
    _selectedList = widget.selectedList;
    _targetListAllSelected = widget.targetListAllSelected;
    _checkListAllSelected = widget.checkListAllSelected;
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: Container(
        padding: EdgeInsets.all(
          ScreenAdapter.height(AppStyle.mp_10),
        ),
        child: Row(
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
                        allSelectedWidget(),
                        Text('${_targetList.length}项'),
                      ],
                    ),
                  ),
                  Container(
                    height: ScreenAdapter.height(550),
                    child: ListView(
                      children: _targetList.map((_info) {
                        return _objectInfo(_info);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(
                ScreenAdapter.height(AppStyle.mp_5),
              ),
              child: Text('中间按钮'),
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
                        allSelectedWidget(),
                        Text('${_selectedList.length}项'),
                      ],
                    ),
                  ),
                  Container(
                    height: ScreenAdapter.height(550),
                    child: ListView(
                      children: _selectedList.map((_info) {
                        return _objectInfo(_info);
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

  /// 单个信息
  Widget _objectInfo(TransferObject _transferObject) {
    return Container(
      child: Row(
        children: <Widget>[
          _checkTransferObjectWidget(_transferObject),
          Text(_transferObject.name),
        ],
      ),
    );
  }

  // 单个选项的勾选框
  Widget _checkTransferObjectWidget(TransferObject _record) {
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
        List<TransferObject> newList = _targetList;
        for (TransferObject info in newList) {
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
        if (_selectedCount != newList.length) {
          _newAllSelected = false;
        }

        // 刷新页面
        setState(() {
          _record.isSelected = !_isSelected;
          _targetListAllSelected = _newAllSelected;
        });
      },
    );
  }

  // 目标是否全选 - type: 1-左侧全部项目, 2-右侧选中项目
  Widget allSelectedWidget( ) {
    print(
        '加载目标是否全选 当前参数 - _targetListAllSelected ======= ${_targetListAllSelected}');
    return GestureDetector(
      child: Container(
        child: Icon(
          _targetListAllSelected
              ? Icons.check_box
              : Icons.check_box_outline_blank,
          size: ScreenAdapter.width(40),
          color: Color(
            _targetListAllSelected
                ? AppStyle.color_blue_7e
                : AppStyle.color_grey_99,
          ),
        ),
      ),
      onTap: () {
        print('全部选项 - 点击全选 ======= ${_targetListAllSelected}');
        bool _newAllSelected = false;
        List<TransferObject> newList = _targetList;
        for (TransferObject info in newList) {
          if (!_targetListAllSelected) {
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
          _targetList = newList;
          _targetListAllSelected = _newAllSelected;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
