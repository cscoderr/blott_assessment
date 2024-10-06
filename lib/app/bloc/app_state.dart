part of 'app_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState({
    this.authStatus = AuthStatus.unauthenticated,
  });

  AppState copyWith({AuthStatus? authStatus}) {
    return AppState(
      authStatus: authStatus ?? this.authStatus,
    );
  }

  final AuthStatus authStatus;

  @override
  List<Object> get props => [authStatus];
}
