import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        headers: {
          'Content-Type': 'application/json',
        },
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData({
    required String path,
    required Map<String, dynamic>? query,
    String lang = 'ar',
    required String token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token,
    };

    return await dio!.get(path, queryParameters: query);
  }

  static Future<Response> postData({
    required String path,
    required Map<String, dynamic>? data,
    required Map<String, dynamic>? query,
    String lang = 'ar',
    String? token
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await dio!.post(path, data: data, queryParameters: query);
  }
}
