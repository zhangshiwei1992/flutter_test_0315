import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/listData.dart';

import 'ExpandedPage.dart';
import 'ImageGridViewPage.dart';

class TabBarController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabBarState();
  }
}

class TabBarState extends State<TabBarController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // 生命周期函数:初始化时调用
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    // controller增加监听事件
    _tabController.addListener(() {
      print("_tabController.index======" + _tabController.index.toString());
    });
  }

  // 生命周期函数:销毁时调用
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  ListView _imageListView() {
    return ListView(
      children: listData.map((value) {
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Image.asset(
            value['filePath'],
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
    );
  }

  ListView _listTileListView() {
    return ListView(
      children: listData.map((value) {
        String _imageName = value['imageName'];
        String _title = value['title'];
        String _subtitle = value['subTitle'];
        return ListTile(
          leading: ClipOval(
            child: Image.asset(
              'images/${_imageName}',
              fit: BoxFit.cover,
            ),
          ),
          title: Text(_title),
          subtitle: Text(_subtitle),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarController'),
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Text('语文'),
            Text('数学'),
            Text('英语'),
            Text('逻辑'),
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          _imageListView(),
          _listTileListView(),
          ExpandedBody(),
          MyBody(),
        ],
      ),
    );
  }
}
