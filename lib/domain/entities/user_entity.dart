import 'package:equatable/equatable.dart';

class UserEntity with EquatableMixin {
  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
  });

  final String id;
  final String firstName;
  final String lastName;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        createdAt,
      ];
}
