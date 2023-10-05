import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/person_form_cubit.dart';
import '../models/models.dart';

class AgeField extends StatefulWidget {
  const AgeField({Key? key}) : super(key: key);

  @override
  State<AgeField> createState() => _AgeFieldState();
}

class _AgeFieldState extends State<AgeField> {
  final _textController = TextEditingController();
  late PersonFormCubit _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<PersonFormCubit>();
    _textController.text = _bloc.state.age.value?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonFormCubit, PersonFormState>(
      builder: (context, state) {
        return TextField(
          controller: _textController,
          keyboardType: TextInputType.number,
          onChanged: (value) => _bloc.onAgeChanged(num.tryParse(value)?.toInt()),
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Age',
            errorText: state.age.displayError?.text,
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
