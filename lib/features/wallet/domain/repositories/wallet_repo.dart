import 'package:dartz/dartz.dart';
import '../../../../core/api/http/failure.dart';
import '../../../../core/api/http/http_export.dart';
import '../../wallet_export.dart';

abstract class WalletRepo {
  Future<Either<Failure, BaseResponse>> getMyWallets();
  Future<Either<Failure, BaseResponse>> addDeposit(
      {required DepositModel deposit});
  Future<Either<Failure, BaseResponse>> makeWithdraw(
      {required DepositModel withdrawModel});
  Future<Either<Failure, BaseResponse>> getPaymentMethods(
      );
}
