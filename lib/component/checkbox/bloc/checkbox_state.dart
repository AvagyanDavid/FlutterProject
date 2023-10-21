part of 'checkbox_bloc.dart';

class CheckboxState {
  final Map<String, bool> checkboxStates;

  CheckboxState(this.checkboxStates);

  CheckboxState copyWith({Map<String, bool>? checkboxStates}) =>
      CheckboxState(checkboxStates ?? this.checkboxStates);
}
