part of 'person_form_cubit.dart';

class PersonFormState extends Equatable {
  final Name name;
  final Age age;
  final Role role;
  final bool isValid;

  const PersonFormState({
    this.name = const Name.pure(),
    this.age = const Age.pure(),
    this.role = const Role.pure(),
    this.isValid = false,
  });

  PersonFormState copyWith({
    Name? name,
    Age? age,
    Role? role,
    bool? isValid,
  }) {
    return PersonFormState(
      name: name ?? this.name,
      age: age ?? this.age,
      role: role ?? this.role,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [name, age, role, isValid];
}
