import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewState();
  }
}

class ListViewState extends State<ListViewPage>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = new ScrollController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarController'),
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            InkWell(
              child: Text('语文1'),
              onTap: () {
                // 点击时滚动到某个位置
                this.scrollController.animateTo(
                      100.0,
                      duration: new Duration(milliseconds: 300), // 300ms
                      curve: Curves.bounceIn, // 动画方式
                    );
              },
            ),
            InkWell(
              child: Text('语文2'),
              onTap: () {
                // 点击时滚动到某个位置
                this.scrollController.animateTo(
                      300.0,
                      duration: new Duration(milliseconds: 300), // 300ms
                      curve: Curves.bounceIn, // 动画方式
                    );
              },
            ),
            InkWell(
              child: Text('语文3'),
              onTap: () {
                // 点击时直接跳转到某个位置
                this.scrollController.jumpTo(500);
              },
            ),
            InkWell(
              child: Text('语文4'),
              onTap: () {
                // 点击时滚动到某个位置
                this.scrollController.animateTo(
                      800.0,
                      duration: new Duration(milliseconds: 300), // 300ms
                      curve: Curves.bounceIn, // 动画方式
                    );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 40,
        controller: this.scrollController,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Text('今天吃什么？ $index'),
          );
        },
      ),
    );
  }

  // 生命周期函数:销毁时调用
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
