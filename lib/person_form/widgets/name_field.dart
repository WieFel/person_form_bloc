import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/person_form_cubit.dart';
import '../models/models.dart';

class NameField extends StatefulWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  final _textController = TextEditingController();
  late PersonFormCubit _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<PersonFormCubit>();
    _textController.text = _bloc.state.name.value ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonFormCubit, PersonFormState>(
      builder: (context, state) {
        return TextField(
          controller: _textController,
          onChanged: (value) => _bloc.onNameChanged(value),
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Name',
            errorText: state.name.displayError?.text,
            border: const UnderlineInputBorder(),
            isDense: true,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
