import 'package:flutter_bloc/flutter_bloc.dart';

part  'ratio_event.dart';
part 'ratio_state.dart';

class RatioBloc extends Bloc<RatioEvent, RatioState> {
  RatioBloc() : super(RatioState(null)) {
    on<RatioEvent>((event, emit){
        emit(state.copyWith(ratioStates: event.newValue));
    });
  }
}