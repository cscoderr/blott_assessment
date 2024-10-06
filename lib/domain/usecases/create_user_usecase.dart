import 'package:blott_assessment/core/core.dart';
import 'package:blott_assessment/domain/entities/user_entity.dart';
import 'package:blott_assessment/domain/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_result/freezed_result.dart';

class CreateUserUsecase implements Usecases<UserEntity, RegisterParams> {
  CreateUserUsecase(this.repository);
  final UserRepository repository;
  @override
  Future<Result<UserEntity, Exception>> call(RegisterParams params) {
    return repository.create(
      firstName: params.firstName,
      lastName: params.lastName,
    );
  }
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.firstName,
    required this.lastName,
  });
  final String firstName;
  final String lastName;
  @override
  List<Object?> get props => [];
}
