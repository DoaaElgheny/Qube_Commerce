import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/features/deals/deals_export.dart';
import 'package:qubeCommerce/injection_container.dart';

import '../../../../core/utils/app_utils.dart';

part 'deals_state.dart';

class DealsCubit extends Cubit<DealsState> {
  DealsCubit() : super(DealsInitial());
  static DealsCubit get(BuildContext context) => BlocProvider.of(context);
  final _dealsUsecase = serviceLocator<DealsUsecase>();
  List<DealModel?> availableDeals = [];
  Data? availableDealsData;
  List<DealModel?> myDeals = [];

  Future<void> getAvailableDeals() async {
    emit(DealsLoadingSttete());
    try {
      final failureOrDone = await _dealsUsecase.getAvailableDeals(
        pageNumber: 1,
        pageSize: 10,
      );
      final either = AppUtils.mapFailuerOrDone(either: failureOrDone);
      if (either.data != null) {
        final data = either.data as DealsEntity;
        availableDealsData = data.data;
        availableDeals = availableDealsData!.data as List<DealModel?>;
        log('data is $availableDeals');
        emit(DealsLoadedState());
      }
    } catch (e) {
      log('Error is $e', name: 'getAvailableDeals');
      emit(DealsErrorState(message: e.toString()));
    }
  }

  Future<void> getMyDeals() async {
    emit(GetMyDealsLoadingSttete());
    try {
      final failureOrDone = await _dealsUsecase.getMyDeals(
        pageNumber: 1,
        pageSize: 10,
      );
      final either = AppUtils.mapFailuerOrDone(either: failureOrDone);
      if (either.data != null) {
        final data = either.data as DealsEntity;
        myDeals = data.data!.data as List<DealModel?>;
        log('data is $myDeals');
        emit(GetMyDealsLoadedState());
      }
    } catch (e) {
      log('Error is $e', name: 'getAvailableDeals');
      emit(DealsErrorState(message: e.toString()));
    }
  }
}
