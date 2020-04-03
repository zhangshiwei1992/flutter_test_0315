import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertest0315/constant/listData.dart';

class SwiperPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySwiperPage();
  }
}

class MySwiperPage extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: new Column(
        children: <Widget>[
          new Container(
            width: double.infinity,
            child: new AspectRatio(
              aspectRatio: 16 / 9,
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    listData[index]['filePath'],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: listData.length,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
                autoplay: true,
                loop: true,
//                viewportFraction: 0.8,
//                scale: 0.9,
                itemWidth: 300.0,
                layout: SwiperLayout.STACK,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
