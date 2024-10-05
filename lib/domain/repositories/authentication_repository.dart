import 'package:blott_assessment/domain/domain.dart';

abstract class AuthenticationRepository {
  Future<UserEntity> register({
    required String firstName,
    required String lastName,
  });
}
