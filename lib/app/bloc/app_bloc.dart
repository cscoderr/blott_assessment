import 'package:bloc/bloc.dart';
import 'package:blott_assessment/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required FetchUserUsecase fetchUserUsecase,
  })  : _fetchUserUsecase = fetchUserUsecase,
        super(const AppState()) {
    on<AppUserChanged>(_onAppUserChanged);
    on<AppAuthStatusChanged>(_onAuthStatusChanged);
    on<AppFetchedUserData>(_onAppFetchedUserData);
  }

  final FetchUserUsecase _fetchUserUsecase;

  Future<void> _onAuthStatusChanged(
    AppAuthStatusChanged event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(authStatus: event.status));
  }

  void _onAppUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(state.copyWith(user: event.user));
  }

  Future<void> _onAppFetchedUserData(
    AppFetchedUserData event,
    Emitter<AppState> emit,
  ) async {
    final response = await _fetchUserUsecase();
    if (response.maybeValue != null) {
      add(AppUserChanged(response.maybeValue!));
    }
  }
}
