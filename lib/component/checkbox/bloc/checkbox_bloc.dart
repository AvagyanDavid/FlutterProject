import 'package:flutter_bloc/flutter_bloc.dart';

part  'checkbox_event.dart';
part 'checkbox_state.dart';

class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {
  CheckboxBloc() : super(CheckboxState({
    'takeRadioTerminalTelephone': false,
    'sendMessageWatsApp': false,
    'sendMessageTelegram': false,
    'tableArrangement': false,
    'wipeTheTables': false,
    'inspectionOfTheHall': false,
    'arrangeOttomans': false,
    'putEverythingOnTheTables': false,
    'wipeMenu': false,
    'cleanWineCabinet': false,
    'fillTheNapkinHolder': false,
    'garbageEmpty': false,
    'passDishesKitchen': false,
    'requestStartAndStopList': false,
    'cleanHumidor': false,
    'chargerCandle': false,
    'fixOttomansAndTables': false,
    'cleanTables': false,
    'putAwayTheNapkins': false,
    'chargeRadioTerminalTelephone': false,
    'cleanlinessWorkplaceHost': false,
    'openCheckout': false,
    'checkAndTakeAlcogol': false,
    'writeStopList': false,
    'rubTheDishes': false,
    'cleaning': false,
    'extractorHumidifier': false,
    'alcogol': false,
    'nonAlcogol': false,
    'tobacco': false,
    'fillOutReport': false,
    'closeShift': false,
    'cleanlinessWorkplace': false,
    'sendMessage': false,
    'listArtist' : false,
    'readiness': false,
    'sendListOfGirls': false,
    'listDJ': false,
    'controlArtistAnalize' : false,
    'analyzeGraph': false,
    'fiveMinutes' : false,
    'firstCard' : false,
    'secondCard': false,
    'thirdCard': false,
    'control1': false,
    'control2': false,
    'control3': false,
    'control4': false,
    'control5': false,
    'toyOrder': false,
    'reportCompletedArt': false,
    'reportCompleteMarket': false,
    'art': false,
    'bar': false,
    'market': false,
    'hostes': false,
    'orderDressingRoom': false,
    'Post':false,

  })) {
    on<CheckboxEvent>((event, emit) {
      final updatedCheckboxStates = Map<String, bool>.from(state.checkboxStates);
      if (updatedCheckboxStates.containsKey(event.checkboxId)) {
        final currentValue = updatedCheckboxStates[event.checkboxId];
        updatedCheckboxStates[event.checkboxId] = !currentValue!;
        emit(state.copyWith(checkboxStates: updatedCheckboxStates));
      }
    });
  }
}