import 'package:dartz/dartz.dart';

import '../../../../core/api/http/failure.dart';
import '../../../../core/api/http/http_export.dart';
import '../../../../injection_container.dart';
import '../../deals_export.dart';

class DealsUsecase {
  final DealsRepo _repo = serviceLocator<DealsRepo>();

  Future<Either<Failure, BaseResponse>> getAvailableDeals(
      {required GetAvailableDealsModel getAvailableDealsModel}) async {
    return await _repo.getAvailableDeals(
      getAvailableDealsModel: getAvailableDealsModel,
    );
  }

  Future<Either<Failure, BaseResponse>> getMyDeals(
      {required int pageNumber, required int pageSize}) async {
    return await _repo.getMyDeals(
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
  }

  Future<Either<Failure, BaseResponse>> getDetailsById({
    required int id,
  }) async {
    return await _repo.getDetailsById(id: id);
  }

  Future<Either<Failure, BaseResponse>> joinDeal({
    required JoinDealModel joinDealModel,
  }) async {
    return await _repo.joinDeal(joinDealModel: joinDealModel);
  }
}
