part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterFirstNameChanged extends RegisterEvent {
  const RegisterFirstNameChanged(this.firstName);
  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class RegisterLastNameChanged extends RegisterEvent {
  const RegisterLastNameChanged(this.lastName);
  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}
