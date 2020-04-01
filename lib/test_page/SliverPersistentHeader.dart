import 'package:flutter/material.dart';

const url =
    'http://www.pptbz.com/pptpic/UploadFiles_6909/201203/2012031220134655.jpg';

class NestedScrollViewPage extends StatefulWidget {
  @override
  NestedScrollViewPageState createState() => NestedScrollViewPageState();
}

class NestedScrollViewPageState extends State<NestedScrollViewPage> {
  var tabTitle = [
    '页面1',
    '页面2',
    '页面3',
  ];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: tabTitle.length,
        child: Scaffold(
          body: new NestedScrollView(
            headerSliverBuilder: (context, bool) {
              return [
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        "我是可以跟着滑动的title",
                      ),
                      background: Image.network(
                        url,
                        fit: BoxFit.cover,
                      )),
                ),
                new SliverPersistentHeader(
                  delegate: new SliverTabBarDelegate(
                    new TabBar(
                      tabs: tabTitle.map((f) => Tab(text: f)).toList(),
                      indicatorColor: Colors.red,
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.red,
                    ),
                    color: Colors.white,
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: tabTitle
                  .map((s) => ListView.builder(
                itemBuilder: (context, int) => Text("123"),
                itemCount: 50,
              ))
                  .toList(),
            ),
          ),
        ));
  }
}

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar widget;
  final Color color;

  const SliverTabBarDelegate(this.widget, {this.color})
      : assert(widget != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: widget,
      color: color,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => widget.preferredSize.height;

  @override
  double get minExtent => widget.preferredSize.height;
}
