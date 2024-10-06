import 'package:blott_assessment/domain/domain.dart';
import 'package:freezed_result/freezed_result.dart';

abstract class UserRepository {
  Future<Result<UserEntity, Exception>> create({
    required String firstName,
    required String lastName,
  });

  Future<Result<UserEntity?, Exception>> fetch();
}
