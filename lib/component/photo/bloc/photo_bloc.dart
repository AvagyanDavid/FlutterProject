import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'photo_event.dart';

part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoState( {
    'cleanlinessWorkplaceHostPhoto': null,
    'orderDressingRoomPhoto': null,
    'rubTheDishesPhoto': null,
    'cleaningPhoto' : null,
    'cleanlinessWorkplacePhoto' : null,
    'tableArrangementPhoto': null,
    'wipeTheTablesPhoto': null,
    'inspectionOfTheHallPhoto': null,
    'arrangeOttomansPhoto': null,
    'putEverythingOnTheTablesPhoto': null,
    'wipeMenuPhoto': null,
    'checkAndTakeAlcogolPhoto': null,
  })) {
    on<PhotoEvent>((event, emit) async {
      final updatedPhotoStates = Map<String, XFile?>.from(state.photoStates);
      if (updatedPhotoStates.containsKey(event.photoId)) {
        updatedPhotoStates[event.photoId] = event.newPhoto;
        emit(state.copyWith(photoStates: updatedPhotoStates));
      }
    });
  }
}