import 'package:flutter/material.dart';

class ListViewPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewState();
  }
}

class ListViewState extends State<ListViewPage2>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarController'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Text(
            "------第$index项======",
            style: TextStyle(
              fontSize: 30,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: 100,
        controller: scrollController,
      ),
    );
  }

  // 生命周期函数:销毁时调用
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
