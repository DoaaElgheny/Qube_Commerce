import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../injection_container.dart';
import '../end_points.dart';
import 'http_export.dart';

class HttpServiceHelper {
  static Duration requestDuration = const Duration(seconds: 50);

  // static final _httpController = serviceLocator<HttpServiceImpl>();
  // static final _tokenController = serviceLocator<LoginCubit>();

  static BaseOptions options() {
    return BaseOptions(
      receiveTimeout: requestDuration,
      sendTimeout: requestDuration,
      connectTimeout: requestDuration,
      baseUrl: EndPoints.baseUrl,
    followRedirects: false,
      validateStatus: (status) {
        return status! <= 500;
      },
    );
  }

  static InterceptorsWrapper buildInterceptor() {
    return InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    );
  }

  static void _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    try {
      log('${options.method} ${options.uri}');
    } finally {
      handler.next(options); // must call it to continue request
    }
  }

  static void _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) {
    final statusCode = error.response?.statusCode;
    log('error.response?.statusCode $statusCode');
    log('error.message ${error.message}');
    log('error.response?.headers ${error.response?.headers}');
    log('error.response?.data ${error.response?.data}');

    if (statusCode == 401 || statusCode == 403) {
      log('error.response?.data ${error.response?.data}');
    } else {
      handler.next(error);
    }
  }

  static void _onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    // log('response.statusCode ${response.statusCode}');
    if (response.statusCode == 400) {
      handler.reject(DioException(
        requestOptions: response.requestOptions,
        response: response,
      ));
    } else if (response.statusCode == null) {
      log('response.statusCode ${response.statusCode}');
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      //! I commented this because when I use it, it make many requests to the server
      log('response.statusCode ${response.statusCode}');
      // handler.resolve(await _httpController.retry(response.requestOptions));
    } else {
      // if (response.statusCode != 204) {
      //   if (response.data is! String) {
      //     var result = BaseResponse.fromJson(response.data);
      //     if (result.status == 1 && result.Message == null) {
      //       throw Exception("Service Exception: ${result.Message}");
      //     }
      //   }
      // }

      handler.resolve(response);
    }
  }

  static PrettyDioLogger buildPrettyDioLoggerInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
      maxWidth: 40,
    );
  }
}
