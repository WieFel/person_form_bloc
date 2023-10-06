import 'package:flutter/material.dart';

import '../models/models.dart';

class AgeField extends StatelessWidget {
  final Age age;
  final Function(Age age) onChanged;

  const AgeField({
    super.key,
    required this.age,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: age.value?.toString() ?? '',
      keyboardType: TextInputType.number,
      onChanged: (value) => onChanged(Age.dirty(num.tryParse(value)?.toInt())),
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        hintText: 'Age',
        errorText: age.displayError?.text,
        border: const UnderlineInputBorder(),
        isDense: true,
      ),
    );
  }
}
