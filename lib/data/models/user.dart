import 'package:blott_assessment/domain/domain.dart';

class User extends UserEntity {
  User({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.createdAt,
  });
}
