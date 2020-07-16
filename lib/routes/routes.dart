import 'package:flutter/material.dart';
import 'package:fluttertest0315/tabs/FirstPage.dart';
import 'package:fluttertest0315/tabs/PersonPage.dart';
import 'package:fluttertest0315/test_page/ArgumentsTestPage.dart';
import 'package:fluttertest0315/test_page/ButtonPage.dart';
import 'package:fluttertest0315/test_page/CardPage.dart';
import 'package:fluttertest0315/test_page/CheckBoxPage.dart';
import 'package:fluttertest0315/test_page/DialogPage.dart';
import 'package:fluttertest0315/test_page/DropDownPage.dart';
import 'package:fluttertest0315/test_page/ExpandedPage.dart';
import 'package:fluttertest0315/test_page/FormDemoPage.dart';
import 'package:fluttertest0315/test_page/GestureDetectorPage.dart';
import 'package:fluttertest0315/test_page/HomePage22.dart';
import 'package:fluttertest0315/test_page/HtmlResolvePage.dart';
import 'package:fluttertest0315/test_page/HttpTestPage.dart';
import 'package:fluttertest0315/test_page/InkWellPage.dart';
import 'package:fluttertest0315/test_page/LoginPage.dart';
import 'package:fluttertest0315/test_page/MenuPage.dart';
import 'package:fluttertest0315/test_page/PdfTestPage.dart';
import 'package:fluttertest0315/test_page/ProductInfoPage.dart';
import 'package:fluttertest0315/test_page/ProductPage.dart';
import 'package:fluttertest0315/test_page/RadioPage.dart';
import 'package:fluttertest0315/test_page/RefreshIndicatorPage.dart';
import 'package:fluttertest0315/test_page/Register/Login.dart';
import 'package:fluttertest0315/test_page/Register/RegisterFirst.dart';
import 'package:fluttertest0315/test_page/Register/RegisterSecond.dart';
import 'package:fluttertest0315/test_page/Register/RegisterThird.dart';
import 'package:fluttertest0315/test_page/RowPage.dart';
import 'package:fluttertest0315/test_page/StackPage.dart';
import 'package:fluttertest0315/test_page/SwitchPage.dart';
import 'package:fluttertest0315/test_page/TabBarController.dart';
import 'package:fluttertest0315/test_page/TabBarPage.dart';
import 'package:fluttertest0315/test_page/TextFieldPage.dart';
import 'package:fluttertest0315/test_page/TimePage.dart';
import 'package:fluttertest0315/test_page/UserInfo.dart';
import 'package:fluttertest0315/test_page/VehicleBrandPage.dart';
import 'package:fluttertest0315/test_page/VehicleVendorPage.dart';
import 'package:fluttertest0315/test_page/WebViewPage.dart';
import 'package:fluttertest0315/test_page/animation/AnimationDemo.dart';
import 'package:fluttertest0315/test_page/animationtest/AnimatedLogo.dart';
import 'package:fluttertest0315/tree/TreeMenuPage.dart';
import 'package:fluttertest0315/test_page/VideoPage.dart';
import 'package:fluttertest0315/test_page/TransferPage.dart';
import 'package:fluttertest0315/test_page/AnimationButtonPage.dart';
import 'package:fluttertest0315/test_page/AnimationButtonPage2.dart';

final routes = {
  "/": (context) => FirstPage(),
  '/ArgumentsTestPage': (context, {arguments}) =>
      ArgumentsTestPage(arguments: arguments),
  "/TabBarPage": (context, {arguments}) => TabBarPage(arguments: arguments),
  "/TreeMenuPage": (context, {arguments}) => TreeMenuPage(arguments: arguments),
  "/HomePage22": (context, {arguments}) => HomePage22(arguments: arguments),
  "/LoginPage": (context, {arguments}) => LoginPage(arguments: arguments),
  "/RowPage": (context, {arguments}) => RowPage(arguments: arguments),
  '/ExpandedPage': (context) => ExpandedPage(),
  '/StackPage': (context) => StackPage(),
  '/ProductPage': (context, {arguments}) => ProductPage(title: arguments),
  '/ProductInfoPage': (context, {arguments}) =>
      ProductInfoPage(arguments: arguments),
  '/Login': (context, {arguments}) => Login(arguments: arguments),
  '/RegisterFirst': (context, {arguments}) =>
      RegisterFirst(arguments: arguments),
  '/RegisterSecond': (context, {arguments}) =>
      RegisterSecond(arguments: arguments),
  '/RegisterThird': (context) => RegisterThird(),
  '/PersonPage': (context) => PersonPage(),
  '/CardPage': (context) => CardPage(),
  '/MenuPage': (context) => MenuPage(),
  '/PdfTestPage': (context) => PdfTestPage(),
  '/TabBarController': (context) => TabBarController(),
  '/UserInfo': (context) => UserInfo(),
  '/ButtonPage': (context) => ButtonPage(),
  '/TextFieldPage': (context) => TextFieldPage(),
  '/CheckBoxPage': (context) => CheckBoxPage(),
  '/RadioPage': (context) => RadioPage(),
  '/SwitchPage': (context) => SwitchPage(),
  '/FormDemoPage': (context) => FormDemoPage(),
  '/TimePage': (context) => TimePage(),
  '/InkWellPage': (context) => InkWellPage(),
  '/GestureDetectorPage': (context) => GestureDetectorPage(),
  '/HttpTestPage': (context) => HttpTestPage(),
  '/VehicleBrandPage': (context, {arguments}) =>
      VehicleBrandPage(result: arguments),
  '/DropDownPage': (context) => DropDownPage(),
  '/DialogPage': (context) => DialogPage(),
  '/RefreshIndicatorPage': (context) => RefreshIndicatorPage(),
  '/HtmlResolvePage': (context) => HtmlResolvePage(),
  '/VehicleVendorPage': (context, {arguments}) =>
      VehicleVendorPage(arguments: arguments),
  '/WebViewPage': (context) => WebViewPage(),
  '/VideoPage': (context) => VideoPage(),
  '/TransferPage': (context) => TransferPage(),
  '/AnimationButtonPage': (context) => AnimationButtonPage(),
  '/AnimationDemoPage': (context) => AnimationDemoPage(),
  '/AnimatedLogo': (context) => AnimatedLogo(),
  '/AnimationButtonPage2': (context) => AnimationButtonPage2(),
};

var myOnGenerateRoute = (RouteSettings settings) {
  // 统一处理 可传参
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments),
      );
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
