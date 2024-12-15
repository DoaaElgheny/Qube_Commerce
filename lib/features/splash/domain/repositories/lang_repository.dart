import 'package:dartz/dartz.dart';
import '../../../../core/api/http/failure.dart';
import '../../../../core/error/Failure.dart';

abstract class LangRepository {
  Future<Either<Failure, bool>> changeLang({required String langCode});
  Future<Either<Failure, String>> getSavedLang();
}
