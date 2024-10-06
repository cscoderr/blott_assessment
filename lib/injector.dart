import 'package:blott_assessment/core/core.dart';
import 'package:blott_assessment/data/data.dart';
import 'package:blott_assessment/data/datasources/datasources.dart';
import 'package:blott_assessment/data/repositories/home_repository_impl.dart';
import 'package:blott_assessment/domain/domain.dart';
import 'package:blott_assessment/domain/usecases/get_market_news_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void initInjector() {
  final database = Database();
  getIt
    ..registerLazySingleton<InAppMemory>(
      InAppMemory.new,
    )
    ..registerLazySingleton<Dio>(
      () => Dio()..options.baseUrl = AppConstant.baseUrl,
    )
    ..registerLazySingleton<AuthenticationLocalDatasource>(
      () => AuthenticationLocalDatasourceImpl(database: database),
    )
    ..registerLazySingleton<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl(dio: getIt()),
    )
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(localDatasource: getIt()),
    )
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDatasource: getIt()),
    )
    ..registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(getIt()),
    )
    ..registerLazySingleton<GetMarketNewsUsecase>(
      () => GetMarketNewsUsecase(getIt()),
    );
}
