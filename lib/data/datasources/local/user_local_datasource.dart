import 'package:blott_assessment/data/data.dart';
import 'package:blott_assessment/domain/entities/user_entity.dart';

abstract class UserLocalDatasource {
  Future<UserEntity> create({
    required String firstName,
    required String lastName,
  });

  Future<UserEntity?> fetch();
}

class UserLocalDatasourceImpl implements UserLocalDatasource {
  UserLocalDatasourceImpl({
    required Database database,
  }) : _database = database;

  final Database _database;
  @override
  Future<UserEntity> create({
    required String firstName,
    required String lastName,
  }) async {
    final userEntity = await _database.usersDao.create(
      firstName: firstName,
      lastName: lastName,
    );
    return userEntity;
  }

  @override
  Future<UserEntity?> fetch() async {
    final userEntity = await _database.usersDao.fetch();
    return userEntity;
  }
}
