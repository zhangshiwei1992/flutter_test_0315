import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LearnDropdownButton();
  }
}

class _LearnDropdownButton extends State<DropDownPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: new Column(
        children: <Widget>[
          myLikeDrowDownButton(),
        ],
      ),
    );
  }

  Widget myLikeDrowDownButton() {
    List _likeList = [
      {"key": 0, "value": "足球"},
      {"key": 1, "value": "篮球"},
      {"key": 2, "value": "羽毛球"},
      {"key": 3, "value": "乒乓球"},
    ];

    List<DropdownMenuItem> getListData() {
      return _likeList.map((like) {
        return DropdownMenuItem(
          child: Text(like['value']),
          value: like['key'],
        );
      }).toList();
    }

    int _like = 0;
    String _ballName = '请选择';
    return new Center(
      child: new DropdownButton(
        items: getListData(),
        hint: new Text(_ballName),
        //当没有默认值的时候可以设置的提示
        value: _like,
        //下拉菜单选择完之后显示给用户的值
        onChanged: (select) {
          //下拉菜单item点击之后的回调
          setState(() {
            _like = select;
            print('_like====================${_like}');
            print('_likeList[_like]====================${_likeList[_like]}');
            _ballName = _likeList[_like]['value'];
            print('_ballName====================${_ballName}');
          });
        },
        //设置阴影的高度
        elevation: 24,
        style: new TextStyle(color: Colors.red),
//              isDense: false,//减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。
//              如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
        iconSize: 50.0, //设置三角标icon的大小
      ),
    );
  }
}
