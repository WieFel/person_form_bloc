import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/person_form_cubit.dart';
import '../widgets/widgets.dart';

class PersonForm extends StatelessWidget {
  final ValueChanged<PersonFormState> onChanged;
  final VoidCallback onDelete;

  const PersonForm({
    Key? key,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonFormCubit, PersonFormState>(
      listener: (context, state) {
        onChanged(state);
      },
      child: Card(
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
              const NameField(),
              const SizedBox(height: 8.0),
              const AgeField(),
              const SizedBox(height: 8.0),
              const RoleDropdownButton(),
            ],
          ),
        ),
      ),
    );
  }
}
