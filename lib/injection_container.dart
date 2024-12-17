import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/api/http/failure_handler.dart';
import 'core/api/http/http_export.dart';
import 'core/netwok/connection_cubit.dart';
import 'features/bottomNavigationBar/injection_container.dart';
import 'features/deals/deals_export.dart';
import 'features/home/injection_container.dart';
import 'features/splash/injection_container.dart';
import 'features/wallet/wallet_export.dart';

final sl = GetIt.instance;
//! I make this 'serviceLocator' to can know the get_it service I use.
final serviceLocator = sl;

Future<void> init() async {
  initSplash();
  // initHome();

  initButtomnavigationbarGotGame();

  //! Core
  // sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  // sl.registerLazySingleton<DioConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<ConnectionCubit>(() => ConnectionCubit());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => AppIntercepters());
  //هادا لطباعة اللوج
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));

  // sl.registerLazySingleton(() => Dio());

  //!################################ By Mahmoud ############################

  //!################################ Package ###############################
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  //! ############################### Service ###############################
  serviceLocator.registerLazySingleton<FailureHandler>(() => FailureHandler());
  serviceLocator.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  //! ################################ Datasources #################################

  serviceLocator.registerLazySingleton<DealsRemoteDatasource>(
      () => DealsRemoteDatasourceImpl());
  serviceLocator.registerLazySingleton<WalletRemoteDatasource>(
      () => WalletRemoteDatasourceImpl());
  //! ################################# Repository #################################

  serviceLocator.registerLazySingleton<DealsRepo>(() => DealsRepoImpl());
  serviceLocator.registerLazySingleton<WalletRepo>(() => WalletRepoImpl());
  //! ################################# Usecases #################################
  serviceLocator.registerLazySingleton(() => DealsUsecase());
  serviceLocator.registerLazySingleton(() => WalletUsecase());
  //! ############################### Bloc Or Cubit ###############################
  serviceLocator.registerFactory(() => DealsCubit());
  serviceLocator.registerSingleton(WalletCubit());
}
