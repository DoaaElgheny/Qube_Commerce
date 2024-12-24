
import '../../../../core/api/http/failure.dart';
import '../../../../core/api/http/http_export.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/profitability_type_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, BaseResponse>> getSettings();
  Future<Either<Failure, List<ProfitabilityTypeModel>>> getProfitabilityTypes();
}
