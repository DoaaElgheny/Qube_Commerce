import 'package:dartz/dartz.dart';
import '../../../../core/api/http/failure.dart';
import '../../data/models/deals_entity.dart';
import '../../deals_export.dart';

abstract class DealsRepo {
  Future<Either<Failure, DealsEntity>> getAvailableDeals(
      {required int pageNumber, required int pageSize});
  Future<Either<Failure, DealsEntity>> getMyDeals(
      {required int pageNumber, required int pageSize});
  Future<Either<Failure, DealsEntity>> getDetailsById({
    required int id,
  });
  Future<Either<Failure, DealsEntity>> joinDeal({
    required JoinDealModel joinDealModel,
  });
}
