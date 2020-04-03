import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 图片预览 - 全屏轮播图
class PicPreView extends Dialog {
  /// 图片地址
  final List picList;

  /// 轮播图初始的图片下标，默认从第一页显示
  final int index;

  PicPreView({
    @required this.picList,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Swiper(
          autoplay: picList.length == 1 ? false : true,
          itemWidth: double.infinity,
          itemHeight: double.infinity,
          itemCount: picList?.length,
          index: index,
          loop: false,
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
              activeColor: Colors.white,
            ),
          ),
          control: SwiperControl(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CachedNetworkImage(
                imageUrl: picList[index].contains(".pdf")
                    ? "https://public-aibiyag.oss-cn-shanghai.aliyuncs.com/app/common/pdf_sign.png"
                    : picList[index],
                fit: BoxFit.fitWidth,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );
          },
        ),
      ),
    );
  }
}
