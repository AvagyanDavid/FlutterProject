part of 'photo_bloc.dart';

@immutable
class PhotoEvent {

  final String photoId;
  final XFile? newPhoto;

  const PhotoEvent(this.photoId, this.newPhoto);
}
