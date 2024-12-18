import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/http/http_export.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../injection_container.dart';
import '../../deals_export.dart';

part 'join_deal_state.dart';

class JoinDealCubit extends Cubit<JoinDealState> {
  JoinDealCubit() : super(JoinDealInitial());
    static JoinDealCubit get(BuildContext context) => BlocProvider.of(context);
  final _dealsUsecase = serviceLocator<DealsUsecase>();
  Future<void> joinDeal() async {
    emit(JoinDealLoadingState());
    try {
      final failureOrDone = await _dealsUsecase.joinDeal(joinDealModel: JoinDealModel());
      final either = AppUtils.mapFailuerOrDone(either: failureOrDone);
      if (either.data != null) {
        final data = either.data as BaseResponse;
        //! return data 
        emit(JoinDealLoadedState());
      }
    } catch (e) {
      log('Error is $e', name: 'getMyDeals');
      emit(JoinDealErrorState(message: e.toString()));
    }
  }
}
