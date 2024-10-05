import 'package:formz/formz.dart';

enum FirstNameError { empty }

class FirstName extends FormzInput<String, FirstNameError> {
  const FirstName.pure() : super.pure('');
  const FirstName.dirty([super.value = '']) : super.dirty();

  @override
  FirstNameError? validator(String value) {
    return value.isEmpty ? FirstNameError.empty : null;
  }
}
