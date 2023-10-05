import 'package:formz/formz.dart';

import 'role_view.dart';

enum RoleValidationError { empty }

class Role extends FormzInput<RoleView?, RoleValidationError> {
  const Role.pure({RoleView? value}) : super.pure(value);

  const Role.dirty({RoleView? value}) : super.dirty(value);

  @override
  RoleValidationError? validator(RoleView? value) {
    if (value == null) {
      return RoleValidationError.empty;
    }

    return null;
  }
}
