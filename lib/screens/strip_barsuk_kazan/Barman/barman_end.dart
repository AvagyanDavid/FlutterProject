import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';

import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/bloc/photo_bloc.dart';

import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';
import '../../../component/photo/photo.dart';

class barman_end extends StatefulWidget {
  int idUser;
  DateTime now;

  barman_end({super.key, required this.idUser, required this.now});

  @override
  State<barman_end> createState() => _barman_endState();
}

class _barman_endState extends State<barman_end> {
  bool readOnly = false;
  bool enabled = true;

  bool alcogol  = false;
  bool nonAlcogol  = false;
  bool tobacco  = false;
  bool fillOutReport = false;
  bool closeShift = false;
  bool cleanlinessWorkplace = false;
  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();
  String? cleanlinessWorkplacePath = null;
  String? wipeDustShelvingEndPath = null;
  TextEditingController commentCleanlinessWorkplace = TextEditingController();
  TextEditingController commentCloseShift = TextEditingController();
  TextEditingController commentFillOutReport = TextEditingController();
  TextEditingController commentApplication = TextEditingController();
  TextEditingController commentWipeDustShelvingEnd = TextEditingController();
  String? commentDirectorApplication;
  String? commentDirectorFillOutReport;
  String? commentDirectorCloseShift;
  String? commentDirectorCleanlinessWorkplace;
  String? commentDirectorWipeDustShelvingEnd;

  String? PhotoCleanlinessWorkplace;

  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final results = await Api().checkReportBarmanEnd(date);
    if (results != null) {
      readOnly = true;
      enabled = false;
      final response = await Api().showBarmanEnd(date);
      alcogol = response['Alcogol'] != 0 ? true : false;
      nonAlcogol = response['NonAlcogol'] != 0 ? true : false;
      tobacco = response['Tobacco'] != 0 ? true : false;
      commentApplication.text = response['Comment_Application'];
      commentDirectorApplication = response['CommentDirector_Application'] as String?;
      fillOutReport = response['FillOutReport'] != 0 ? true : false;
      commentFillOutReport.text = response['CommentFillOutReport'];
      commentDirectorFillOutReport = response['CommentDirector_FillOutReport'] as String?;
      closeShift = response['CloseShift'] != 0 ? true : false;
      commentCloseShift.text = response['Comment_CloseShift'];
      commentDirectorCloseShift = response['CommentDirector_CloseShift'] as String?;
      cleanlinessWorkplace= response['CleanlinessWorkplace'] != 0 ? true : false;
      commentCleanlinessWorkplace.text = response['Comment_CleanlinessWorkplace'];
      commentDirectorCleanlinessWorkplace = response['CommentDirector_CleanlinessWorkplace'] as String?;

      PhotoCleanlinessWorkplace = response['CleanlinessWorkplacePhoto'] == null ? null : Api().getPhoto(response['CleanlinessWorkplacePhoto']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // frame5Sco (207:23)a
        width: 400,
        height: double.infinity,
        child: Column(children: [
          Container(
            width: double.infinity,
            // decoration: const BoxDecoration (
            /// разделяющая линия приветсвие и филиал (207:6)
            //   color: Colors.white,
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 4.5),
                  padding: const EdgeInsets.fromLTRB(22, 35.93, 0, 53.58),
                  width: double.infinity,
                  height: 174,
                  decoration: const BoxDecoration(
                    color: Color(0xff000000),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 6.58, 67, 12.74),
                        width: 173,
                        height: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 7.61),
                          width: double.infinity,
                          height: 63.17,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // qd1 (207:27)
                                margin:
                                    const EdgeInsets.fromLTRB(0, 0, 0, 9.56),
                                child: const Text(
                                  'Привет Бармен',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Text(
                                // 6oq (207:28)
                                'сегодня ${widget.now.day}-${widget.now.month}-${widget.now.year}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 150,
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset("assets/emblem.png")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            // BD1 (231:55)
            margin: const EdgeInsets.fromLTRB(0, 0, 120, 0),
            child: const Text(
              'Конец смены',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                height: 1.2999999523,
                color: Color(0xffffffff),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(26, 31.5, 0, 62),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Container(
                        // ANK (211:310)
                        child: const Text(
                          'Составить заявку:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      // BlocBuilder(builder: builder)
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowCheck(
                                text: "Алкоголь",
                                value: alcogol
                            );
                          } else {
                            return NewCheck(
                              text: "Алкоголь",
                              value: state.checkboxStates['alcogol'] ?? false,
                              checkboxBloc:checkboxBloc,
                              checkboxId: 'alcogol',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      // BlocBuilder(builder: builder)
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowCheck(
                                text: "Б/а",
                                value: nonAlcogol
                            );
                          } else {
                            return NewCheck(
                              text: "Б/а",
                              value: state.checkboxStates['nonalcogol'] ?? false,
                              checkboxBloc:checkboxBloc,
                              checkboxId: 'nonalcogol',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      // BlocBuilder(builder: builder)
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowCheck(
                                text: "Табак",
                                value: tobacco
                            );
                          } else {
                            return NewCheck(
                              text: "Табак",
                              value: state.checkboxStates['tobacco'] ?? false,
                              checkboxBloc:checkboxBloc,
                              checkboxId: 'tobacco',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    CommentWorker(
                      commentValue: commentApplication,
                      readOnly: readOnly,
                    ),
                    ShowCommentDirector(valueDirector: commentDirectorApplication,),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowCheck(
                                text: "Заполнить отчет",
                                value: fillOutReport
                            );
                          } else {
                            return NewCheck(
                              text: "Заполнить отчет",
                              value: state.checkboxStates['fillOutReport'] ?? false,
                              checkboxBloc:checkboxBloc,
                              checkboxId: 'fillOutReport',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    CommentWorker(
                      commentValue: commentFillOutReport,
                      readOnly: readOnly,
                    ),
                    ShowCommentDirector(valueDirector: commentDirectorFillOutReport,),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      // BlocBuilder(builder: builder)
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowCheck(
                                text: "Закрыть смену",
                                value: closeShift
                            );
                          } else {
                            return NewCheck(
                              text: "Закрыть смену",
                              value: state.checkboxStates['closeShift'] ?? false,
                              checkboxBloc:checkboxBloc,
                              checkboxId: 'closeShift',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    CommentWorker(
                      commentValue: commentCloseShift,
                      readOnly: readOnly,
                    ),
                    ShowCommentDirector(valueDirector: commentDirectorCloseShift,),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      // BlocBuilder(builder: builder)
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowCheck(
                                text: "Навести порядок на рабочем месте",
                                value: cleanlinessWorkplace
                            );
                          } else {
                            return NewCheck(
                              text: "Навести порядок на рабочем месте",
                              value: state.checkboxStates['cleanlinessWorkplace'] ?? false,
                              checkboxBloc:checkboxBloc,
                              checkboxId: 'cleanlinessWorkplace',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    BlocProvider<PhotoBloc>(
                      create: (context) => photoBloc,
                      child: BlocBuilder<PhotoBloc, PhotoState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowPhoto(image: cleanlinessWorkplacePath);
                          }
                          return NewPhoto(
                            photoBloc: photoBloc,
                            photoId: 'cleanlinessWorkplacePhoto',);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentWorker(
                      commentValue: commentCleanlinessWorkplace,
                      readOnly: false,
                    ),
                    ShowCommentDirector(valueDirector: commentDirectorCleanlinessWorkplace,),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocProvider<PhotoBloc>(
                      create: (context) => photoBloc,
                      child: BlocBuilder<PhotoBloc, PhotoState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowPhoto(image: wipeDustShelvingEndPath);
                          }
                          return NewPhoto(
                            photoBloc: photoBloc,
                            photoId: 'wipeDustShelvingEnd',);
                        },
                      ),
                    ),
                    // CommentDirector(readOnly: false)

                    /// НЕДОДЕЛЛАННО ВЕЗДЕ НАДО СДЕЛАТЬ КОММЕНТАРИИ ДИРЕКТОРА!!!!!
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///

                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () async {

                          final photostate = photoBloc.state;
                          final cleanlinessWorkplacePhoto = photostate.photoStates['cleanlinessWorkplacePhoto'];
                          if (cleanlinessWorkplacePhoto != null) {
                            cleanlinessWorkplacePath = cleanlinessWorkplacePhoto.path;
                          }

                          final wipeDustShelvingPhoto = photostate.photoStates['wipeDustShelvingPhoto'];
                          if(wipeDustShelvingPhoto != null) {
                            wipeDustShelvingEndPath = wipeDustShelvingPhoto.path;
                          }

                          DateTime now = DateTime.now().toUtc();
                          String date = '${now.year}-${now.month}-${now.day}';
                          String time = '${now.hour}:${now.minute}:${now.second}';

                          final state = checkboxBloc.state;
                          final alcogol = state.checkboxStates['alcogol'] ?? false;
                          final nonAlcogol = state.checkboxStates['nonalcogol'] ?? false;
                          final tobacco = state.checkboxStates['tobacco'] ?? false;
                          final fillOutReport = state.checkboxStates['fillOutReport'] ?? false;
                          final closeShift = state.checkboxStates['closeShift'] ?? false;
                          final cleanlinessWorkplace = state.checkboxStates['cleanlinessWorkplace'] ?? false;
                          final wipeDustShelvingEnd = state.checkboxStates['wipeDustShelvingEnd'] ?? false;

                          await Api().barmanEnd(
                              date,
                              time,
                              alcogol,
                              nonAlcogol,
                              tobacco,
                              commentApplication.text,
                              commentDirectorApplication,
                              fillOutReport,
                              commentFillOutReport.text,
                              commentDirectorFillOutReport,
                              closeShift,
                              commentCloseShift.text,
                              commentDirectorCloseShift,
                              cleanlinessWorkplace,
                              cleanlinessWorkplacePath,
                              commentCleanlinessWorkplace.text,
                              commentDirectorCleanlinessWorkplace,
                              wipeDustShelvingEnd,
                              wipeDustShelvingEndPath,
                              commentWipeDustShelvingEnd.text,
                              commentDirectorWipeDustShelvingEnd,
                              widget.idUser);

                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Отправить отчет',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.3,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
