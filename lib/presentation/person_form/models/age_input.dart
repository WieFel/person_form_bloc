import 'package:formz/formz.dart';

enum AgeValidationError { empty }

class Age extends FormzInput<int?, AgeValidationError> {
  const Age.pure() : super.pure(null);

  const Age.dirty([super.value = 0]) : super.dirty();

  @override
  AgeValidationError? validator(int? value) {
    if (value == null) return AgeValidationError.empty;
    return null;
  }
}

extension AgeValidationErrorX on AgeValidationError {
  String get text {
    switch (this) {
      case AgeValidationError.empty:
        return 'Age cannot be empty';
    }
  }
}
