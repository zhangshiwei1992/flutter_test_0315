import 'package:flutter/material.dart';
import 'package:fluttertest0315/tabs/NotFoundPage.dart';
import 'package:fluttertest0315/test_page/ArgumentsTestPage.dart';
import 'package:fluttertest0315/test_page/HomePage22.dart';
import 'package:fluttertest0315/test_page/LoginPage.dart';
import 'package:fluttertest0315/test_page/PdfTestPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertest0315/test_page/TabBarPage.dart';
import 'package:fluttertest0315/tree/TreeMenuPage.dart';

import 'test_page/RowPage.dart';

void main() => runApp(MyApp());

Map<String, WidgetBuilder> routers = {
  '/ArgumentsTestPage': (context, {arguments}) => ArgumentsTestPage(arguments: arguments),
  "/TabBarPage": (context, {arguments}) => TabBarPage(arguments: arguments),
  "/TreeMenuPage": (context, {arguments}) => TreeMenuPage(arguments: arguments),
  "/HomePage22": (context, {arguments}) => HomePage22(arguments: arguments),
  "/LoginPage": (context, {arguments}) => LoginPage(arguments: arguments),
  "/RowPage": (context, {arguments}) => RowPage(arguments: arguments),
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

      /// 处理Named页面跳转 传递参数
      onGenerateRoute: (RouteSettings settings) {
        /// 统一处理
        final Function pageContentBuilder = routers[settings.name];
        if (pageContentBuilder != null) {
          final Route route = MaterialPageRoute(
            builder: (context) {
              //将RouteSettings中的arguments参数取出来，通过构造函数传入
              return pageContentBuilder(context, arguments: settings.arguments);
            },
            settings: settings,
          );
          return route;
        }
        return null;
      },

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
      home: PdfTestPage(),
      //routes优先执行，所以必须注释掉，否则onGenerateRoute方法不会调用
      //routes: routers,
    );
  }
}
