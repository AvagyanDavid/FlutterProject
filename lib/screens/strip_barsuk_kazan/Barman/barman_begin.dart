// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test_form/api/api.dart';
// import 'package:test_form/component/Forms.dart';
// import 'package:test_form/component/checkbox/bloc/checkbox_bloc.dart';
// import 'package:test_form/component/checkbox/checkbox.dart';
// import 'package:test_form/component/photo/bloc/photo_bloc.dart';
// import 'package:test_form/component/photo/photo.dart';
//
// class barman_begin extends StatefulWidget {
//   final int idUser;
//   final DateTime now;
//
//   barman_begin({super.key, required this.idUser, required this.now});
//
//   @override
//   State<barman_begin> createState() => _barman_beginState();
// }
//
// class _barman_beginState extends State<barman_begin> {
//   bool readOnly = false;
//   bool enabled = true;
//
//   CheckboxBloc checkboxBloc = CheckboxBloc();
//   PhotoBloc photoBloc = PhotoBloc();
//   String? checkAndTakeAlcogolPath = null;
//   String? cleaningPath = null;
//   String? rubTheDishesPath = null;
//   String? wipeDustShelvingPath = null;
//   TextEditingController commentOpenCheckout = TextEditingController();
//   TextEditingController commentCheckAndTakeAlcogol = TextEditingController();
//   TextEditingController commentExtractorHumidifier = TextEditingController();
//   TextEditingController commentWriteStopList = TextEditingController();
//   TextEditingController commentRubTheDishes = TextEditingController();
//   TextEditingController commentCleaning = TextEditingController();
//   TextEditingController commentWipeDustShelvingBegin = TextEditingController();
//   String? commentDirectorOpenCheckout;
//   String? commentDirectorCheckAndTakeAlcogol;
//   String? commentDirectorExtractorHumidifier;
//   String? commentDirectorWriteStopList;
//   String? commentDirectorRubTheDishes;
//   String? commentDirectorCleaning;
//   String? commentDirectorWipeDustShelvingBegin;
//   bool openCheckout = false;
//   bool checkAndTakeAlcogol = false;
//   bool extractorHumidifier = false;
//   bool writeStopList = false;
//   bool rubTheDishes = false;
//   bool cleaning = false;
//   String? PhotoCheckAndTakeAlcogol = null;
//   String? PhotoRubTheDishes = null;
//   String? PhotoCleaning = null;
//   String? PhotoWipeDustShelving = null;
//
//   void getStatusReport() async {
//     String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
//     final results = await Api().checkReportBarmanBegin(date);
//     if (results != null){
//       readOnly = true;
//       enabled = false;
//       final response = await Api().showBarmanBegin(date);
//       openCheckout = response['OpenCheckout']  != 0 ? true : false;
//       commentOpenCheckout.text = response ['Comment_OpenCheckout'];
//       commentDirectorOpenCheckout = response ['CommentDirector_OpenCheckout'] as String?;
//       checkAndTakeAlcogol = response['CheckAndTakeAlcogol']  != 0 ? true : false;
//       commentCheckAndTakeAlcogol.text = response ['Comment_CheckAndTakeAlcogol'];
//       commentDirectorCheckAndTakeAlcogol = response ['CommentDirector_CheckAndTakeAlcogol'] as String?;
//       extractorHumidifier = response['ExtractorHumidifier']  != 0 ? true : false;
//       commentExtractorHumidifier = response ['Comment_ExtractorHumidifier'];
//       commentDirectorExtractorHumidifier = response ['CommentDirector_ExtractorHumidifier'] as String?;
//       writeStopList = response['WriteStopList']  != 0 ? true : false;
//       commentWriteStopList.text = response ['Comment_WriteStopList'];
//       commentDirectorWriteStopList = response ['CommentDirector_WriteStopList'] as String?;
//       rubTheDishes = response['RubTheDishes']  != 0 ? true : false;
//       commentRubTheDishes.text = response ['Comment_RubTheDishes'];
//       commentDirectorRubTheDishes = response ['CommentDirector_RubTHeDishes'] as String?;
//       cleaning = response['Cleaning']  != 0 ? true : false;
//       commentCleaning.text = response ['Comment_Cleaning'];
//       commentDirectorCleaning = response ['CommentDirector_Cleaning'] as String?;
//
//       PhotoCheckAndTakeAlcogol = response['CheckAndTakeAlcogolPhoto'] == null ? null : Api().getPhoto(response['CheckAndTakeAlcogolPhoto']);
//       PhotoRubTheDishes = response['RubTheDishesPhoto'] == null ? null : Api().getPhoto(response['RubTheDishesPhoto']);
//       PhotoCleaning = response['CleaningPhoto'] == null ? null : Api().getPhoto(response['CleaningPhoto']);
//       PhotoWipeDustShelving = response['CleaningPhoto'] == null ? null : Api().getPhoto(response['WipeDustShelvingPhoto']);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: 400,
//         height: double.infinity,
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               // decoration: const BoxDecoration (
//               /// разделяющая линия приветсвие и филиал (207:6)
//               //   color: Colors.white,
//               // ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.fromLTRB(0, 0, 0, 4.5),
//                     padding: const EdgeInsets.fromLTRB(22, 35.93, 0, 53.58),
//                     width: double.infinity,
//                     height: 174,
//                     decoration: const BoxDecoration(
//                       color: Color(0xff000000),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.fromLTRB(0, 6.58, 67, 12.74),
//                           width: 173,
//                           height: double.infinity,
//                           child: Container(
//                             padding: const EdgeInsets.fromLTRB(0, 0, 0, 7.61),
//                             width: double.infinity,
//                             height: 63.17,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   // qd1 (207:27)
//                                   margin:
//                                   const EdgeInsets.fromLTRB(0, 0, 0, 9.56),
//                                   child: const Text(
//                                     'Привет Бармен',
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w400,
//                                       height: 1.3,
//                                       color: Color(0xffffffff),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   'сегодня ${widget.now.day}-${widget.now.month}-${widget.now.year}',
//                                   style: const TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w400,
//                                     height: 1.3,
//                                     color: Color(0xffffffff),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 100,
//                           height: 150,
//                           child: Align(
//                               alignment: Alignment.topRight,
//                               child: Image.asset("assets/emblem.png")),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               // BD1 (231:55)
//               margin: const EdgeInsets.fromLTRB(0, 0, 120, 0),
//               child: const Text(
//                 'Начало смены',
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.w400,
//                   height: 1.2999999523,
//                   color: Color(0xffffffff),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Container(
//                   padding: const EdgeInsets.fromLTRB(26, 31.5, 0, 62),
//                   width: double.infinity,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       BlocProvider<CheckboxBloc>(
//                         create: (context) => CheckboxBloc(),
//                         child: BlocBuilder<CheckboxBloc, CheckboxState>(
//                           builder: (context, state) {
//                             if (enabled == false) {
//                               return ShowCheck(
//                                   text: 'Открыть кассовую смену',
//                                   value: openCheckout
//                               );
//                             } else {
//                               return NewCheck(
//                                 text: "Открыть кассовую смену",
//                                 value:
//                                 state.checkboxStates['openCheckout'] ?? false,
//                                 checkboxBloc: checkboxBloc,
//                                 checkboxId: 'openCheckout',
//                                 enabled: enabled,
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                       CommentWorker(
//                         commentValue: commentOpenCheckout,
//                         readOnly: readOnly,
//                       ),
//                       ShowCommentDirector(
//                         valueDirector: commentDirectorOpenCheckout,
//                       ),
//                       BlocProvider<CheckboxBloc>(
//                         create: (context) => CheckboxBloc(),
//                         child: BlocBuilder<CheckboxBloc, CheckboxState>(
//                           builder: (context, state) {
//                             if (enabled == false) {
//                               return ShowCheck(
//                                   text: 'Проверить и принять алкоголь',
//                                   value: checkAndTakeAlcogol
//                               );
//                             } else {
//                               return NewCheck(
//                                 text: "Проверить и принять алкоголь",
//                                 value:
//                                 state.checkboxStates['checkAndTakeAlcogol'] ??
//                                     false,
//                                 checkboxBloc: checkboxBloc,
//                                 checkboxId: 'checkAndTakeAlcogol',
//                                 enabled: enabled,
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                       BlocProvider<PhotoBloc>(
//                         create: (context) => photoBloc,
//                         child: BlocBuilder<PhotoBloc, PhotoState>(
//                           builder: (context, state) {
//                             if (enabled == false) {
//                               return ShowPhoto(
//                                   image: PhotoCheckAndTakeAlcogol
//                               );
//                             } else {
//                               return NewPhoto(
//                                 photoBloc: photoBloc,
//                                 photoId: 'checkAndTakeAlcogolPhoto',
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       CommentWorker(
//                         commentValue: commentCheckAndTakeAlcogol,
//                         readOnly: readOnly,
//                       ),
//                       ShowCommentDirector(
//                         valueDirector: commentDirectorCheckAndTakeAlcogol,
//                       ),
//                       const SizedBox(height: 20),
//                       BlocProvider<CheckboxBloc>(
//                         create: (context) => CheckboxBloc(),
//                         child: BlocBuilder<CheckboxBloc, CheckboxState>(
//                           builder: (context, state) {
//                             if (enabled == false) {
//                               return ShowCheck(
//                                   text: 'Включить вытяжку и увлажнитель',
//                                   value: extractorHumidifier
//                               );
//                             } else {
//                               return NewCheck(
//                                 text: "Включить вытяжку и увлажнитель",
//                                 value:
//                                 state.checkboxStates['extractorHumidifier'] ??
//                                     false,
//                                 checkboxBloc: checkboxBloc,
//                                 checkboxId: 'extractorHumidifier',
//                                 enabled: enabled,
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       CommentWorker(
//                         commentValue: commentExtractorHumidifier,
//                         readOnly: readOnly,
//                       ),
//                       ShowCommentDirector(
//                         valueDirector: commentDirectorExtractorHumidifier,
//                       ),
//                       BlocProvider<CheckboxBloc>(
//                         create: (context) => CheckboxBloc(),
//                         child: BlocBuilder<CheckboxBloc, CheckboxState>(
//                           builder: (context, state) {
//                             if (enabled == false) {
//                               return ShowCheck(
//                                   text: 'Написать стоп-лист',
//                                   value: writeStopList
//                               );
//                             } else {
//                               return NewCheck(
//                                 text: "Написать стоп-лист",
//                                 value: state.checkboxStates['writeStopList'] ??
//                                     false,
//                                 checkboxBloc: checkboxBloc,
//                                 checkboxId: 'writeStopList',
//                                 enabled: enabled,
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                       CommentWorker(
//                         commentValue: commentWriteStopList,
//                         readOnly: readOnly,
//                       ),
//                       ShowCommentDirector(
//                         valueDirector: commentDirectorWriteStopList,
//                       ),
//                       BlocProvider<CheckboxBloc>(
//                         create: (context) => CheckboxBloc(),
//                         child: BlocBuilder<CheckboxBloc, CheckboxState>(
//                           builder: (context, state) {
//                             if (enabled == false) {
//                               return ShowCheck(
//                                   text: 'Натереть посуду',
//                                   value: rubTheDishes
//                               );
//                             } else {
//                               return NewCheck(
//                                 text: "Натереть посуду",
//                                 value:
//                                 state.checkboxStates['rubTheDishes'] ?? false,
//                                 checkboxBloc: checkboxBloc,
//                                 checkboxId: 'rubTheDishes',
//                                 enabled: enabled,
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                       BlocProvider<PhotoBloc>(
//                         create: (context) => PhotoBloc(),
//                         child: BlocBuilder<PhotoBloc, PhotoState>(
//                           builder: (context, state) {
//                             if (enabled == false) {
//                               return ShowPhoto(image: PhotoRubTheDishes);
//                             } else {
//                               return NewPhoto(
//                                 photoBloc: photoBloc,
//                                 photoId: 'rubTheDishesPhoto',
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       CommentWorker(
//                         commentValue: commentRubTheDishes,
//                         readOnly: readOnly,
//                       ),
//                       ShowCommentDirector(
//                         valueDirector: commentDirectorRubTheDishes,
//                       ),
//                       BlocProvider<CheckboxBloc>(
//                         create: (context) => CheckboxBloc(),
//                         child: BlocBuilder<CheckboxBloc, CheckboxState>(
//                           builder: (context, state) {
//                             if (enabled == false) {
//                               return ShowCheck(
//                                   text: 'Протереть пыль со стеллажа',
//                                   value: cleaning
//                               );
//                             } else {
//                               return NewCheck(
//                                 text: "Протереть пыль со стеллажа",
//                                 value: state.checkboxStates['wipeDustShelvingBegin'] ??
//                                     false,
//                                 checkboxBloc: checkboxBloc,
//                                 checkboxId: 'cleaning',
//                                 enabled: enabled,
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                       BlocProvider<PhotoBloc>(
//                         create: (context) => PhotoBloc(),
//                         child: BlocBuilder<PhotoBloc, PhotoState>(
//                           builder: (context, state) {
//                             if (enabled == false) {
//                               return ShowPhoto(image: PhotoWipeDustShelving);
//                             }
//                             return NewPhoto(
//                               photoId: 'wipeDustShelvingBeginPhoto',
//                               photoBloc: photoBloc,
//                             );
//                           },
//                         ),
//                       ),
//                       CommentWorker(
//                           commentValue: commentWipeDustShelvingBegin,
//                           readOnly: readOnly),
//                       CommentDirector(
//                           valueDirector: commentDirectorWipeDustShelvingBegin,
//                           onChanged: (value) {
//                             commentDirectorWipeDustShelvingBegin = value!;
//                           }, readOnly: false),
//                       if (widget.now.weekday == DateTime.sunday)
//                         Column(
//                           children: [
//                             BlocProvider<CheckboxBloc>(
//                               create: (context) => CheckboxBloc(),
//                               child: BlocBuilder<CheckboxBloc, CheckboxState>(
//                                 builder: (context, state) {
//                                   if (enabled == false) {
//                                     return ShowCheck(
//                                         text: 'Уборка',
//                                         value: cleaning
//                                     );
//                                   } else {
//                                     return NewCheck(
//                                       text: "Уборка",
//                                       value: state.checkboxStates['cleaning'] ??
//                                           false,
//                                       checkboxBloc: checkboxBloc,
//                                       checkboxId: 'cleaning',
//                                       enabled: enabled,
//                                     );
//                                   }
//                                 },
//                               ),
//                             ),
//                             BlocProvider<PhotoBloc>(
//                               create: (context) => PhotoBloc(),
//                               child: BlocBuilder<PhotoBloc, PhotoState>(
//                                 builder: (context, state) {
//                                   if (enabled == false) {
//                                     return ShowPhoto(image: PhotoCleaning);
//                                   } else {
//                                     return NewPhoto(
//                                       photoBloc: photoBloc,
//                                       photoId: 'cleaningPhoto',
//                                     );
//                                   }
//                                 },
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             CommentWorker(
//                               commentValue: commentCleaning,
//                               readOnly: readOnly,
//                             ),
//                             ShowCommentDirector(
//                                 valueDirector: commentDirectorCleaning),
//
//                           ],
//                         )
//                       else
//                         const SizedBox(height: 0),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Center(
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(100, 50),
//                             textStyle: const TextStyle(fontSize: 20),
//                             backgroundColor: Colors.green,
//                           ),
//                           onPressed: () {
//                             final photostate = photoBloc.state;
//                             final checkAndTakeAlcogolPhoto = photostate
//                                 .photoStates['checkAndTakeAlcogolPhoto'];
//                             if (checkAndTakeAlcogolPhoto != null) {
//                               checkAndTakeAlcogolPath =
//                                   checkAndTakeAlcogolPhoto.path;
//                             }
//
//                             final rubTheDishesPhoto =
//                             photostate.photoStates['rubTheDishesPhoto'];
//                             if (rubTheDishesPhoto != null) {
//                               rubTheDishesPath = rubTheDishesPhoto.path;
//                             }
//
//                             final cleaningPhoto =
//                             photostate.photoStates['cleaningPhoto'];
//                             if (cleaningPhoto != null) {
//                               cleaningPath = cleaningPhoto.path;
//                             }
//                             final wipeDustShelvingBeginPhoto = photostate.photoStates['wipeDustShelvingBeginPhoto'];
//                             if(wipeDustShelvingBeginPhoto != null){
//                               wipeDustShelvingPath = wipeDustShelvingBeginPhoto.path;
//                             }
//
//                             DateTime now = DateTime.now();
//                             String date = '${now.year}-${now.month}-${now.day}';
//                             String time =
//                                 '${now.hour}:${now.minute}:${now.second}';
//
//                             final state = checkboxBloc.state;
//                             final openCheckout = state.checkboxStates['openCheckout'] ?? false;
//                             final checkAndTakeAlcogol = state.checkboxStates['checkAndTakeAlcogol'] ?? false;
//                             final extractorHumidifier = state.checkboxStates['extractorHumidifier'] ?? false;
//                             final writeStopList = state.checkboxStates['writeStopList'] ?? false;
//                             final rubTheDishes = state.checkboxStates['rubTheDishes'] ?? false;
//                             final cleaning = state.checkboxStates['cleaning'] ?? false;
//                             final wipeDustShelvingBegin = state.checkboxStates['wipeDustShelvingBegin'] ?? false;
//
//                             Api().barmanBegin(
//                                 date,
//                                 time,
//                                 openCheckout,
//                                 commentOpenCheckout.text,
//                                 commentDirectorOpenCheckout,
//                                 checkAndTakeAlcogol,
//                                 checkAndTakeAlcogolPath,
//                                 commentCheckAndTakeAlcogol.text,
//                                 commentDirectorCheckAndTakeAlcogol,
//                                 extractorHumidifier,
//                                 commentExtractorHumidifier.text,
//                                 commentDirectorExtractorHumidifier,
//                                 writeStopList,
//                                 commentWriteStopList.text,
//                                 commentDirectorWriteStopList,
//                                 rubTheDishes,
//                                 rubTheDishesPath,
//                                 commentRubTheDishes.text,
//                                 commentDirectorRubTheDishes,
//                                 wipeDustShelvingBegin,
//                                 wipeDustShelvingPath,
//                                 commentWipeDustShelvingBegin.text,
//                                 commentDirectorWipeDustShelvingBegin,
//                                 cleaning,
//                                 cleaningPath,
//                                 commentCleaning.text,
//                                 commentDirectorCleaning,
//                                 4);
//                             Navigator.pop(context);
//                           },
//                           child: const Text(
//                             'Отправить отчет',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 15,
//                               height: 1.3,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }