part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

final class AppAuthStatusChanged extends AppEvent {
  const AppAuthStatusChanged(this.status);
  final AuthStatus status;

  @override
  List<Object> get props => [status];
}
