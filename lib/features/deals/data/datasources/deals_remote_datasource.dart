import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qubeCommerce/core/api/http/request_data.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/api/http/http_export.dart';
import '../../../../core/api/http/http_service.dart';
import '../../../../core/authentication/provider.dart';
import '../../../../injection_container.dart';
import '../../deals_export.dart';

abstract class DealsRemoteDatasource {
  Future<BaseResponse> getAvailableDeals({
    required GetAvailableDealsModel getAvailableDealsModel,
  });
  Future<BaseResponse> getMyDeals({
    required int pageNumber,
    required int pageSize,
     int? status,
  });
  Future<BaseResponse> getDetailsById({
    required int id,
  });
  Future<BaseResponse> joinDeal({
    required JoinDealModel joinDealModel,
  });
}

class DealsRemoteDatasourceImpl implements DealsRemoteDatasource {
  final _httpHelper = serviceLocator<HttpService>();

  @override
  Future<BaseResponse> getAvailableDeals(
      {required GetAvailableDealsModel getAvailableDealsModel}) async {
    final Response response = await _httpHelper.get(
      EndPoints.dealsAvailable,
      requestData:
          RequestData(params: getAvailableDealsModel.toMap(), headers: {
        "Authorization":
            "Bearer ${AuthenticationProvider.instance.currentUser!.accessToken}"
      }),
    );
    return Future.value(BaseResponse.fromMap(response.data));
  }

  @override
  Future<BaseResponse> getMyDeals({
    required int pageNumber,
    required int pageSize,
     int? status,
  }) async {
    final Response response = await _httpHelper.get(
      EndPoints.mydeals,
      requestData: RequestData(params: {
        "PageNumber": pageNumber,
        'PageSize': pageSize,
        'Status': status,
      }),
    );
    return Future.value(BaseResponse.fromMap(response.data));
  }

  @override
  Future<BaseResponse> getDetailsById({required int id}) async {
    final Response response = await _httpHelper.get(
      EndPoints.detailsDealById,
      requestData: RequestData(params: {
        "Id": id,
      }),
    );
    return Future.value(BaseResponse.fromMap(response.data));
  }

  @override
  Future<BaseResponse> joinDeal({required JoinDealModel joinDealModel}) async {
    final Response response =
        await _httpHelper.post(EndPoints.joinDeal, joinDealModel.toMap());

    return Future.value(BaseResponse.fromMap(response.data));
  }
}
