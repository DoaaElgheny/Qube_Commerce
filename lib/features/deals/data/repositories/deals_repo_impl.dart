import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qubeCommerce/features/deals/data/models/join_deal_model.dart';

import '../../../../core/api/http/failure.dart';
import '../../../../core/api/http/failure_handler.dart';
import '../../../../injection_container.dart';
import '../../domain/repositories/deals_repo.dart';
import '../datasources/deals_remote_datasource.dart';
import '../models/deals_entity.dart';

class DealsRepoImpl implements DealsRepo {
  final DealsRemoteDatasource _remoteDatasourse =
      serviceLocator<DealsRemoteDatasource>();

  final _failureHandler = serviceLocator<FailureHandler>();
  @override
  Future<Either<Failure, DealsEntity>> getAvailableDeals(
      {required int pageNumber, required int pageSize}) async {
    try {
      final failureOrDone = await _remoteDatasourse.getAvailableDeals(
          pageNumber: pageNumber, pageSize: pageSize);
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }

  @override
  Future<Either<Failure, DealsEntity>> getMyDeals(
      {required int pageNumber, required int pageSize}) async {
    try {
      final failureOrDone = await _remoteDatasourse.getMyDeals(
          pageNumber: pageNumber, pageSize: pageSize);
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }

  @override
  Future<Either<Failure, DealsEntity>> getDetailsById({required int id}) async {
    try {
      final failureOrDone = await _remoteDatasourse.getDetailsById(id: id);
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }

  @override
  Future<Either<Failure, DealsEntity>> joinDeal(
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
