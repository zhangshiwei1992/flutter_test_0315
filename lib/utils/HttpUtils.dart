import 'package:dio/dio.dart';
import 'package:fluttertest0315/constant/EnvInfo.dart';
import 'package:fluttertest0315/model/Result.dart';

/// 通用的发送请求
Future<Result> post(String path, var requestBody) async {
  print('post请求-----------------------开始啦');
  Result result = new Result();
  try {
//    SharedPreferences sp = await SharedPreferences.getInstance();
//    Map<String, dynamic> headers = {
//      'Session-Key': sp.getString(SpConstant.SESSION_KEY)
//    };
//    print('sessionKey:${sp.getString(SpConstant.SESSION_KEY)}');
    Map<String, dynamic> headers = {"sso_user_account": "zhangshiwei"};
    Options options = new Options(
      baseUrl: EnvInfo.apiHost,
      headers: headers,
      path: path,
      method: 'POST',
      responseType: ResponseType.JSON,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    var response = await Dio().post(path, data: requestBody, options: options);
    print('request result: ${response.data}');
    Map resultData = response.data;
    result = Result.fromJson(resultData);
    print('post请求-----------------------结束');
    return result;
  } catch (exception) {
    print(exception.toString());
    return Result();
  }
}
