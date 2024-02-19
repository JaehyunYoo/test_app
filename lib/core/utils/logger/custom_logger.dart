// ignore_for_file: avoid_print

import 'package:chat_app/core/utils/logger/logger_util.dart';
import 'package:chat_app/core/utils/rest_client/http_config.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart' as logger;

class Logger {
  Logger._();

  ///
  /// log method count 0, errorCount 0,
  ///
  static void log(dynamic message) {
    final logger.Logger log = logger.Logger(
      output: CustomLogOutput('LOG', '💦'),
      printer: logger.PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 0,
        printTime: false,
        printEmojis: false,
      ),
    );
    log.i('$message');
  }

  ///
  /// log method count 3, errorCount 10,
  ///
  static void stackLog(dynamic message, {int? methodCount, int? errorCount}) {
    final logger.Logger log = logger.Logger(
      output: CustomLogOutput('DEBUG', '🔑'),
      printer: logger.PrettyPrinter(
        methodCount: methodCount ?? 3,
        errorMethodCount: errorCount ?? 10,
        printTime: false,
        printEmojis: false,
      ),
    );
    log.i('$message');
  }

  static void errorLog(dynamic message, {int? methodCount, int? errorCount}) {
    final logger.Logger log = logger.Logger(
      output: CustomLogOutput('ERROR', '🪓'),
      printer: logger.PrettyPrinter(
        methodCount: methodCount ?? 0,
        errorMethodCount: errorCount ?? 10,
        printTime: false,
        printEmojis: false,
      ),
    );
    log.e('$message');
  }

  static void requestLog() {
    final reqOpt = RequestOptions(
        contentType: HttpConfig.contentType,
        baseUrl: 'http://localhost:8080',
        path: '/api/v1/auth/login',
        headers: {
          'authorization': '123%!@#ASDF!@#!@#!SDFASDF',
        },
        queryParameters: {
          "test": 1,
          "123": 5,
          "key": false,
        },
        data: {
          "data": {"id": 1, "title": "hello"}
        });
    final logger.Logger log = logger.Logger(
      output: CustomRequestLogOutput('REQUEST', reqOpt),
      printer: logger.PrettyPrinter(
        methodCount: 0,
        printTime: false,
        printEmojis: false,
      ),
    );
    log.i(reqOpt.data);
  }

  static void responseLog() {
    final resOption = Response(
      statusCode: 200,
      data: {
        "a": "b",
      },
      requestOptions: RequestOptions(
        contentType: HttpConfig.contentType,
        baseUrl: 'http://localhost:8080',
        path: '/api/v1/auth/login',
        headers: {
          'authorization': '123%!@#ASDF!@#!@#!SDFASDF',
        },
        queryParameters: {
          "test": 1,
          "123": 5,
          "key": false,
        },
        data: {
          "data": {"id": 1, "title": "hello"}
        },
      ),
    );
    final logger.Logger log = logger.Logger(
      output: CustomResponseLogOutput('RESPONSE', resOption),
      printer: logger.PrettyPrinter(
        methodCount: 0,
        printTime: false,
        printEmojis: false,
      ),
    );
    log.i(resOption.data);
  }

  static void apiErrorLog() {
    final resOption = Response(
      statusCode: 200,
      data: {
        "a": "b",
      },
      requestOptions: RequestOptions(
        contentType: HttpConfig.contentType,
        baseUrl: 'http://localhost:8080',
        path: '/api/v1/auth/login',
        headers: {
          'authorization': '123%!@#ASDF!@#!@#!SDFASDF',
        },
        queryParameters: {
          "test": 1,
          "123": 5,
          "key": false,
        },
        data: {
          "data": {"id": 1, "title": "hello"}
        },
      ),
    );
    final logger.Logger log = logger.Logger(
      output: CustomResponseLogOutput('RESPONSE', resOption),
      printer: logger.PrettyPrinter(
        methodCount: 0,
        printTime: false,
        printEmojis: false,
      ),
    );
    log.i(resOption.data);
  }
}
