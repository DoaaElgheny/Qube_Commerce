import 'package:dartz/dartz.dart';

import '../../../../core/api/http/failure.dart';
import '../../../../core/api/http/http_export.dart';
import '../../../../injection_container.dart';
import '../../wallet_export.dart';

class WalletUsecase {
  final WalletRepo _repo = serviceLocator<WalletRepo>();

  Future<Either<Failure, BaseResponse>> getMyWallets() async {
    return await _repo.getMyWallets();
  }

  Future<Either<Failure, BaseResponse>> addDeposit(
      {required DepositModel deposit}) async {
    return await _repo.addDeposit(deposit: deposit);
  }

  Future<Either<Failure, BaseResponse>> makeWithdraw(
      {required DepositModel withdrawModel}) async {
    return await _repo.makeWithdraw(withdrawModel: withdrawModel);
  }

  Future<Either<Failure, BaseResponse>> getPaymentMethods() async {
    return await _repo.getPaymentMethods();
  }
}
