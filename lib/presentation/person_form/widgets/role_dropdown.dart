import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/person_form_cubit.dart';
import '../models/models.dart';

class RoleDropdownButton extends StatelessWidget {
  const RoleDropdownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonFormCubit, PersonFormState>(
      builder: (context, state) {
        final roleViews = RoleType.values.map((e) => RoleView(e)).toList();

        return DropdownButtonFormField<RoleView>(
          hint: const Text('Role'),
          isExpanded: true,
          items: roleViews
              .map((e) => DropdownMenuItem<RoleView>(value: e, child: Text(e.role.name)))
              .toList(),
          value: state.role.value,
          onChanged: (value) => context.read<PersonFormCubit>().onRoleChanged(value),
          decoration: InputDecoration(
            errorText: state.role.displayError?.text,
          ),
        );
      },
    );
  }
}
