import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:qubeCommerce/core/api/http/base_response.dart';

import 'package:qubeCommerce/core/api/http/failure.dart';
import 'package:qubeCommerce/features/home/data/models/profitability_type_model.dart';

import '../../../../core/api/http/failure_handler.dart';
import '../../../../injection_container.dart';
import '../../domain/repositories/home_repo.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource _remoteDatasourse =
      serviceLocator<HomeRemoteDatasource>();

  final _failureHandler = serviceLocator<FailureHandler>();

  @override
  Future<Either<Failure, BaseResponse>> getSettings() async {
    try {
      final failureOrDone = await _remoteDatasourse.getSettings();
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }

  @override
  Future<Either<Failure, List<ProfitabilityTypeModel>>>
      getProfitabilityTypes() async {
    try {
      final failureOrDone = await _remoteDatasourse.getProfitabilityTypes();
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }
}
