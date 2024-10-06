part of 'app_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState({
    this.authStatus = AuthStatus.unauthenticated,
    this.user,
  });

  AppState copyWith({
    AuthStatus? authStatus,
    UserEntity? user,
  }) {
    return AppState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }

  final AuthStatus authStatus;
  final UserEntity? user;

  @override
  List<Object?> get props => [
        authStatus,
        user,
      ];
}
