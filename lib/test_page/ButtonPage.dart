import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<ButtonPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 页面底部的浮动按钮
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 18),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(40),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.yellow,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
//            Navigator.of(context).pop();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text('按钮演示页面'),
      ),
      body: MyButtonBody(),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航条按钮集合
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('咸鱼')),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('鱼塘')),
          BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('发布')),
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
        ],
        // 图标大小
        iconSize: 35.0,
        // 当前被选中的是第几个(从0开始计算)
        currentIndex: this._currentIndex,
        // 选中的颜色
        fixedColor: Colors.yellow,
        // 选中触发的方法
        onTap: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        // 底部导航栏类型 fixed-可以有多个按钮
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class MyButtonBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            RaisedButton(
              child: Text('普通RaisedButton按钮'),
              onPressed: () {
                print('点击------RaisedButton按钮');
              },
            ),
            RaisedButton(
              // 按钮颜色
              color: Colors.blue,
              // 字体颜色
              textColor: Colors.white,
              child: Text('有颜色RaisedButton按钮'),
              onPressed: () {
                print('点击------RaisedButton按钮');
              },
            ),
            RaisedButton(
              // 按钮颜色
              color: Colors.blue,
              // 字体颜色
              textColor: Colors.white,
              // 阴影效果
              elevation: 8,
              child: Text('有颜色有阴影RaisedButton按钮'),
              onPressed: () {
                print('点击------RaisedButton按钮');
              },
            ),
            Container(
              height: 50,
              width: 200,
              child: RaisedButton(
                // 按钮颜色
                color: Colors.blue,
                // 字体颜色
                textColor: Colors.white,
                // 阴影效果
                elevation: 20,
                child: Text('改宽高按钮'),
                onPressed: () {
                  print('点击------RaisedButton按钮');
                },
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                // 按钮颜色
                color: Colors.blue,
                // 字体颜色
                textColor: Colors.white,
                // 阴影效果
                elevation: 20,
                // 点击时的水波纹的颜色
                splashColor: Colors.red,
                child: Text('自适应宽度按钮'),
                onPressed: () {
                  print('点击------RaisedButton按钮');
                },
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton.icon(
              // 按钮颜色
              color: Colors.blue,
              // 字体颜色
              textColor: Colors.white,
              // 阴影效果
              elevation: 20,
              icon: Icon(Icons.search),
              label: Text('图标按钮'),
              // 禁用 置灰
              onPressed: null,
//              onPressed: () {
//                print('点击------RaisedButton按钮');
//              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            RaisedButton(
              child: Text('圆角按钮'),
              onPressed: () {
                print('点击------RaisedButton按钮');
              },
              // 设置按钮圆角
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 60,
              width: 60,
              child: RaisedButton(
                child: Text('圆形按钮'),
                onPressed: () {
                  print('点击------RaisedButton按钮');
                },
                shape: CircleBorder(
                  side: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            FlatButton(
              child: Text('扁平化按钮'),
              onPressed: () {
                print('点击------FlatButton按钮');
              },
            ),
            SizedBox(width: 20),
            OutlineButton(
              child: Text('线框按钮'),
              onPressed: () {
                print('点击------OutlineButton按钮');
              },
            ),
            SizedBox(width: 20),
            IconButton(
              icon: Container(
                height: 50,
                width: 50,
                child: Icon(Icons.add),
              ),
              onPressed: () {
                print('点击------OutlineButton按钮');
              },
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 按钮组
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('登录'),
                  onPressed: () {
                    print('点击------RaisedButton按钮');
                  },
                  // 设置按钮圆角
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('注册'),
                  onPressed: () {
                    print('点击------RaisedButton按钮');
                  },
                  // 设置按钮圆角
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                MyRaisedButton(
                  text: '自定义按钮',
                  height: 40,
                  width: 150,
                  color: Colors.blue,
                  onPressed: () {
                    print('点击自定义按钮=========================');
                  },
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class MyRaisedButton extends StatelessWidget {
  final text;
  final onPressed;
  final double height;
  final double width;
  final Color color;
  final Color textColor;

  const MyRaisedButton(
      {this.text = '',
      this.height = 30.0,
      this.width = 80.0,
      this.color = Colors.blue,
      this.textColor = Colors.white,
      this.onPressed = null});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        child: Text(this.text),
        color: this.color,
        textColor: this.textColor,
        onPressed: this.onPressed,
      ),
    );
  }
}
