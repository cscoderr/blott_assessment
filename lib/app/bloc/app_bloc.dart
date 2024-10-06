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
    on<AppEvent>((event, emit) {});
    on<AppAuthStatusChanged>(_onAuthStatusChanged);
  }

  final FetchUserUsecase _fetchUserUsecase;

  Future<void> _onAuthStatusChanged(
    AppAuthStatusChanged event,
    Emitter<AppState> emit,
  ) async {
    final response = await _fetchUserUsecase();
    emit(state);
  }
}
