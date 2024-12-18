import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qubeCommerce/features/wallet/data/models/wallet_model.dart';
import 'package:qubeCommerce/features/wallet/domain/usecases/wallet_usecase.dart';
import 'package:qubeCommerce/injection_container.dart';

import '../../../../core/api/http/http_export.dart';
import '../../../../core/utils/app_utils.dart';

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
}
