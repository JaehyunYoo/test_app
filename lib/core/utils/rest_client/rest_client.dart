import 'package:dio/dio.dart';

import 'http_config.dart';

class RestClient {
  static final Dio client = dioInit();

  static Dio dioInit() {
    Dio dio = Dio();
    dio.options.baseUrl = HttpConfig.baseURL;
    dio.options.connectTimeout = HttpConfig.connectionTimeout;
    dio.options.receiveTimeout = HttpConfig.receiveTimeout;
    dio.options.responseType = HttpConfig.responseType;
    return dio;
  }

  RestClient._internal();
}
