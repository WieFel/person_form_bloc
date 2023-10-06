import 'package:flutter/material.dart';

import '../models/models.dart';

class RoleDropdownButton extends StatelessWidget {
  final Role role;
  final Function(Role role) onChanged;

  const RoleDropdownButton({
    super.key,
    required this.role,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<RoleType>(
      hint: const Text('Role'),
      isExpanded: true,
      items: RoleType.values
          .map((e) => DropdownMenuItem<RoleType>(value: e, child: Text(e.name)))
          .toList(),
      value: role.value,
      onChanged: (value) => onChanged(Role.dirty(value: value, age: role.age)),
      decoration: InputDecoration(
        errorText: role.displayError?.text,
      ),
    );
  }
}
