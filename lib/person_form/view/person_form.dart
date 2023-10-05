import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/person_form_cubit.dart';
import '../widgets/widgets.dart';

class PersonForm extends StatelessWidget {
  final ValueChanged<PersonFormState> onChanged;

  const PersonForm({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonFormCubit, PersonFormState>(
      listener: (context, state) {
        onChanged(state);
      },
      child: const Column(
        children: [
          NameField(),
          SizedBox(height: 8.0),
          AgeField(),
          SizedBox(height: 8.0),
          RoleDropdownButton(),
        ],
      ),
    );
  }
}
