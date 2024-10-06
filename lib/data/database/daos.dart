part of 'database.dart';

@DriftAccessor(tables: <Type>[Users])
class UsersDao extends DatabaseAccessor<Database> with _$UsersDaoMixin {
  UsersDao(super.db);

  Future<UserEntity> create({
    required String firstName,
    required String lastName,
  }) async {
    return into(users)
        .insertReturning(
          UsersCompanion.insert(
            firstName: firstName,
            lastName: lastName,
            createdAt: clock.now(),
          ),
        )
        .then(_mapUserDataModel);
  }

  Future<UserEntity?> fetch() => select(users).getSingleOrNull().then(
        (value) => value?.toEntity(users.actualTableName),
      );

  UserEntity _mapUserDataModel(UserDataModel user) =>
      user.toEntity(users.actualTableName);
}
