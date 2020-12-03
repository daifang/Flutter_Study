import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  baseUrl: "http://api.tianapi.com/", // host
  connectTimeout: 5000, // 超时
  receiveTimeout: 3000,
);
Dio dio = Dio(options);

// 无拦截器版本

// Get 请求
Future get(String path) async {
  var resquest = await dio.get(path);
  Map result = {
    'code': resquest.statusCode,
    'data': resquest.data,
    'message': resquest.statusMessage
  };
  return result;
}

// Post 请求
Future post(String path, Map<String, dynamic> body) async {
  var resquest = await dio.post(path, data: body);
  Map result = {
    'code': resquest.statusCode,
    'data': resquest.data,
    'message': resquest.statusMessage
  };
  return result;
}
// 多请求任务

getAll() {}

postAll() {}
