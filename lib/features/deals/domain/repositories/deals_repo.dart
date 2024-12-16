import 'package:dartz/dartz.dart';
import '../../../../core/api/http/failure.dart';
import '../../../../core/api/http/http_export.dart';
import '../../deals_export.dart';

abstract class DealsRepo {
  Future<Either<Failure, BaseResponse>> getAvailableDeals(
      {required GetAvailableDealsModel getAvailableDealsModel});
  Future<Either<Failure, BaseResponse>> getMyDeals(
      {required int pageNumber, required int pageSize});
  Future<Either<Failure, BaseResponse>> getDetailsById({
    required int id,
  });
  Future<Either<Failure, BaseResponse>> joinDeal({
    required JoinDealModel joinDealModel,
  });
}
