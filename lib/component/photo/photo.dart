import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_form/component/photo/bloc/photo_bloc.dart';

class NewPhoto extends StatelessWidget {
  const NewPhoto({
    required this.photoBloc,
    required this.photoId,
    Key? key,
  }) : super(key: key);

  final PhotoBloc photoBloc;
  final String photoId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotoBloc, PhotoState>(
      bloc: photoBloc,
      listener: (context, state) {
        // Add any necessary listeners here
      },
      builder: (context, state) {
        final photoStates = state.photoStates;

        if (photoStates[photoId] != null) {
          return Center(
            child: Image.file(
              File(photoStates[photoId]!.path),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 150),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.white24,
              ),
              onPressed: () async {
                final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
                  photoBloc.add(PhotoEvent(photoId, pickedImage));

              },
              child: const Column(
                children: [
                  Icon(
                    Icons.add,
                    size: 40,
                  ),
                  Text(
                    'Добавить Фото',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.2999999523,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}


class ShowPhoto extends StatelessWidget {
  const ShowPhoto({
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return Center(
        child: Image(
          image: NetworkImage(image!),
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return const Text('Фотография не прикреплена');
        }
  }
}

// class NewVideo extends StatelessWidget {
//   const NewVideo({
//     required this.photoBloc,
//     required this.photoId,
//     Key? key,
//   }) : super(key: key);
//
//   final PhotoBloc photoBloc;
//   final String photoId;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PhotoBloc, PhotoState>(
//       bloc: photoBloc,
//       listener: (context, state) {
//         // Add any necessary listeners here
//       },
//       builder: (context, state) {
//         final photoStates = state.photoStates;
//
//         if (photoStates.containsKey(photoId)) {
//           final vlcPlayerController = VlcPlayerController.file(
//             File(photoStates[photoId]!.path),
//             autoPlay: true,);
//           return Center(
//             child: AspectRatio(
//               aspectRatio: 16 / 9,
//               child: VlcPlayer(
//                 controller: vlcPlayerController,
//                 aspectRatio: 16 / 9,
//                 placeholder: const Center (child: CircularProgressIndicator()),
//               ),
//             ),
//           );
//         } else {
//           return Center(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(100, 150),
//                 textStyle: const TextStyle(fontSize: 20),
//                 backgroundColor: Colors.white24,
//               ),
//               onPressed: () async {
//                 final pickedVideo = await ImagePicker().pickVideo(source: ImageSource.camera);
//                 photoBloc.add(PhotoEvent(photoId, pickedVideo));
//               },
//               child: const Column(
//                 children: [
//                   Icon(
//                     Icons.add,
//                     size: 40,
//                   ),
//                   Text(
//                     'Добавить Видео',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w400,
//                       height: 1.2999999523,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }