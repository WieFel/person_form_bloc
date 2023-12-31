import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../models/models.dart';

part 'person_form_state.dart';

class PersonFormCubit extends Cubit<PersonFormState> {
  PersonFormCubit(super.state);

  void onNameChanged(String name) {
    final nameInput = Name.dirty(name);
    emit(state.copyWith(
      name: nameInput,
      isValid: Formz.validate([nameInput, state.age, state.role]),
    ));
  }

  void onAgeChanged(int? age) {
    final ageInput = Age.dirty(age);
    final roleInput = state.role.copyWith(age: ageInput.value);

    emit(state.copyWith(
      age: ageInput,
      role: roleInput,
      isValid: Formz.validate([state.name, ageInput, roleInput]),
    ));
  }

  void onRoleChanged(RoleView? role) {
    final roleInput = Role.dirty(value: role, age: state.age.value);

    emit(state.copyWith(
      role: roleInput,
      isValid: Formz.validate([state.name, state.age, roleInput]),
    ));
  }
}
