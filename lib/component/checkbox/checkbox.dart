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
    required this.enabled,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool value;
  final CheckboxBloc checkboxBloc;
  final String checkboxId;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckboxBloc, CheckboxState>(
      bloc: checkboxBloc,
      listener: (context, state) {

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
          enabled: enabled,
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}

class ShowCheck extends StatelessWidget {
  const ShowCheck({
    required this.text,
    required this.value,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool value;

  @override
  Widget build(BuildContext context) {
        return CheckboxListTile(
          title: Text(text),
          value: value,
          enabled: false,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: null,
        );
  }
}