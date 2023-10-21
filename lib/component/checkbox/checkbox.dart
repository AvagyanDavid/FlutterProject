import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/checkbox_bloc.dart';

class NewCheck extends StatelessWidget {
  const NewCheck({
    required this.text,
    required this.value,
    required this.checkboxBloc,
    required this.checkboxId,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool value;
  final CheckboxBloc checkboxBloc;
  final String checkboxId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckboxBloc, CheckboxState>(
      bloc: checkboxBloc,
      listener: (context, state) {
        // Add any necessary listeners here
      },
      builder: (context, state) {
        final checkboxStates = state.checkboxStates;
        final newValue = checkboxStates[checkboxId] ?? false;

        return CheckboxListTile(
          title: Text(text),
          value: newValue,
          onChanged: (newValue) {
            checkboxBloc.add(CheckboxEvent(checkboxId, newValue ?? false));
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}