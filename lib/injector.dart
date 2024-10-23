import 'package:blott_assessment/core/core.dart';
import 'package:blott_assessment/data/data.dart';
import 'package:blott_assessment/data/datasources/datasources.dart';
import 'package:blott_assessment/data/repositories/home_repository_impl.dart';
import 'package:blott_assessment/domain/domain.dart';
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
    ..registerLazySingleton<UserLocalDatasource>(
      () => UserLocalDatasourceImpl(database: database),
    )
    ..registerLazySingleton<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl(dio: getIt()),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(localDatasource: getIt()),
    )
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDatasource: getIt()),
    )
    ..registerLazySingleton<CreateUserUsecase>(
      () => CreateUserUsecase(getIt()),
    )
    ..registerLazySingleton<GetMarketNewsUsecase>(
      () => GetMarketNewsUsecase(getIt()),
    )
    ..registerLazySingleton<FetchUserUsecase>(
      () => FetchUserUsecase(getIt()),
    );
}
