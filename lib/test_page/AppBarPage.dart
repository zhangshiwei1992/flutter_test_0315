import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/listData.dart';

import 'ExpandedPage.dart';
import 'ImageGridViewPage.dart';

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
      return ListTile(
        leading: ClipOval(
          child: Image.network(
            value['filePath'],
            fit: BoxFit.cover,
          ),
        ),
        title: Text(value['title']),
        subtitle: Text(value['subTitle']),
      );
    }).toList(),
  );
}

class AppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> __tabBarTitleList = [
      '要闻',
      '推荐',
      '视频',
      '搞笑',
      '娱乐',
      '军事',
      '体育',
      '上海',
      '情感',
      '社会',
      '热文',
      '汽车',
      '健康',
      '时尚',
      '美食',
      '游戏'
    ];
    return DefaultTabController(
      length: 16,
      child: Scaffold(
        appBar: AppBar(
          title: Text('新闻页面测试'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.pushNamed(context, '/MenuPage');
              },
            ),
          ],
          bottom: TabBar(
              // 指示器是否可滚动
              isScrollable: true,
              tabs: __tabBarTitleList.map((value) {
                return Text(value);
              }).toList()),
        ),
        body: TabBarView(
          children: <Widget>[
            ExpandedBody(),
            MyBody(),
            _imageListView(),
            _listTileListView(),
            _imageListView(),
            _listTileListView(),
            _imageListView(),
            _listTileListView(),
            _imageListView(),
            _listTileListView(),
            _imageListView(),
            _listTileListView(),
            _imageListView(),
            _listTileListView(),
            _imageListView(),
            _listTileListView(),
          ],
        ),
      ),
    );
  }
}
