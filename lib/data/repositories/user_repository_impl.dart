import 'package:blott_assessment/core/core.dart';
import 'package:blott_assessment/data/datasources/datasources.dart';
import 'package:blott_assessment/domain/domain.dart';
import 'package:freezed_result/freezed_result.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required UserLocalDatasource localDatasource,
  }) : _localDatasource = localDatasource;

  final UserLocalDatasource _localDatasource;

  @override
  Future<Result<UserEntity, Exception>> create({
    required String firstName,
    required String lastName,
  }) async {
    try {
      final user = await _localDatasource.create(
        firstName: firstName,
        lastName: lastName,
      );
      return Result.success(user);
    } catch (e) {
      return Result.failure(AppException(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity?, Exception>> fetch() async {
    try {
      final user = await _localDatasource.fetch();
      return Result.success(user);
    } catch (e) {
      return Result.failure(AppException(e.toString()));
    }
  }
}
