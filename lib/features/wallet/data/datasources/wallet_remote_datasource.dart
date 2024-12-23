import 'dart:developer';

import 'package:dio/dio.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/http/http_export.dart';
import '../../../../core/authentication/provider.dart';
import '../../../../injection_container.dart';
import '../../wallet_export.dart';

abstract class WalletRemoteDatasource {
  Future<BaseResponse> getMyWallets();
  Future<BaseResponse> addDeposit({required DepositModel deposit});
  Future<BaseResponse> makeWithdraw({required DepositModel withdrawModel});
  Future<BaseResponse> getPaymentMethods();
}

class WalletRemoteDatasourceImpl implements WalletRemoteDatasource {
  final _httpHelper = serviceLocator<HttpService>();

  @override
  Future<BaseResponse> addDeposit({required DepositModel deposit}) async {
    final Response response = await _httpHelper.post(
      EndPoints.deposit,
      deposit.toMap(),
    );
    return Future.value(BaseResponse.fromMap(response.data));
  }

  @override
  Future<BaseResponse> getMyWallets() async {
    final Response response = await _httpHelper.get(
      EndPoints.getMyWallets,
      requestData: RequestData(headers: {
        "Authorization":
            "Bearer ${AuthenticationProvider.instance.currentUser!.accessToken}"
      }),
    );
    return Future.value(BaseResponse.fromMap(response.data));
  }

  @override
  Future<BaseResponse> makeWithdraw(
      {required DepositModel withdrawModel}) async {
    final Response response = await _httpHelper.post(
      EndPoints.withdraw,
      withdrawModel.toMap(),
    );
    return Future.value(BaseResponse.fromMap(response.data));
  }

  @override
  Future<BaseResponse> getPaymentMethods() async {
    final Response response = await _httpHelper.get(
      EndPoints.paymentMethodsLookup,
    );
    return Future.value(BaseResponse.fromMap(response.data));
}
}
