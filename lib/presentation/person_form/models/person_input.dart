import 'package:formz/formz.dart';
import 'package:person_form_bloc/presentation/person_form/models/person_input_group.dart';

import 'age_input.dart';
import 'name_input.dart';
import 'role_input.dart';

enum PersonValidationError { invalid }

class PersonInput extends FormzInput<PersonInputGroup, PersonValidationError> {
  const PersonInput.pure(
      [super.value = const PersonInputGroup(
        Name.pure(),
        Age.pure(),
        Role.pure(),
      )])
      : super.pure();

  const PersonInput.dirty(
      [super.value = const PersonInputGroup(
        Name.dirty(),
        Age.dirty(),
        Role.dirty(),
      )])
      : super.dirty();

  @override
  PersonValidationError? validator(PersonInputGroup value) {
    if (!Formz.validate(value.fields)) return PersonValidationError.invalid;

    return null;
  }

  PersonInput copyWith({
    Name? name,
    Age? age,
    Role? role,
  }) {
    return isPure
        ? PersonInput.pure(
            PersonInputGroup(
              name ?? value.name,
              age ?? value.age,
              role ?? value.role,
            ),
          )
        : PersonInput.dirty(
            PersonInputGroup(
              name ?? value.name,
              age ?? value.age,
              role ?? value.role,
            ),
          );
  }
}
