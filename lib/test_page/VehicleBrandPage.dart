import 'package:flutter/material.dart';
import 'package:fluttertest0315/model/Result.dart';

class VehicleBrandPage extends StatelessWidget {
  Result result;

  VehicleBrandPage({this.result});

  @override
  Widget build(BuildContext context) {
    print("================VehicleBrandPage:${this.result.value}");
    List _list = this.result.value;
    return Scaffold(
      appBar: AppBar(
        title: Text('品牌信息'),
      ),
      body: ListView(
        children: _list.map(
          (brand) {
            return ListTile(
              leading: Image.network(brand['logo'] != null
                  ? brand['logo']
                  : "http://pic1.jisuapi.cn/car/static/images/logo/300/3.png"),
              title: Text(brand['name'] != null ? brand['name'] : '无名'),
              subtitle:
                  Text(brand['initial'] != null ? brand['initial'] : '无首字母'),
            );
          },
        ).toList(),
      ),
    );
  }
}
