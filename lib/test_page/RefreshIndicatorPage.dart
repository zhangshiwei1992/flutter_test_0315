import 'package:flutter/material.dart';
import 'package:fluttertest0315/model/Result.dart';
import 'package:fluttertest0315/utils/HttpUtils.dart';

class RefreshIndicatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyRefreshIndicatorState();
  }
}

class MyRefreshIndicatorState extends State<RefreshIndicatorPage> {
  int pageNum = 1;
  int pageSize = 10;
  List _vehicleBrandList = [];
  bool hasMore = true;

  String filePath =
      'http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000027_V15637857830000002549_0.png?Expires=4719486988&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=VqVKTd%2B8Ojh6EuQhRaKdXR0v5Nw%3D';

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _findBrandPage(pageNum, pageSize);

    // 监听滚动条事件
    _scrollController.addListener(() {
      // 滚动条滚动的距离
      print(_scrollController.position.pixels);
      // 页面总的高度
      print(_scrollController.position.maxScrollExtent);

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('到底啦-开始加载');
        _findBrandPage(pageNum++, pageSize);
      }
    });
  }

  _findBrandPage(int pageNum, int pageSize) async {
    if (hasMore) {
      Result result = await post(
        '/vehicleBrand/findPage',
        {
          "extraInfo": {},
          "pageNum": pageNum,
          "pageSize": pageSize,
          "param": {}
        },
      );
      if (!result.success) {
        _alertDialog();
      }
      List list = result.value;
      print('获取的数据条数: ' + list.length.toString());
      setState(() {
        _vehicleBrandList.addAll(list);
        print('_vehicleBrandList总条数: ' + _vehicleBrandList.length.toString());
      });
      if (list.length < pageSize) {
        print('获取的数据条数 < 请求页条数 ------ 已经到底');
        setState(() {
          hasMore = false;
        });
      }
    }
  }

  Future<void> _freshList() async {
    print('下拉刷新======================开始');
    await Future.delayed(Duration(milliseconds: 2000), () {
      _findBrandPage(pageNum, pageSize);
      print('下拉刷新======================完成');
    });
  }

  _alertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示信息'),
          content: Text('查询失败!'),
          actions: <Widget>[
            RaisedButton(
              child: Text('确定'),
              onPressed: () {
                print('确定!');
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  Widget _getListTile(list, index) {
    String _filePath = list[index]['logo'] != null && list[index]['logo'] != ''
        ? list[index]['logo']
        : filePath;
    String _brandName = list[index]['name'] != null && list[index]['name'] != ''
        ? list[index]['name']
        : '-';
    String _brandInitial =
        list[index]['initial'] != null && list[index]['initial'] != ''
            ? list[index]['initial']
            : '-';
    return ListTile(
      leading: Image.network(_filePath),
      title: Text(_brandName),
      subtitle: Text(_brandInitial),
      onTap: () {
        print(list[index]['id']);
        Navigator.pushNamed(context, '/VehicleVendorPage',
            arguments: {"brandId": list[index]['id']});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: this._vehicleBrandList.length > 0
          ? RefreshIndicator(
              onRefresh: _freshList,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _vehicleBrandList.length,
                itemBuilder: (context, index) {
                  if (index == _vehicleBrandList.length - 1) {
                    print('列表渲染到最后一条');
                    return Column(
                      children: <Widget>[
                        _getListTile(_vehicleBrandList, index),
                        Divider(),
                        _getMoreWidget(),
                      ],
                    );
                  } else {
                    return Column(
                      children: <Widget>[
                        _getListTile(_vehicleBrandList, index),
                        Divider(),
                      ],
                    );
                  }
                },
              ),
            )
          : _getMoreWidget(),
    );
  }

  // 加载中的圈圈
  Widget _getMoreWidget() {
    if (hasMore) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '加载中...',
                style: TextStyle(fontSize: 16),
              ),
              CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Text('我是有底线的!'),
      );
    }
  }
}

_getFileDetailListView(List fileDetailList) {
  return ListView(
    children: fileDetailList.map(
      (fileDetail) {
        return ListTile(
          leading: Image.network(fileDetail['filePath'] != null
              ? fileDetail['filePath']
              : "http://pic1.jisuapi.cn/car/static/images/logo/300/3.png"),
          title: Text(
              fileDetail['fileName'] != null ? fileDetail['fileName'] : '无名'),
          subtitle: Text(
              fileDetail['fileCode'] != null ? fileDetail['fileCode'] : '无编号'),
        );
      },
    ).toList(),
  );
}
