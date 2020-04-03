import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/listData.dart';

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
          'images/${value['imageName']}',
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

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryPageWidget();
  }
}

class CategoryPageWidget extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          // 导航栏的背景色
          backgroundColor: Colors.white,
          title: Container(
            child: TabBar(
              // 指示器颜色 默认蓝色
//              indicatorColor: Colors.red,
              // 选中的lab颜色
//              labelColor: Colors.orange,
              // 未选中的颜色
//              unselectedLabelColor: Colors.green,
              // 指示器长度 label与lable等宽
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                Text('热门', style: TextStyle(color: Colors.black)),
                Text('推荐', style: TextStyle(color: Colors.black)),
                Text('娱乐', style: TextStyle(color: Colors.black)),
                Text('新闻', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
//          bottom: TabBar(tabs: <Widget>[
//            Text('热门'),
//            Text('推荐'),
//          ]),
        ),
        body: TabBarView(children: <Widget>[
          ListView(
            children: <Widget>[
              ListTile(
                title: Text('新闻标题1'),
                subtitle: Text('1111111111111'),
              ),
              ListTile(
                title: Text('新闻标题2'),
                subtitle: Text('222222222222'),
              ),
              ListTile(
                title: Text('新闻标题3'),
                subtitle: Text('333333333333'),
              ),
            ],
          ),
          _imageListView(),
          ListView(
            children: <Widget>[
              ListTile(
                title: Text('新闻标题4'),
                subtitle: Text('4444444444444'),
              ),
              ListTile(
                title: Text('新闻标题5'),
                subtitle: Text('55555555555555'),
              ),
              ListTile(
                title: Text('新闻标题6'),
                subtitle: Text('666666666666'),
              ),
            ],
          ),
          _listTileListView(),
        ]),
      ),
    );
  }
}
