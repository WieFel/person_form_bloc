import 'package:formz/formz.dart';

import 'age_input.dart';
import 'name_input.dart';
import 'role_input.dart';

class PersonInputGroup {
  final Name name;
  final Age age;
  final Role role;

  const PersonInputGroup(this.name, this.age, this.role);

  List<FormzInput> get fields => [name, age, role];
}
