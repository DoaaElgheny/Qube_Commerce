import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/http/failure.dart';
import '../../../../core/api/http/failure_handler.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../injection_container.dart';
import '../../domain/repositories/lang_repository.dart';
import '../datasources/lang_local_data_source.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  final _failureHandler = serviceLocator<FailureHandler>();
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }
}
