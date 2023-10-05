import 'package:equatable/equatable.dart';

class PersonView extends Equatable {
  final String name;
  final int age;

  const PersonView(
    this.name,
    this.age,
  );

  @override
  List<Object?> get props => [name, age];
}
