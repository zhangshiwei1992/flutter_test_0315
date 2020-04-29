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
//                            "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg"),
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
                        "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg"),
                  ),
                  decoration: BoxDecoration(
                    // 背景图片
                    image: DecorationImage(
                      image: NetworkImage(
                          "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  otherAccountsPictures: <Widget>[
                    Image.network(
                        "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg"),
                    Image.network(
                        "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg"),
                    Image.network(
                        "http://img5.mtime.cn/mt/2019/02/21/095918.47882172_270X405X4.jpg"),
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
