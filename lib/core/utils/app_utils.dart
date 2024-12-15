import 'package:dartz/dartz.dart';

import '../api/http/failure.dart';

class AppUtils {
  static ({Failure? failure, Object? data}) mapFailuerOrDone({
    required Either<Failure, Object> either,
  }) {
    Failure? f;
    Object? d;
    either.fold((failure) => f = failure, (data) => d = data);
    return (failure: f, data: d);
  }
}
