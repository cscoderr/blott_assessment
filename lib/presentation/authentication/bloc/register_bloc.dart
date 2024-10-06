import 'package:bloc/bloc.dart';
import 'package:blott_assessment/core/core.dart';
import 'package:blott_assessment/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required CreateUserUsecase registerUsecase})
      : _registerUsecase = registerUsecase,
        super(const RegisterState()) {
    on<RegisterFirstNameChanged>(_onFirstNameChanged);
    on<RegisterLastNameChanged>(_onLastNameChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  final CreateUserUsecase _registerUsecase;

  void _onFirstNameChanged(
    RegisterFirstNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final firstName = FirstName.dirty(event.firstName);
    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate([
          firstName,
          state.lastName,
        ]),
      ),
    );
  }

  void _onLastNameChanged(
    RegisterLastNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final lastName = LastName.dirty(event.lastName);
    emit(
      state.copyWith(
        lastName: lastName,
        isValid: Formz.validate([
          lastName,
          state.firstName,
        ]),
      ),
    );
    print(
      Formz.validate([
        lastName,
        state.firstName,
      ]),
    );
  }

  Future<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final response = await _registerUsecase(
      RegisterParams(
        firstName: state.firstName.value,
        lastName: state.lastName.value,
      ),
    );
    response.when(
      success: (data) {
        emit(state.copyWith(status: FormzSubmissionStatus.success, user: data));
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
          ),
        );
      },
    );
  }
}
