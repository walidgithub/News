import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

 static Future getData(
      {required String Url, required Map<String, dynamic> query}) async {
    return await dio!.get(Url, queryParameters: query);
  }
}
