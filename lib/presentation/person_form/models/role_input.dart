import 'package:formz/formz.dart';

import 'role_type.dart';

enum RoleValidationError { empty, notAllowedChild, notAllowedAdult, notAllowedSenior }

class Role extends FormzInput<RoleType?, RoleValidationError> {
  final int? age;

  const Role.pure({RoleType? value, this.age}) : super.pure(value);

  const Role.dirty({RoleType? value, this.age}) : super.dirty(value);

  Role copyWith({
    RoleType? value,
    int? age,
  }) {
    return isPure
        ? Role.pure(value: value ?? this.value, age: age ?? this.age)
        : Role.dirty(value: value ?? this.value, age: age ?? this.age);
  }

  @override
  RoleValidationError? validator(RoleType? value) {
    if (value == null) {
      return RoleValidationError.empty;
    }

    if (age == null) return null;

    if (age! >= 18 && value == RoleType.child) {
      return RoleValidationError.notAllowedChild;
    }

    if ((age! < 18 || age! >= 60) && value == RoleType.adult) {
      return RoleValidationError.notAllowedAdult;
    }

    if (age! < 60 && value == RoleType.senior) {
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
