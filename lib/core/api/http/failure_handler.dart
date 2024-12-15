import 'package:dio/dio.dart';

import 'failure.dart';

class FailureHandler {
  Failure getFailureType(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return RequestCanceledFailure(
            msg: 'requestWasCancelled');
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
        return ConnectionTimeoutFailure(
            msg: 'requestTimeout');
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
        return _handleStatuesCodeResponse(dioException.response);
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
        return NoInternetConnectionFailure(
          msg: 'noInternetConnection',
          data: dioException.response?.data,
        );
    }
  }

  dynamic _handleStatuesCodeResponse(Response? response) {
    if (response == null) {
      return UnknownFailure(msg: 'genericError');
    } else {
      switch (response.statusCode) {
        case 200:
        case 201:
          return response;
        case 500:
          return InternalServerErrorFailure(
            msg: 'genericError',
            data: response.data,
          );
        case 400:
          return BadRequestFailure(
            msg: 'badRequest',
            data: response.data,
          );
        case 401:
          return UnauthorizedFailure(
            msg: 'unauthorizedError',
            data: response.data,
          );
        case 404:
          return NotFoundFailure(
            msg: 'notFound',
            data: response.data,
          );
        case 405:
          return MethodNotAllowedFailure(
            msg: 'methodNotAllowed',
            data: response.data,
          );
        case 408:
          return ConnectionTimeoutFailure(
            msg: 'requestTimeout',
            data: response.data,
          );
        default:
          return NoInternetConnectionFailure(
            msg: 'noInternetConnection',
            data: response.data,
          );
      }
    }
  }
}
