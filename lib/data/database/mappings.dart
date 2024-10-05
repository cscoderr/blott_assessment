part of 'database.dart';

extension UserEntityExtension on UserDataModel {
  UserEntity toEntity(String tableName) {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      createdAt: createdAt,
    );
  }
}
