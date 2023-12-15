import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';

import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';

class Art_begin extends StatefulWidget {
  int idUser;
  DateTime now;

  Art_begin({super.key, required this.idUser, required this.now});

  @override
  State<Art_begin> createState() => _Art_beginState();
}

class _Art_beginState extends State<Art_begin> {

  bool readOnly = false;
  bool enabled = true;

  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final response = await Api().checkReportArtBegin(date);
    if (response != null) {
      readOnly = true;
      enabled = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    getStatusReport();
    super.initState();
  }

  CheckboxBloc checkboxBloc = CheckboxBloc();

  String? commentListArtist;
  String? commentReadiness;
  String? commentSendListOfGirls;
  String? commentListDJ;
  String? commentAnalyzeGraph;
  String? commentControlArtistAnalize;
  String? commentFiveMinutes;
  String? commentCard;
  String? commentControl1;
  String? commentControl2;
  String? commentControl3;
  String? commentControl4;
  String? commentControl5;
  String? commentToyOrder;
  String? commentDirectorListArtist;
  String? commentDirectorReadiness;
  String? commentDirectorSendListOfGirls;
  String? commentDirectorListDJ;
  String? commentDirectorAnalyzeGraph;
  String? commentDirectorControlArtistAnalize;
  String? commentDirectorFiveMinutes;
  String? commentDirectorCard;
  String? commentDirectorToyOrder;

  // List? checkBox = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                  padding: const EdgeInsets.fromLTRB(22, 35.93, 0, 53.58),
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xff000000),
                  ),
                  child: Row(
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
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Container(
                                    // qd1 (207:27)
                                    // margin: const EdgeInsets.fromLTRB(0, 0, 0, 9.56),
                                    width: 200,
                                    child: const Text(
                                      'Привет АртМенеджер',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
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
                        height: 100,
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
            // margin: const EdgeInsets.fromLTRB(0, 0, 120, 0),
            child: const Text(
              'Начало смены',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                height: 1.2999999523,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                // autogrouptfuqVzP (Qd88RFd5Sycz9vo7TbtFuq)
                padding: const EdgeInsets.fromLTRB(0, 31.5, 0, 62),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // frame6qHZ (211:334)
                      margin: const EdgeInsets.fromLTRB(14, 0, 19, 56),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                              return NewCheck(
                                text: 'Составить список артисток на смене',
                                value:
                                    state.checkboxStates['listArtist'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'listArtist',
                                enabled: enabled,
                              );
                            }),
                          ),
                          CommentWorker(
                            commentValue: commentListArtist,
                            onChanged: (value) {
                              commentListArtist = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorListArtist,
                          ),
                          const SizedBox(height: 20),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                              return NewCheck(
                                text: 'Проверка готовности артисток к работе(внести данные в таблицу).Недостатки и исправления уточнить в прилагающем сообщении',
                                value: state.checkboxStates['readiness'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'readiness',
                                enabled: enabled,
                              );
                            }),
                          ),
                          const SizedBox(height: 20,),
                          CommentWorker(
                            commentValue: commentReadiness,
                            onChanged: (value) {
                              commentReadiness = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorReadiness,
                          ),

                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Скинуть список девочек в чат Арт ',
                                  value:
                                      state.checkboxStates['sendListOfGirls'] ??
                                          false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'sendListOfGirls',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentSendListOfGirls,
                            onChanged: (value) {
                              commentSendListOfGirls = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorSendListOfGirls,
                          ),

                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Составить список для диджея ',
                                  value:
                                      state.checkboxStates['listDJ'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'listDJ',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentListDJ,
                            onChanged: (value) {
                              commentListDJ = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorListDJ,
                          ),
                          const SizedBox(height: 10),

                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text:
                                      "Проанализировать график на ближайшие 7 дней",
                                  value: state.checkboxStates['analyzeGraph'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'analyzeGraph',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentAnalyzeGraph,
                            onChanged: (value) {
                              commentAnalyzeGraph = value!;
                            },
                            readOnly: readOnly,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: "Контроль наличия анализов у артисток",
                                  value: state.checkboxStates[
                                          'controlArtistAnalize'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'controlArtistAnalize',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentControlArtistAnalize,
                            onChanged: (value) {
                              commentControlArtistAnalize = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorControlArtistAnalize,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: "Пятиминутка",
                                  value: state.checkboxStates['fiveMinutes'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'fiveMinutes',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentFiveMinutes,
                            onChanged: (value) {
                              commentFiveMinutes = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorFiveMinutes,),
                          const SizedBox(height: 20,),
                          const SizedBox(
                            width: double.infinity,
                              child: Text(
                                'Выдача карт:',
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
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: '1 карта',
                                  value: state.checkboxStates['firstCard'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'firstCard',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: '2 карта',
                                  value: state.checkboxStates['secondCard'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'secondCard',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: '3 карта',
                                  value: state.checkboxStates['thirdCard'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'thirdCard',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          CommentWorker(commentValue: commentCard,onChanged: (value){
                            commentCard = value!;
                          },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(valueDirector: commentDirectorCard,),
                          const SizedBox(height: 20,),
                          const SizedBox(
                              child: Text(
                                'Контроль:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 3,
                              child: CommentWorker(
                                commentValue: commentControl1,
                                onChanged: (value) {
                                  commentControl1 = value!;
                                },
                                readOnly: readOnly,
                              ),
                              ),
                              Expanded(flex: 1,
                                child: BlocProvider<CheckboxBloc>(
                                create: (context) => checkboxBloc,
                                child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                  builder: (context, state) {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['control1'] ??
                                          false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'control1',
                                      enabled: enabled,
                                    );
                                  },
                                ),
                              ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 3,
                                child: CommentWorker(
                                  commentValue: commentControl2,
                                  onChanged: (value) {
                                    commentControl2 = value!;
                                  },
                                  readOnly: readOnly,
                                ),
                              ),
                              Expanded(flex: 1,
                                child: BlocProvider<CheckboxBloc>(
                                  create: (context) => checkboxBloc,
                                  child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                    builder: (context, state) {
                                      return NewCheck(
                                        text: '',
                                        value: state.checkboxStates['control2'] ??
                                            false,
                                        checkboxBloc: checkboxBloc,
                                        checkboxId: 'control2',
                                        enabled: enabled,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 3,
                                child: CommentWorker(
                                  commentValue: commentControl3,
                                  onChanged: (value) {
                                    commentControl3 = value!;
                                  },
                                  readOnly: readOnly,
                                ),
                              ),
                              Expanded(flex: 1,
                                child: BlocProvider<CheckboxBloc>(
                                  create: (context) => checkboxBloc,
                                  child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                    builder: (context, state) {
                                      return NewCheck(
                                        text: '',
                                        value: state.checkboxStates['control3'] ??
                                            false,
                                        checkboxBloc: checkboxBloc,
                                        checkboxId: 'control3',
                                        enabled: enabled
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 3,
                                child: CommentWorker(
                                  commentValue: commentControl4,
                                  onChanged: (value) {
                                    commentControl4 = value!;
                                  },
                                  readOnly: readOnly,
                                ),
                              ),
                              Expanded(flex: 1,
                                child: BlocProvider<CheckboxBloc>(
                                  create: (context) => checkboxBloc,
                                  child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                    builder: (context, state) {
                                      return NewCheck(
                                        text: '',
                                        value: state.checkboxStates['control4'] ??
                                            false,
                                        checkboxBloc: checkboxBloc,
                                        checkboxId: 'control4',
                                        enabled: enabled,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 3,
                                child: CommentWorker(
                                  commentValue: commentControl5,
                                  onChanged: (value) {
                                    commentControl5 = value!;
                                  },
                                  readOnly: readOnly,
                                ),
                              ),
                              Expanded(flex: 1,
                                child: BlocProvider<CheckboxBloc>(
                                  create: (context) => checkboxBloc,
                                  child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                    builder: (context, state) {
                                      return NewCheck(
                                        text: '',
                                        value: state.checkboxStates['control5'] ??
                                            false,
                                        checkboxBloc: checkboxBloc,
                                        checkboxId: 'control5',
                                        enabled: enabled,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Составить заявку на игрушки',
                                  value:
                                      state.checkboxStates['toyOrder'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'toyOrder',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentToyOrder,
                            onChanged: (value) {
                              commentToyOrder = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorToyOrder,
                          ),

                          const SizedBox(height: 20),
                          Center(
                                child: enabled == true
                                    ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(100, 50),
                                    textStyle: const TextStyle(fontSize: 20),
                                    backgroundColor: Colors.green[800],
                                  ),
                                  onPressed: () async {
                                    DateTime now = DateTime.now();
                                    String date = '${now.year}-${now.month}-${now.day}';
                                    String time = '${now.hour}:${now.minute}:${now.second}';

                                    final state = checkboxBloc.state;

                                    final listArtist = state.checkboxStates['listArtist'] ?? false;
                                    final readiness = state.checkboxStates['readiness'] ?? false;
                                    final sendListOfGirls = state.checkboxStates['sendListOfGirls'] ?? false;
                                    final listDJ = state.checkboxStates['listDJ'] ?? false;
                                    final analyzeGraph = state.checkboxStates['analyzeGraph'] ?? false;
                                    final controlArtistAnalize = state.checkboxStates['controlArtistAnalize'] ?? false;
                                    final fiveMinutes = state.checkboxStates['fiveMinutes'] ?? false;
                                    final firstCard = state.checkboxStates['firstCard'] ?? false;
                                    final secondCard = state.checkboxStates['secondCard'] ?? false;
                                    final thirdCard = state.checkboxStates['thirdCard'] ?? false;
                                    final control1 = state.checkboxStates['control1'] ?? false;
                                    final control2 = state.checkboxStates['control2'] ?? false;
                                    final control3 = state.checkboxStates['control3'] ?? false;
                                    final control4 = state.checkboxStates['control4'] ?? false;
                                    final control5 = state.checkboxStates['control5'] ?? false;
                                    final toyOrder = state.checkboxStates['toyOrder'] ?? false;

                                    await Api().artBegin(
                                        date,
                                        time,
                                        listArtist,
                                        commentListArtist,
                                        commentDirectorListArtist,
                                        readiness,
                                        commentReadiness,
                                        commentDirectorReadiness,
                                        sendListOfGirls,
                                        commentSendListOfGirls,
                                        commentDirectorSendListOfGirls,
                                        listDJ,
                                        commentListDJ,
                                        commentDirectorListDJ,
                                        analyzeGraph,
                                        commentAnalyzeGraph,
                                        commentDirectorAnalyzeGraph,
                                        controlArtistAnalize,
                                        commentControlArtistAnalize,
                                        commentDirectorControlArtistAnalize,
                                        fiveMinutes,
                                        commentFiveMinutes,
                                        commentDirectorFiveMinutes,
                                        firstCard,
                                        secondCard,
                                        thirdCard,
                                        commentCard,
                                        commentDirectorCard,
                                        control1,
                                        commentControl1,
                                        control2,
                                        commentControl2,
                                        control3,
                                        commentControl3,
                                        control4,
                                        commentControl4,
                                        control5,
                                        commentControl5,
                                        toyOrder,
                                        commentToyOrder,
                                        commentDirectorToyOrder,
                                        3);
                                    Navigator.pop(context);
                                    readOnly = true;
                                    enabled = false;
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
                              )
                                    : const SizedBox(height: 0,)
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    }
  }
