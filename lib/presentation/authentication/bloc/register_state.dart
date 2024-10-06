part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.user,
    this.errorMessage = '',
  });

  RegisterState copyWith({
    FirstName? firstName,
    LastName? lastName,
    bool? isValid,
    FormzSubmissionStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return RegisterState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  final FirstName firstName;
  final LastName lastName;
  final bool isValid;
  final FormzSubmissionStatus status;
  final UserEntity? user;
  final String errorMessage;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        isValid,
        status,
        user,
        errorMessage,
      ];
}
