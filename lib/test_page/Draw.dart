import 'package:flutter/material.dart';

class MyDraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
// 左侧抽屉头部
          Row(
            children: <Widget>[
              Expanded(
//                  child: DrawerHeader(
//                    child: Text('你好Flutter'),
//                    decoration: BoxDecoration(
//                      // 背景图片
//                      image: DecorationImage(
//                        image: NetworkImage(
//                            'http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000017_GPS_O_15638127740000000741_0.png?Expires=4719486397&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=TB6sctRhQnUltL1qy6tOPEbvavE%3D'),
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                  ),
                child: UserAccountsDrawerHeader(
                  accountName:
                      Text('四维空间', style: TextStyle(color: Colors.black)),
                  accountEmail: Text('zhangshiwei199204@163.com',
                      style: TextStyle(color: Colors.black)),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000017_GPS_O_15638127740000000741_0.png?Expires=4719486397&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=TB6sctRhQnUltL1qy6tOPEbvavE%3D'),
                  ),
                  decoration: BoxDecoration(
                    // 背景图片
                    image: DecorationImage(
                      image: NetworkImage(
                          'http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000027_V15637857830000002549_0.png?Expires=4719486988&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=VqVKTd%2B8Ojh6EuQhRaKdXR0v5Nw%3D'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  otherAccountsPictures: <Widget>[
                    Image.network(
                        'http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000027_V15637857830000002549_0.png?Expires=4719487151&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=mBEMULoAq2xGWIiLm7EzRpgzHLE%3D'),
                    Image.network(
                        'http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000027_V15637857830000002549_0.png?Expires=4719487151&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=mBEMULoAq2xGWIiLm7EzRpgzHLE%3D'),
                    Image.network(
                        'http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000027_V15637857830000002549_0.png?Expires=4719487151&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=mBEMULoAq2xGWIiLm7EzRpgzHLE%3D'),
                  ],
                ),
              )
            ],
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.home),
            ),
            title: Text('我的空间'),
            onTap: () {
              // 先隐藏左侧菜单栏
              Navigator.of(context).pop();
              // 再跳转到用户信息页面
              Navigator.pushNamed(context, '/UserInfo');
            },
          ),
          // Divider --- 一条线
          Divider(color: Colors.blue),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.people),
            ),
            title: Text('好友'),
          ),
          Divider(color: Colors.blue),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.settings),
            ),
            title: Text('设置'),
          ),
          Divider(color: Colors.blue),
        ],
      ),
    );
  }
}
