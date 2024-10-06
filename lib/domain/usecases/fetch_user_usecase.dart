import 'package:blott_assessment/core/core.dart';
import 'package:blott_assessment/domain/domain.dart';
import 'package:freezed_result/freezed_result.dart';

class FetchUserUsecase implements Usecases<UserEntity?, NoParams> {
  FetchUserUsecase(this.repository);
  final UserRepository repository;
  @override
  Future<Result<UserEntity?, Exception>> call([
    NoParams params = const NoParams(),
  ]) {
    return repository.fetch();
  }
}
