import 'package:flutter/material.dart';
import 'package:person_form_bloc/presentation/person_form/models/person_input.dart';

import '../widgets/widgets.dart';

class PersonForm extends StatelessWidget {
  final PersonInput person;
  final ValueChanged<PersonInput> onChanged;
  final VoidCallback onDelete;

  const PersonForm({
    Key? key,
    required this.person,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Person', style: Theme.of(context).textTheme.headlineSmall),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onDelete,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            NameField(
              name: person.value.name,
              onChanged: (name) => onChanged(person.copyWith(name: name)),
            ),
            const SizedBox(height: 8.0),
            AgeField(
              age: person.value.age,
              onChanged: (age) => onChanged(person.copyWith(
                age: age,
                role: person.value.role.copyWith(age: age.value),
              )),
            ),
            const SizedBox(height: 8.0),
            RoleDropdownButton(
              role: person.value.role,
              onChanged: (role) => onChanged(person.copyWith(role: role)),
            ),
          ],
        ),
      ),
    );
  }
}
