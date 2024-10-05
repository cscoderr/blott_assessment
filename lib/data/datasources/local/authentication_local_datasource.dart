import 'package:blott_assessment/data/data.dart';
import 'package:blott_assessment/domain/entities/user_entity.dart';

abstract class AuthenticationLocalDatasource {
  Future<UserEntity> register({
    required String firstName,
    required String lastName,
  });
}

class AuthenticationLocalDatasourceImpl
    implements AuthenticationLocalDatasource {
  AuthenticationLocalDatasourceImpl({
    required Database database,
  }) : _database = database;

  final Database _database;
  @override
  Future<UserEntity> register({
    required String firstName,
    required String lastName,
  }) async {
    final userEntity = await _database.usersDao.getOrCreateSingleUser(
      null,
      firstName: firstName,
      lastName: lastName,
    );
    return userEntity;
  }
}
