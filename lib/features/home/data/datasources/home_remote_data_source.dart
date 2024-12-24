// import 'package:qubeCommerce/features/home/domain/entities/deal_parameter.dart';
// import 'package:qubeCommerce/features/home/domain/entities/deals_entity.dart';

// import '../../../../core/api/api_consumer.dart';

import 'package:dio/dio.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/api/http/http_export.dart';
import '../../../../core/authentication/provider.dart';
import '../../../../injection_container.dart';
import '../models/profitability_type_model.dart';

abstract class HomeRemoteDatasource {
  Future<BaseResponse> getSettings();
  Future<List<ProfitabilityTypeModel>> getProfitabilityTypes();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final _httpHelper = serviceLocator<HttpService>();

  @override
  Future<BaseResponse> getSettings() async {
    final Response response = await _httpHelper.get(
      EndPoints.getSettings,
      requestData: RequestData(headers: {
        "Authorization":
            "Bearer ${AuthenticationProvider.instance.currentUser!.accessToken}"
      }),
    );
    return Future.value(BaseResponse.fromMap(response.data));
  }

  @override
  Future<List<ProfitabilityTypeModel>> getProfitabilityTypes() async {
    final Response response = await _httpHelper.get(
      EndPoints.profitabilityTypes,
      requestData: RequestData(headers: {
        "Authorization":
            "Bearer ${AuthenticationProvider.instance.currentUser!.accessToken}"
      }),
    );
    final profitabilityTypes = List<ProfitabilityTypeModel>.from(
        response.data.map((e) => ProfitabilityTypeModel.fromMap(e))).toList();
    return Future.value(profitabilityTypes);
  }
}
