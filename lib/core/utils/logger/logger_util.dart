// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart' as logger;

///
/// divider custom part
///
const topLeftCorner = '┌';
const bottomLeftCorner = '└';
const longDivider =
    '───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────';
const middleCorner = '├';
const verticalLine = '│';
const doubleDivider = '─';
const singleDivider = '┄';

///
/// Output custom logger
///

class CustomLogOutput extends logger.LogOutput {
  final String level;
  final String emoji;
  CustomLogOutput(this.level, this.emoji);
  @override
  void output(logger.OutputEvent event) {
    final now = DateTime.now();
    final time = DateFormat('yyyy-MM-dd HH시mm분 ss초').format(now);

    for (int i = 0; i < event.lines.length; i++) {
      if (i == 1) {
        print('$level$verticalLine $emoji Time:$time');
        print('$level$bottomLeftCorner$longDivider');
      }
      print(
          '$level${event.lines[i].replaceAll(RegExp(r'\x1B\[[0-?]*[ -/]*[@-~]'), '')}');
    }
  }
}

class CustomRequestLogOutput extends logger.LogOutput {
  final String level;
  final RequestOptions requestOptions;
  CustomRequestLogOutput(this.level, this.requestOptions);
  @override
  void output(logger.OutputEvent event) {
    final now = DateTime.now();
    final time = DateFormat('yyyy-MM-dd HH시mm분 ss초').format(now);
    final url = '${requestOptions.baseUrl}${requestOptions.path}';
    requestOptions.queryParameters;
    for (int i = 0; i < event.lines.length; i++) {
      if (i == 1) {
        print(
            '$level$verticalLine [${requestOptions.method}] URL:[$url] Time:$time ');
        print(
            '$level$verticalLine [ContentType]: ${requestOptions.contentType}');
        print(
            '$level$verticalLine [Authorization]: ${requestOptions.headers['authorization']}');
        if (requestOptions.queryParameters.isNotEmpty) {
          print(
              '$level$verticalLine [Query]: ${requestOptions.queryParameters}');
        }

        print('$level$bottomLeftCorner$longDivider');
      }
      print(
          '$level${event.lines[i].replaceAll(RegExp(r'\x1B\[[0-?]*[ -/]*[@-~]'), '')}');
    }
  }
}

class CustomResponseLogOutput extends logger.LogOutput {
  final String level;
  final Response responseOption;
  CustomResponseLogOutput(this.level, this.responseOption);
  @override
  void output(logger.OutputEvent event) {
    final now = DateTime.now();
    final time = DateFormat('yyyy-MM-dd HH시mm분 ss초').format(now);
    final url =
        '${responseOption.requestOptions.baseUrl}${responseOption.requestOptions.path}';

    for (int i = 0; i < event.lines.length; i++) {
      if (i == 1) {
        print(
            '$level$verticalLine [${responseOption.requestOptions.method}] URL:[$url] Time:$time ');
        print('$level$verticalLine [STATUS]: ${responseOption.statusCode}');
        print('$level$bottomLeftCorner$longDivider');
      }
      print(
          '$level${event.lines[i].replaceAll(RegExp(r'\x1B\[[0-?]*[ -/]*[@-~]'), '')}');
    }
  }
}

class TestDioOption extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
