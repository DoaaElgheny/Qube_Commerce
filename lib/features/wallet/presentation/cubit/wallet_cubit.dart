import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qubeCommerce/features/wallet/data/models/wallet_model.dart';
import 'package:qubeCommerce/features/wallet/domain/usecases/wallet_usecase.dart';
import 'package:qubeCommerce/injection_container.dart';

import '../../../../core/api/http/http_export.dart';
import '../../../../core/utils/app_utils.dart';
import '../../data/models/deposit_model.dart';
import '../../data/models/payment_method_model.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());
  final _walletUsecase = serviceLocator<WalletUsecase>();
  List<WalletModel>? myWallets;

  Future<void> getMyWallets() async {
    emit(GetMyWalletsLoadingState());
    try {
      final failureOrDone = await _walletUsecase.getMyWallets();
      final either = AppUtils.mapFailuerOrDone(either: failureOrDone);
      if (either.data != null) {
        final data = either.data as BaseResponse;
        myWallets = List<WalletModel>.from(
            data.data.map((e) => WalletModel.fromMap(e)));
        emit(GetMyWalletsLoadedState());
      }
    } catch (e) {
      log('Error is $e', name: 'getMyWallets');
      emit(WalletErrorState(message: e.toString()));
    }
  }

  List<PaymentMethodModel> paymentMethods = [];

  Future<void> getPaymentMethods() async {
    emit(GetPaymentMethodsLoadingState());
    try {
      final failureOrDone = await _walletUsecase.getPaymentMethods();

      final either = AppUtils.mapFailuerOrDone(either: failureOrDone);

      if (either.data != null) {
        final data = either.data as BaseResponse;

        paymentMethods = List<PaymentMethodModel>.from(
          (data.data as List<dynamic>).map(
              (e) => PaymentMethodModel.fromMap(e as Map<String, dynamic>)),
        );

        emit(GetPaymentMethodsLoadedState());
      }
    } catch (e) {
      log('Error is $e', name: 'getPaymentMethods');
      emit(GetPaymentMethodsErrorState(message: e.toString()));
    }
  }

  /// withdrawal logic
  Future<void> makeWithdraw({required DepositModel withdrawModel}) async {
    emit(WithdrawLoadingState()); // Emit loading state
    try {
      // Call the use case to make the withdrawal
      final failureOrDone = await _walletUsecase.makeWithdraw(withdrawModel: withdrawModel);
      final either = AppUtils.mapFailuerOrDone(either: failureOrDone);

      if (either.data != null) {
        final data = either.data as BaseResponse;
        // On success, emit success state
        emit(WithdrawSuccessState());
      } else {
        // If the response data is null, emit failure state
        emit(WithdrawErrorState(message: 'Withdrawal failed.'));
      }
    } catch (e) {
      log('Error is $e', name: 'makeWithdraw');
      emit(WithdrawErrorState(message: e.toString()));
    }
  }

}
