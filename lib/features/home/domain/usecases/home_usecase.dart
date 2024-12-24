import 'package:dartz/dartz.dart';

import '../../../../core/api/http/failure.dart';
import '../../../../core/api/http/http_export.dart';
import '../../../../injection_container.dart';
import '../../data/models/profitability_type_model.dart';
import '../repositories/home_repo.dart';

class HomeUsecase {
  final _repo = serviceLocator<HomeRepo>();

  Future<Either<Failure, BaseResponse>> getSettings() async {
    return await _repo.getSettings();
  }

  Future<Either<Failure, List<ProfitabilityTypeModel>>>
      getProfitabilityTypes() async {
    return await _repo.getProfitabilityTypes();
  }
}
