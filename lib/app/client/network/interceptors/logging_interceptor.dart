import 'dart:developer';
import 'package:dio/dio.dart';

class LoggingInterceptor implements Interceptor {
  final bool isEnabled;

  LoggingInterceptor({this.isEnabled = true});

  @override
  void onError(DioException exception, ErrorInterceptorHandler handler) {
    if (!isEnabled) return handler.next(exception);

    log('❌ ❌ ❌ Dio Exception!');
    log('❌ ❌ ❌ Url: ${exception.requestOptions.uri}');
    log('❌ ❌ ❌ Method: ${exception.requestOptions.method}');
    log('❌ ❌ ❌ Status Code: ${exception.response?.statusCode}');
    log('❌ ❌ ❌ Response Errors: ${exception.response?.data}');
    log('❌ ❌ ❌ Stack Trace: ${exception.stackTrace}');
    log('-------------------------');
    return handler.next(exception);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!isEnabled) return handler.next(options);

    log('➡️➡️➡️ Sending request');
    log('➡️➡️➡️ ${options.method} ${options.baseUrl}${options.path}');
    log('➡️➡️➡️ Headers: ${options.headers}');
    log('➡️➡️➡️ Query params: ${options.queryParameters}');
    if (options.data != null) {
      log('➡️➡️➡️ Body: ${options.data}');
    }
    log('-------------------------');
    return handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (!isEnabled) return handler.next(response);

    final statusCode = response.statusCode ?? 0;
    final isSuccess = statusCode >= 200 && statusCode < 300;

    log('⬅️ ⬅️ ⬅️ Retrieved response');
    log(
      '<---- ${isSuccess ? '✅ $statusCode ✅' : '❌ $statusCode ❌'} ${response.requestOptions.baseUrl}${response.requestOptions.path}',
    );
    log('⬅️ ⬅️ ⬅️ Query params: ${response.requestOptions.queryParameters}');

    if (isSuccess && response.data != null) {
      final dataStr = response.data.toString();
      log('⬅️ ⬅️ ⬅️ Response data: ${dataStr.length > 500 ? '${dataStr.substring(0, 500)}...' : dataStr}');
    }

    log('-------------------------');
    return handler.next(response);
  }
}
