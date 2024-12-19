import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/http/failure.dart';
import '../../../../core/api/http/failure_handler.dart';
import '../../../../core/api/http/http_export.dart';
import '../../../../injection_container.dart';
import '../../deals_export.dart';

class DealsRepoImpl implements DealsRepo {
  final DealsRemoteDatasource _remoteDatasourse =
      serviceLocator<DealsRemoteDatasource>();

  final _failureHandler = serviceLocator<FailureHandler>();
  @override
  Future<Either<Failure, BaseResponse>> getAvailableDeals(
      {required GetAvailableDealsModel getAvailableDealsModel}) async {
    try {
      final failureOrDone = await _remoteDatasourse.getAvailableDeals(
        getAvailableDealsModel: getAvailableDealsModel,
      );
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> getMyDeals(
      {required int pageNumber, required int pageSize, int? status}) async {
    try {
      final failureOrDone = await _remoteDatasourse.getMyDeals(
        pageNumber: pageNumber,
        pageSize: pageSize,
        status: status,
      );
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> getDetailsById(
      {required int id}) async {
    try {
      final failureOrDone = await _remoteDatasourse.getDetailsById(id: id);
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> joinDeal(
      {required JoinDealModel joinDealModel}) async {
    try {
      final failureOrDone =
          await _remoteDatasourse.joinDeal(joinDealModel: joinDealModel);
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }
}
