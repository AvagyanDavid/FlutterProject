part of 'photo_bloc.dart';

@immutable
class PhotoState {
  final Map<String, XFile?> photoStates;

  PhotoState(this.photoStates);

  PhotoState copyWith({Map<String, XFile?>? photoStates}) =>
      PhotoState(photoStates ?? this.photoStates);
}