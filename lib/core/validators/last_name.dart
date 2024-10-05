import 'package:formz/formz.dart';

enum LastNameError { empty }

class LastName extends FormzInput<String, LastNameError> {
  const LastName.pure() : super.pure('');
  const LastName.dirty([super.value = '']) : super.dirty();

  @override
  LastNameError? validator(String value) {
    return value.isEmpty ? LastNameError.empty : null;
  }
}
