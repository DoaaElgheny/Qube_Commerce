import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../prefs/my_shared_prefs.dart';
import '../utils/app_strings.dart';

class AppIntercepters extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers[AppStrings.contentType] = AppStrings.applicationJson;
    options.headers[AppStrings.AcceptLanguage] =
        SharedPrefController().languageCode;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
