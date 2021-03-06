import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_listview/easy_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertest0315/constant/listData.dart';

class TabBarPage extends StatefulWidget {
  Map arguments;
  TabBarPage({
    this.arguments,
  });
  @override
  State<StatefulWidget> createState() {
    return TabBarState();
  }
}

class TabBarState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // 生命周期函数:初始化时调用
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 5);
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
            Text('电影'),
            Text('ListViewListTitle'),
            Text('imageListView'),
            Text('轮播图'),
            Text('等宽'),
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          _gridView(),
          _listTileListView(),
          _imageListView(),
          _swiperWidget(),
          _widthWidget(),
        ],
      ),
    );
  }

  ListView _imageListView() {
    return ListView(
      children: listData.map((value) {
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: value['filePath'],
              fit: BoxFit.cover,
            ),
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

  Widget _swiperWidget() {
    return Container(
      color: Colors.black12,
      child: Swiper(
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            listData[index]['filePath'],
            fit: BoxFit.fitWidth,
          );
        },

        /// 横向
        scrollDirection: Axis.horizontal,

        /// 无限轮播模式
        loop: true,

        /// 动画时间
        duration: 300,

        onIndexChanged: (index) {
          debugPrint("切换index:$index");
        },
        onTap: (index) {
          debugPrint("点击了第:$index个");
        },

        /// 开启左右翻页控制键
        control: SwiperControl(color: Colors.blueAccent),

        /// 分页指示器
        pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(bottom: 20.0, right: 20.0),

          /// 分页指示器样式: dots , fraction
//     builder: SwiperPagination.fraction,
          /// 重新定义 DotSwiperPaginationBuilder , FractionPaginationBuilder
          builder: FractionPaginationBuilder(
            // 未到图片标识
            color: Colors.white,
            // 已到图片标识
            activeColor: Colors.blue,
          ),
        ),

        /// 自动刷新开关与时间
        autoplay: listData.length > 1 ? true : false,
        autoplayDelay: 3000,

        /// 当用户拖拽的时候，是否停止自动播放
        autoplayDisableOnInteraction: true,
      ),
    );
  }

  Widget _gridView() {
    return GridView(
      padding: EdgeInsets.all(5.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // 横向数量
        crossAxisCount: 3,
        // 纵向间距
        mainAxisSpacing: 5.0,
        // 横向间距
        crossAxisSpacing: 5.0,
        // 宽高比例
        childAspectRatio: 3 / 4,
      ),
      children: <Widget>[
        Image.network(
            "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/01/25/100901.82440600_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mg/2019/02/19/095714.33859824_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/01/25/105549.53627008_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/03/01/142658.85498591_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/01/09/171109.88229500_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mg/2019/02/26/103754.10526344_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/01/25/100901.82440600_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mg/2019/02/19/095714.33859824_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/01/25/105549.53627008_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/03/01/142658.85498591_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/01/09/171109.88229500_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mg/2019/02/26/103754.10526344_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg",
            fit: BoxFit.cover),
        Image.network(
            "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg",
            fit: BoxFit.cover),
      ],
    );
  }

  Widget _widthWidget() {
    return Center(
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text('Short button'),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('A bit Longer button'),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('The Longest text button'),
            ),
          ],
        ),
      ),
    );
  }

  // 生命周期函数:销毁时调用
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
