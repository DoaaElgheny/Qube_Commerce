import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/features/deals/deals_export.dart';
import 'package:qubeCommerce/injection_container.dart';

import '../../../../core/api/http/http_export.dart';
import '../../../../core/utils/app_utils.dart';

part 'deals_state.dart';

class DealsCubit extends Cubit<DealsState> {
  DealsCubit() : super(DealsInitial());
  static DealsCubit get(BuildContext context) => BlocProvider.of(context);
  final _dealsUsecase = serviceLocator<DealsUsecase>();
  List<DealModel?>? availableDeals;
  Data? availableDealsData;
  List<DealModel?>? myDeals ;
  DealsDetailsModel? dealsDetailsModel;

  Future<void> getAvailableDeals() async {
    emit(DealsLoadingState());
    try {
      final failureOrDone = await _dealsUsecase.getAvailableDeals(
        getAvailableDealsModel: GetAvailableDealsModel(
          pageNumber: 1,
          pageSize: 10,
        ),
      );
      final either = AppUtils.mapFailuerOrDone(either: failureOrDone);
      if (either.data != null) {
        final data = either.data as BaseResponse;
        availableDealsData = Data.fromMap(data.data);
        // List<SuperBranchesModel>.from(
        // baseResponse.result.map((x) => SuperBranchesModel.fromMap(x)))
        availableDeals = availableDealsData!.data as List<DealModel?>;
        emit(DealsLoadedState());
      }
    } catch (e) {
      log('Error is $e', name: 'getAvailableDeals');
      emit(DealsErrorState(message: e.toString()));
    }
  }

  Future<void> getMyDeals() async {
    emit(GetMyDealsLoadingState());
    try {
      final failureOrDone = await _dealsUsecase.getMyDeals(
        pageNumber: 1,
        pageSize: 10,
      );
      final either = AppUtils.mapFailuerOrDone(either: failureOrDone);
      if (either.data != null) {
        final data = either.data as BaseResponse;

        myDeals = Data.fromMap(data.data!).data as List<DealModel?>;
        emit(GetMyDealsLoadedState());
      }
    } catch (e) {
      log('Error is $e', name: 'getMyDeals');
      emit(DealsErrorState(message: e.toString()));
    }
  }

  Future<void> getDetailsOfDeals(int id) async {
    emit(GetDetailsOfDealsLoadingState());
    try {
      final failureOrDone = await _dealsUsecase.getDetailsById(id: id);
      final either = AppUtils.mapFailuerOrDone(either: failureOrDone);
      if (either.data != null) {
        final data = either.data as BaseResponse;
        dealsDetailsModel = DealsDetailsModel.fromMap(data.data!);
        emit(GetDetailsOfDealsLoadedState());
      }
    } catch (e) {
      log('Error is $e', name: 'getDetailsOfDeals');
      emit(DealsErrorState(message: e.toString()));
    }
  }
}
