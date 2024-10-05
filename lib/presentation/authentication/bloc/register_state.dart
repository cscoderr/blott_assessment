part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.user,
  });

  RegisterState copyWith({
    FirstName? firstName,
    LastName? lastName,
    bool? isValid,
    FormzSubmissionStatus? status,
    UserEntity? user,
  }) {
    return RegisterState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  final FirstName firstName;
  final LastName lastName;
  final bool isValid;
  final FormzSubmissionStatus status;
  final UserEntity? user;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        isValid,
        status,
        user,
      ];
}
