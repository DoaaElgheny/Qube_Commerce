import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qubeCommerce/core/api/http/request_data.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/api/http/http_service.dart';
import '../../../../core/authentication/provider.dart';
import '../../../../injection_container.dart';
import '../../deals_export.dart';
import '../models/deals_entity.dart';

abstract class DealsRemoteDatasource {
  Future<DealsEntity> getAvailableDeals(
      {required int pageNumber, required int pageSize});
  Future<DealsEntity> getMyDeals(
      {required int pageNumber, required int pageSize});
  Future<DealsEntity> getDetailsById({
    required int id,
  });
  Future<DealsEntity> joinDeal({
    required JoinDealModel joinDealModel,
  });
}

class DealsRemoteDatasourceImpl implements DealsRemoteDatasource {
  final _httpHelper = serviceLocator<HttpService>();

  @override
  Future<DealsEntity> getAvailableDeals(
      {required int pageNumber, required int pageSize}) async {
    final Response response = await _httpHelper.get(
      EndPoints.dealsAvailable,
      requestData: RequestData(params: {
        "PageNumber": pageNumber,
        'PageSize': pageSize,
      }, headers: {
        "Authorization":
            "Bearer ${AuthenticationProvider.instance.currentUser!.accessToken}"
      }),
    );
    log('response.data is ${response.data}');
    return Future.value(DealsEntity.fromMap(response.data));
  }

  @override
  Future<DealsEntity> getMyDeals(
      {required int pageNumber, required int pageSize}) async {
    final Response response = await _httpHelper.get(
      EndPoints.mydeals,
      requestData: RequestData(params: {
        "PageNumber": pageNumber,
        'PageSize': pageSize,
      }),
    );
    return Future.value(DealsEntity.fromMap(response.data));
  }

  @override
  Future<DealsEntity> getDetailsById({required int id}) async {
    final Response response = await _httpHelper.get(
      EndPoints.detailsDealById,
      requestData: RequestData(params: {
        "Id": id,
      }),
    );
    return Future.value(DealsEntity.fromMap(response.data));
  }

  @override
  Future<DealsEntity> joinDeal({required JoinDealModel joinDealModel}) async {
    final Response response =
        await _httpHelper.post(EndPoints.joinDeal, joinDealModel.toMap());

    return Future.value(DealsEntity.fromMap(response.data));
  }
}
