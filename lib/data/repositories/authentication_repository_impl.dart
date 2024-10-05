import 'package:blott_assessment/data/datasources/datasources.dart';
import 'package:blott_assessment/domain/domain.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required AuthenticationLocalDatasource localDatasource,
  }) : _localDatasource = localDatasource;

  final AuthenticationLocalDatasource _localDatasource;
  @override
  Future<UserEntity> register({
    required String firstName,
    required String lastName,
  }) async {
    try {
      final user = await _localDatasource.register(
        firstName: firstName,
        lastName: lastName,
      );
      return user;
    } catch (e) {
      print(e);
      return UserEntity(
        id: 'id',
        firstName: 'firstName',
        lastName: 'lastName',
        createdAt: DateTime.now(),
      );
    }
  }
}
