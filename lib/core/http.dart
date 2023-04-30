import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goomba/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

final http = Dio();

void setupHttpClient() {
  http.options.baseUrl = 'http://192.168.1.11:8080/';
  http.options.headers['Content-Type'] = 'application/json';
  http.options.headers['Accept'] = 'application/json';

  http.interceptors.add(_TokenInterceptor());
  if (kDebugMode) {
    http.interceptors.add(_LoggerInterceptor());
  }
}

class _LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e('', err.error, err.stackTrace);
    return handler.reject(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.resolve(response);
  }
}

class _TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers.containsKey('no-auth')) {
      options.headers.remove('no-auth');
      return handler.next(options);
    }

    final preferences = await SharedPreferences.getInstance();
    final token = preferences.get('token');
    options.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    return handler.next(options);
  }
}
