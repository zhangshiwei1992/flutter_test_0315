import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'PdfPage.dart';
import 'app_image_pre_view.dart';
import '../constant/app_style.dart';
import '../utils/ScreenAdaper.dart';

/// app-图片展示 - 1张
class AppImageShow extends StatelessWidget {
  /// 图片的url
  String url;

  /// 当前图片所在的分组的所有图片
  List<String> filePathList;

  /// 当前图片在所在分组的所有图片中的位置
  int index;

  /// 圆角
  double circular;

  /// 图片外距 - 左下右上
  int left;
  int bottom;
  int right;
  int top;

  /// 点击事件
  VoidCallback click;

  AppImageShow({
    this.url,
    this.filePathList,
    this.index,
    this.circular = AppStyle.radius_5,
    this.left = AppStyle.mp_0,
    this.bottom = AppStyle.mp_20,
    this.right = AppStyle.mp_20,
    this.top = AppStyle.mp_0,
    this.click,
  });

  Future<File> createFileOfPdfUrl() async {
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    int _width = (ScreenAdapter.getScreenWidth() - left - right) ~/ 2;
    return Container(
      margin: EdgeInsets.only(
        left: ScreenAdapter.width(left),
        bottom: ScreenAdapter.width(bottom),
        right: ScreenAdapter.width(right),
        top: ScreenAdapter.height(top),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(circular),
      ),
      height: ScreenAdapter.width(_width),
      width: ScreenAdapter.width(_width),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(circular),
        child: InkWell(
          child: CachedNetworkImage(
            imageUrl: filePathList[index].contains(".pdf") ? "https://public-aibiyag.oss-cn-shanghai.aliyuncs.com/app/common/pdf_sign.png" : url,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          onTap: () {
            if (filePathList[index].contains(".pdf")) {
              createFileOfPdfUrl().then((pdfFile) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen(pdfFile.path),
                  ),
                );
              });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return PicPreView(
                      picList: filePathList,
                      index: index,
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}

/// app-图片展示 - 流式展示多张图片
class WrapAppImageShow extends StatelessWidget {
  /// 当前图片所在的分组的所有图片
  List<String> filePathList;

  /// 圆角 - 内部图片
  double circular;

  /// 外距 - 内部图片
  int left;
  int bottom;
  int right;
  int top;

  /// 点击事件 - 内部图片
  VoidCallback click;

  WrapAppImageShow({
    this.filePathList,
    this.circular = AppStyle.radius_5,
    this.left = AppStyle.mp_0,
    this.bottom = AppStyle.mp_20,
    this.right = AppStyle.mp_20,
    this.top = AppStyle.mp_0,
    this.click,
  });

  @override
  Widget build(BuildContext context) {
    if (null == filePathList || filePathList.isEmpty) {
      return Container();
    }
    return Wrap(
      children: filePathList.asMap().keys.map((key) {
        return AppImageShow(
          url: filePathList[key],
          filePathList: filePathList,
          index: key,
          circular: circular,
          left: left,
          bottom: bottom,
          right: right,
          top: top,
          click: click,
        );
      }).toList(),
    );
  }
}
