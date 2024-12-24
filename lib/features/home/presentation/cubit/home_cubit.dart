import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/injection_container.dart';
import '../../../../core/api/http/http_export.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../deals/deals_export.dart';
import '../../data/models/profitability_type_model.dart';
import '../../data/models/setting_model.dart';
import '../../domain/usecases/home_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);
  final _homeUsecase = serviceLocator<HomeUsecase>();
  SettingModel? settingModel;
  List<ProfitabilityTypeModel> profitabilityTypes=[];
  Future<void> getSettings() async {
    try {
      final failureOrDone = await _homeUsecase.getSettings();
      final either = AppUtils.mapFailuerOrDone(either: failureOrDone);
      if (either.data != null) {
        final data = either.data as BaseResponse;
        settingModel = SettingModel.fromMap(data.data);
        log('settingModel is ${settingModel?.toJson()}');
        emit(GetSettingsLoadedState());
      }
    } catch (e) {
      log('Error is $e', name: 'getSettings');
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> getProfitabilityTypes() async {
    try {
      final failureOrDone = await _homeUsecase.getProfitabilityTypes();
      final either = AppUtils.mapFailuerOrDone(either: failureOrDone);
      if (either.data != null) {
        profitabilityTypes = either.data as List<ProfitabilityTypeModel>;
        log('profitabilityTypes is ${profitabilityTypes?.length}');

        emit(GetProfitabilityTypesLoadedState());
      }
    } catch (e) {
      log('Error is $e', name: 'GetProfitabilityTypesLoadedState');
      emit(HomeErrorState(message: e.toString()));
    }
  }
}
