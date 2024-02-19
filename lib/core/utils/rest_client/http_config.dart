import 'package:dio/dio.dart';

class HttpConfig {
  static String baseURL = 'http://localhost:8080';

  static Duration connectionTimeout = const Duration(seconds: 7);

  static Duration receiveTimeout = const Duration(seconds: 25);

  static String contentType = Headers.jsonContentType;

  static ResponseType responseType = ResponseType.json;
}
