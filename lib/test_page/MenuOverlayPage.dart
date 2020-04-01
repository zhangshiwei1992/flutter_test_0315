import 'package:flutter/material.dart';

class MenuOverlayPage extends StatefulWidget {
  @override
  MenuOverlayState createState() => MenuOverlayState();
}

class MenuOverlayState extends State<MenuOverlayPage> {
  bool _isMenuShow = false;

  OverlayEntry _overlayEntry;
  GlobalKey _appMenuKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baidu App 浮动菜单'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 10,
                  ),
                  GestureDetector(
                    key: _appMenuKey,
                    onTap: () {
                      bool _show = !_isMenuShow;
                      setState(() {
                        _isMenuShow = _show;
                      });
                      _showOverlayMenu(_show);
                    },
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Text('分类'),
                          Container(width: 4),
                          Icon(_isMenuShow
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    renderBox = _appMenuKey.currentContext.findRenderObject();
    var menusize = renderBox.size;
    var menupositon = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) => Positioned(
        top: menupositon.dy + menusize.height,
        width: size.width,
        child: Container(
          color: Colors.yellow,
          child: Column(
            children: <Widget>[
              Container(height: 5),
              Row(
                children: <Widget>[
                  _widget('新增', Icons.add, () {
                    print('==========新增');
                  }),
                  _widget('修改', Icons.update, () {
                    print('==========修改');
                  }),
                  _widget('删除', Icons.delete, () {
                    print('==========删除');
                  }),
                  _widget('查看', Icons.query_builder, () {
                    print('==========查看');
                  }),
                ],
              ),
              Container(height: 20),
              Row(
                children: <Widget>[
                  _widget('home', Icons.account_balance, () {
                    print('==========个人中心');
                  }),
                  _widget('phone', Icons.add_call, () {
                    print('==========电话');
                  }),
                  _widget('airplane', Icons.airplanemode_active, () {
                    print('==========出行');
                  }),
                  _widget('music', Icons.audiotrack, () {
                    print('==========音乐');
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widget(String text, IconData icon, VoidCallback click) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            Icon(icon),
            Text(
              text,
              textAlign: TextAlign.center,
              style:
                  TextStyle(inherit: false, fontSize: 16.0, color: Colors.grey),
            )
          ],
        ),
        onTap: click,
      ),
    );
  }

  _showOverlayMenu(isMenuShow) {
    if (isMenuShow) {
      this._overlayEntry = this._createOverlayEntry(context);
      Overlay.of(context).insert(this._overlayEntry);
    } else {
      this._overlayEntry.remove();
    }
  }

  @override
  void dispose() {
    this._overlayEntry.remove();
    super.dispose();
  }
}
