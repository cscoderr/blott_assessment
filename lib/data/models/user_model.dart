import 'package:blott_assessment/domain/domain.dart';
import 'package:equatable/equatable.dart';

class UserModel with EquatableMixin {
  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  final String id;
  final String firstName;
  final String lastName;
  final DateTime createdAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'created_at': createdAt.toString(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        createdAt,
      ];
}

extension UserModelExtension on UserEntity {
  UserModel toModel() {
    return UserModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      createdAt: createdAt,
    );
  }
}
