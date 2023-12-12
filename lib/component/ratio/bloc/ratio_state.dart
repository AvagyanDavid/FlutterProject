part of 'ratio_bloc.dart';

class RatioState {
  final String? ratioStates;

  RatioState(this.ratioStates);

  RatioState copyWith({String? ratioStates}) =>
      RatioState(ratioStates ?? this.ratioStates);
}
