part of 'database.dart';

@DriftAccessor(tables: <Type>[Users])
class UsersDao extends DatabaseAccessor<Database> with _$UsersDaoMixin {
  UsersDao(super.db);

  Future<UserEntity> getOrCreateSingleUser(
    String? id, {
    String? firstName,
    String? lastName,
  }) async {
    if (id == null) {
      return into(users)
          .insertReturning(
            UsersCompanion.insert(
              firstName: firstName!,
              lastName: lastName!,
              createdAt: clock.now(),
            ),
          )
          .then(_mapUserDataModel);
    }
    return (select(users)..where((filter) => filter.id.equals(id)))
        .getSingleOrNull()
        .then(
      (UserDataModel? user) {
        if (user == null) {
          return getOrCreateSingleUser(null);
        }
        return _mapUserDataModel(user);
      },
    );
  }

  UserEntity _mapUserDataModel(UserDataModel user) =>
      user.toEntity(users.actualTableName);
}
