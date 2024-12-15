import 'package:dartz/dartz.dart';

import '../../../../core/api/http/failure.dart';
import '../../../../injection_container.dart';
import '../../data/models/deals_entity.dart';
import '../../deals_export.dart';
import '../repositories/deals_repo.dart';

class DealsUsecase {
  final DealsRepo _repo = serviceLocator<DealsRepo>();

  Future<Either<Failure, DealsEntity>> getAvailableDeals(
      {required int pageNumber, required int pageSize}) async {
    return await _repo.getAvailableDeals(
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
  }

  Future<Either<Failure, DealsEntity>> getMyDeals(
      {required int pageNumber, required int pageSize}) async {
    return await _repo.getMyDeals(
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
  }

  Future<Either<Failure, DealsEntity>> getDetailsById({
    required int id,
  }) async {
    return await _repo.getDetailsById(id: id);
  }

  Future<Either<Failure, DealsEntity>> joinDeal({
    required JoinDealModel joinDealModel,
  }) async {
    return await _repo.joinDeal(joinDealModel: joinDealModel);
  }
}
