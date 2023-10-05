import 'package:formz/formz.dart';

import 'role_view.dart';

enum RoleValidationError { empty, notAllowedChild, notAllowedAdult, notAllowedSenior }

class Role extends FormzInput<RoleView?, RoleValidationError> {
  final int? age;

  const Role.pure({RoleView? value, this.age}) : super.pure(value);

  const Role.dirty({RoleView? value, this.age}) : super.dirty(value);

  Role copyWith({
    RoleView? value,
    int? age,
  }) {
    return isPure
        ? Role.pure(value: value ?? this.value, age: age ?? this.age)
        : Role.dirty(value: value ?? this.value, age: age ?? this.age);
  }

  @override
  RoleValidationError? validator(RoleView? value) {
    if (value == null) {
      return RoleValidationError.empty;
    }

    if (age == null) return null;

    if (age! >= 18 && value.role == RoleType.child) {
      return RoleValidationError.notAllowedChild;
    }

    if ((age! < 18 || age! >= 60) && value.role == RoleType.adult) {
      return RoleValidationError.notAllowedAdult;
    }

    if (age! < 60 && value.role == RoleType.senior) {
      return RoleValidationError.notAllowedSenior;
    }

    return null;
  }
}

extension RoleValidationErrorX on RoleValidationError {
  String get text {
    switch (this) {
      case RoleValidationError.empty:
        return 'Role cannot be empty';
      case RoleValidationError.notAllowedChild:
        return 'Age for child must be < 18';
      case RoleValidationError.notAllowedAdult:
        return 'Age for adult must be >= 18 and < 60';
      case RoleValidationError.notAllowedSenior:
        return 'Age for senior must be >= 60';
    }
  }
}
