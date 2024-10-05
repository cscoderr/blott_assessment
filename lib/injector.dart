import 'package:blott_assessment/data/data.dart';
import 'package:blott_assessment/data/datasources/datasources.dart';
import 'package:blott_assessment/data/repositories/authentication_repository_impl.dart';
import 'package:blott_assessment/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void initInjector() {
  final database = Database();
  getIt
    ..registerLazySingleton<Dio>(
      () => Dio()..options.baseUrl = '',
    )
    ..registerLazySingleton<AuthenticationLocalDatasource>(
      () => AuthenticationLocalDatasourceImpl(database: database),
    )
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(localDatasource: getIt()),
    )
    ..registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(getIt()),
    );
}
