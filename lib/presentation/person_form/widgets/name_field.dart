import 'package:flutter/material.dart';

import '../models/models.dart';

class NameField extends StatelessWidget {
  final Name name;
  final Function(Name name) onChanged;

  const NameField({
    super.key,
    required this.name,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: name.value),
      onChanged: (value) => onChanged(Name.dirty(value)),
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        hintText: 'Name',
        errorText: name.displayError?.text,
        border: const UnderlineInputBorder(),
        isDense: true,
      ),
    );
  }
}
