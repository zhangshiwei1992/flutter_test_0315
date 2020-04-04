flutter相关学习记录
flutter版本及分支: flutter_v1.9.1_hotfix.6 , stable ;

1. BottomNavigationBar : 底部导航 ;
2. Swiper : 轮播图 ; flutter_swiper: ^1.1.6
3. AspectRatio : 配置宽高比例 ;
4. ScreenUtil : 适配不同屏幕大小比例 ; flutter_screenutil: ^0.5.3
5. GridView : 网格布局(无法设置内部元素的高度,只能设置宽高比例) ;
	嵌套时 :
		shrinkWrap:true, // 解决无限高度问题;
		physics:NeverScrolllableScrolllPhysics(); // 禁用滑动事件
6. Wrap : 流式布局,自动换行 ;
7. ListView : 滑动 ;
	在竖向ListView中嵌套横向ListView时要注意给横向ListView外层加一个容器，然后外层这个容器要设置高度，
	外层这个容器可以是 SizedBox ，也可以是 Container。
8. json.encode(string) 可以得到 json字符串;
9. json.decode(jsonString) 可以得到map对象;
10. 使用模型类序列化json - 推荐;
11. shared_preferences : 本地存储; shared_preferences: ^0.5.3
12. dio : http请求 ; dio: ^3.0.4
13. RaisedButton : 凸起按钮;
14. 分割线: Divider() - 横向 ; VerticalDivider() - 纵向;
15. Expanded : 填充自适应;
16. Inkwell : 可点击组件,相当于按钮;
17. Stack : 层叠;
18. Container : 大的组件, padding设置内边距,marign设置外边距;
19. height:double.infinity, : 高度自适应;
20. IndexedStack : 层布局组件,与stack不同的是,同时加载了管理的所有页面,每次只显示一层;
21. AutomaticKeepAliveClientMixin : 结合tab切换保持页面状态;
22. Positioned : 定位组件,比如二级导航,固定在顶部,下面的商品列表可滑动;
23. Drawer : 侧边导航栏;
24. flutter run -d all : 链接了多个设备,同时运行;
25. SizedBox(height/width) : 空的盒子,可以用于控制间距;
26. showMenu : 弹出下拉菜单;
27. flex : 按照比例分隔;
28. TabBar : 顶部导航;可以放在title或botton中,区别在于一级和二级导航;
29. ShowModalBottonSheet : 底部弹出选择框;使用GestureDetector设置onTap事件return一个false,点击才不会消失底部弹出框;
30. GestureDetector : 手势事件;
31. Chip : 椭圆形按钮;
32. decoration : BoxDecoration,容器装饰组件;
33. flex : 比例属性,可以放在expanded中,让此组件按照比例占据剩下的空间;
34. InAppWebView : 解析加载html;
35. showModalBottomSheet : 下部弹出框;
36. AutomaticKeepAliveClientMixin : 页面数据缓存,再次进入不加载,配合pageView或TabBarView使用;
37. StatefulBuilder : 重新加载showModalBottomSheet下部弹框的值;
38. borderRadius: BorderRadius.circular(10) : 设置圆形幅度, 放在container的decoration: BoxDecoration中;
39. onTap: () {  _searchContent; }) ----> 自定义触发方法; 要加(){   }
40. Row 和 Column 都是 Flex 组件：
	它们所有的子元素都会布局在一个方向 ; 它们不能滚动，所以当内容超出可用范围，flutter就会报错,
	如: Row中放一个Text,Text过长,不会自动换行!!!! 用Expanded包裹Text让他填满Row即可!
41. 多个附件上传:  multi_image_picker: ^4.5.9
42. 本机: EnvInfo.host = "http://10.0.2.2:8080";
43. 处理图片圆角:1. ClipRRect(
					borderRadius: BorderRadius.circular(20),
					child: CachedNetworkImage( imageUrl: _image, fit: BoxFit.cover, ),
				  );
			 2. Container( decoration: ShapeDecoration(
				  image: DecorationImage(
					  image: AssetImage(_image),
					  fit: BoxFit.fitWidth),
				  shape: RoundedRectangleBorder(
					  borderRadius: BorderRadiusDirectional.circular(20)))) ;
			3. Card(
					shape: RoundedRectangleBorder(
						borderRadius: BorderRadiusDirectional.circular(20)),
					clipBehavior: Clip.antiAlias,
					child: Image.asset(
					  "images/landscape0.jpeg",
					  width: double.maxFinite,
					),
				  )

44. 打包android apk指定main文件: flutter build apk -t lib\main_test.dart
45. flutter build apk --target-platform android-arm,android-arm64 --split-per-abi -t lib\main_test.dart
46. flutter build appbundle --target-platform android-arm,android-arm64 -t lib\main_test.dart
47. 家装 - app - 打包位置 : C:\workSpace_flutter\flutter_aibiyag\build\app\outputs\apk\release

48. 真机调试: flutter run -d all -t lib\main_test.dart
49. 启动时查看详情日志: flutter run --verbose
50. flutter_staggered_grid_view : 瀑布流组件;
51. transparent_image: 淡入占位符;
52. 后台控件Offstage: offstage属性为true时隐藏
53. 键盘  TextInputType.numberWithOptions(signed: true, decimal: true),  根据需要设置里面的options
54. TextInputType.numberWithOptions(signed: false, decimal: true),  -- 这种键盘是没法自动关闭的...
55. 下部弹出框-设置无色: backgroundColor: Colors.transparent,
56. Container设置边框: decoration: BoxDecoration(color: Color(AppStyle.color_grey_f0),border: Border.all(color: Colors.red,width: 5,),),
57. 在组件NestedScrollView中 - ListView: 默认padding值不是0!
58. 测试flutter_test_0315打包位置: C:\workSpace_flutter\flutter_test_0315\build\app\outputs\apk\release
59. 引入重复: Program type already present: android.support.v4.os.ResultReceiver$MyResultR
		解决: 在gradle.properties中加入：
			android.useAndroidX=true
			android.enableJetifier=true
60.