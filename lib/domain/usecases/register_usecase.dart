import 'package:blott_assessment/domain/entities/user_entity.dart';
import 'package:blott_assessment/domain/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

class RegisterUsecase implements Usecases<RegisterParams, UserEntity> {
  RegisterUsecase(this.repository);
  final AuthenticationRepository repository;
  @override
  Future<UserEntity> call(RegisterParams params) {
    return repository.register(
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

abstract class Usecases<P, T> {
  Future<T> call(P params);
}
