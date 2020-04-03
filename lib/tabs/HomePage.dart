import 'package:flutter/material.dart';
import 'package:fluttertest0315/constant/FilePathList.dart';
import 'package:fluttertest0315/image_pdf/app_image_show.dart';
import 'package:fluttertest0315/test_page/JumpPage.dart';
import 'package:fluttertest0315/test_page/ListViewPage.dart';
import 'package:fluttertest0315/test_page/ListViewPage2.dart';
import 'package:fluttertest0315/test_page/MenuOverlayPage.dart';
import 'package:fluttertest0315/test_page/PopupMenuButtonPage.dart';
import 'package:fluttertest0315/test_page/SliverPersistentHeader.dart';
import 'package:fluttertest0315/utils/ScreenAdaper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageWidget();
  }
}

class HomePageWidget extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(10)),
      child: ListView(
        children: <Widget>[
          Wrap(
            spacing: 5,
            children: <Widget>[
              Container(
                child: WrapAppImageShow(
                  filePathList: filePathList,
                ),
              ),
              RaisedButton(
                child: Text('tableBar'),
                onPressed: () {
                  Navigator.of(context).pushNamed("/TabBarPage");
                },
              ),
              RaisedButton(
                child: Text('菜单测试'),
                onPressed: () {
                  Navigator.of(context).pushNamed("/TreeMenuPage");
                },
              ),
              RaisedButton(
                child: Text('HomePage22'),
                onPressed: () {
                  Navigator.of(context).pushNamed("/HomePage22");
                },
              ),
              RaisedButton(
                child: Text('传参测试'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/ArgumentsTestPage',
                      arguments: {"name": 'hello'}).then(
                    (data) {
                      //接受返回的参数
                      print(data.toString());
                    },
                  );
                },
              ),
              RaisedButton(
                child: Text('LoginPage'),
                onPressed: () {
                  Navigator.of(context).pushNamed("/LoginPage");
                },
              ),
              RaisedButton(
                child: Text('Row-flex组件不换行'),
                onPressed: () {
                  Navigator.of(context).pushNamed("/RowPage");
                },
              ),
              RaisedButton(
                child: Text('ListViewPage'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListViewPage()),
                  );
                },
              ),
              RaisedButton(
                child: Text('ListViewPage2'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListViewPage2()),
                  );
                },
              ),
              RaisedButton(
                child: Text('隐藏头部'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NestedScrollViewPage()),
                  );
                },
              ),
              RaisedButton(
                child: Text('列表滚动到指定位置'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPage()),
                  );
                },
              ),
              RaisedButton(
                child: Text('菜单收放-还要定位-不好用'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuOverlayPage()),
                  );
                },
              ),
              RaisedButton(
                child: Text('菜单弹出'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuHomePage()),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'ImageListViewPage',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
                onPressed: () {
                  // 命名路由跳转
                  Navigator.pushNamed(context, '/ImageListViewPage',
                      arguments: '1234567');
                },
              ),
              RaisedButton(
                child: Text('ImageGridView'),
                onPressed: () {
                  Navigator.pushNamed(context, '/ImageGridViewPage',
                      arguments: '传参-ImageGridViewPage');
                },
              ),
              RaisedButton(
                child: Text('Expanded'),
                onPressed: () {
                  Navigator.pushNamed(context, '/ExpandedPage');
                },
              ),
              RaisedButton(
                child: Text('Stack层叠'),
                onPressed: () {
                  Navigator.pushNamed(context, '/StackPage');
                },
              ),
              RaisedButton(
                child: Text('Wrap流式布局'),
                onPressed: () {
                  Navigator.pushNamed(context, '/WrapPage');
                },
              ),
              RaisedButton(
                child: Text('ProductPage'),
                onPressed: () {
                  Navigator.pushNamed(context, '/ProductPage',
                      arguments: "传参-商品的title");
                },
              ),
              RaisedButton(
                child: Text('AppBarTest'),
                onPressed: () {
                  Navigator.pushNamed(context, '/AppBarTest');
                },
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Navigator.pushNamed(context, '/MenuPage');
                },
              ),
              RaisedButton(
                child: Text('新闻AppBarPage'),
                onPressed: () {
                  Navigator.pushNamed(context, '/AppBarPage');
                },
              ),
              RaisedButton(
                child: Text('TabBarController'),
                onPressed: () {
                  Navigator.pushNamed(context, '/TabBarController');
                },
              ),
              RaisedButton(
                child: Text('button'),
                onPressed: () {
                  Navigator.pushNamed(context, '/ButtonPage');
                },
              ),
              RaisedButton(
                child: Text('TextFieldPage'),
                onPressed: () {
                  Navigator.pushNamed(context, '/TextFieldPage');
                },
              ),
              RaisedButton(
                child: Text('CheckBoxPage'),
                onPressed: () {
                  Navigator.pushNamed(context, '/CheckBoxPage');
                },
              ),
              RaisedButton(
                child: Text('RadioPage演示'),
                onPressed: () {
                  Navigator.pushNamed(context, '/RadioPage');
                },
              ),
              RaisedButton(
                child: Text('SwitchPage'),
                onPressed: () {
                  Navigator.pushNamed(context, '/SwitchPage');
                },
              ),
              RaisedButton(
                child: Text('FormDemoPage'),
                onPressed: () {
                  Navigator.pushNamed(context, '/FormDemoPage');
                },
              ),
              RaisedButton(
                child: Text('时间组件'),
                onPressed: () {
                  Navigator.pushNamed(context, '/TimePage');
                },
              ),
              RaisedButton(
                child: Text('InkWellPage'),
                onPressed: () {
                  Navigator.pushNamed(context, '/InkWellPage');
                },
              ),
              RaisedButton(
                child: Text('GestureDetectorPage'),
                onPressed: () {
                  Navigator.pushNamed(context, '/GestureDetectorPage');
                },
              ),
              RaisedButton(
                child: Text('HttpTestPage'),
                onPressed: () {
                  Navigator.pushNamed(context, '/HttpTestPage');
                },
              ),
              RaisedButton(
                child: Text('下拉框'),
                onPressed: () {
                  Navigator.pushNamed(context, '/DropDownPage');
                },
              ),
              RaisedButton(
                child: Text('轮播图'),
                onPressed: () {
                  Navigator.pushNamed(context, '/SwiperPage');
                },
              ),
              RaisedButton(
                child: Text('DialogPage弹出对话框'),
                onPressed: () {
                  Navigator.pushNamed(context, '/DialogPage');
                },
              ),
              RaisedButton(
                child: Text('下拉刷新上拉分页加载更多'),
                onPressed: () {
                  Navigator.pushNamed(context, '/RefreshIndicatorPage');
                },
              ),
              RaisedButton(
                child: Text('解析html'),
                onPressed: () {
                  Navigator.pushNamed(context, '/HtmlResolvePage');
                },
              ),
              RaisedButton(
                child: Text('webView解析html'),
                onPressed: () {
                  Navigator.pushNamed(context, '/WebViewPage');
                },
              ),
              RaisedButton(
                child: Text('获取设备信息'),
                onPressed: () {
                  Navigator.pushNamed(context, '/DeviceInfoPage');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
