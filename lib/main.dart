import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest0315/tabs/NotFoundPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constant/EnvInfo.dart';
import 'routes/routes.dart';


void main() {
  //设定运行环境的环境变量
  EnvInfo.env = Env.DEV;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 添加如下代码，使状态栏透明
    if (Platform.isAndroid) {
      var style = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(style);
    }
    return MaterialApp(
      title: 'Flutter Demo',

      /// 是否展示debug图标
      debugShowCheckedModeBanner: false,
      // 国际化处理-展示中文
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      locale: Locale("zh"),

      /// 处理Named页面跳转 传递参数
      onGenerateRoute: myOnGenerateRoute,

      /// 空白页跳转
      onUnknownRoute: (RouteSettings setting) {
        String name = setting.name;
        print("onUnknownRoute:$name");
        return MaterialPageRoute(builder: (context) {
          return NotFoundPage();
        });
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//     home: PdfTestPage(),
      initialRoute: "/",
      //routes优先执行，所以必须注释掉，否则onGenerateRoute方法不会调用
      //routes: routers,
    );
  }
}
