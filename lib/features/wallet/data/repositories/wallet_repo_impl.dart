import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/http/failure.dart';
import '../../../../core/api/http/failure_handler.dart';
import '../../../../core/api/http/http_export.dart';
import '../../../../injection_container.dart';
import '../../wallet_export.dart';

class WalletRepoImpl implements WalletRepo {
  final WalletRemoteDatasource _remoteDatasourse =
      serviceLocator<WalletRemoteDatasource>();

  final _failureHandler = serviceLocator<FailureHandler>();

  @override
  Future<Either<Failure, BaseResponse>> addDeposit(
      {required DepositModel deposit}) async {
    try {
      final failureOrDone =
          await _remoteDatasourse.addDeposit(deposit: deposit);
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> getMyWallets() async {
    try {
      final failureOrDone = await _remoteDatasourse.getMyWallets();
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> makeWithdraw(
      {required DepositModel withdrawModel}) async {
    try {
      final failureOrDone =
          await _remoteDatasourse.makeWithdraw(withdrawModel: withdrawModel);
      return Right(failureOrDone);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }
}
