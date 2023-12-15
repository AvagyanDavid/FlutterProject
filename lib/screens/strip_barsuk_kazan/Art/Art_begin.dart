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
  bool listArtist = false;
  bool readiness = false;
  bool sendListOfGirls = false;
  bool listDJ = false;
  bool analyzeGraph = false;
  bool controlArtistAnalize = false;
  bool fiveMinutes = false;
  bool firstCard = false;
  bool secondCard = false;
  bool thirdCard = false;
  bool control1 = false;
  bool control2 = false;
  bool control3 = false;
  bool control4 = false;
  bool control5 = false;
  bool toyOrder = false;

  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final results = await Api().checkReportArtBegin(date);
    if (results != null) {
      readOnly = true;
      enabled = false;
      final response = await Api().showArtBegin(date);
      listArtist = response['ListArtist'] != 0 ? true : false;
      commentListArtist = response['Comment_ListArtist'] as String?;
      commentDirectorListArtist = response['CommentDirector_ListArtist'] as String?;
      readiness = response['Readiness'] != 0 ? true : false;
      commentReadiness = response['Comment_Readiness'] as String?;
      commentDirectorReadiness = response['CommentDirector_Readiness'] as String?;
      sendListOfGirls = response['SendListOfGirls'] != 0 ? true : false;
      commentSendListOfGirls = response['Comment_SendListOfGirls'] as String?;
      commentDirectorSendListOfGirls = response['CommentDirector_SendListOfGirls'] as String?;
      listDJ = response['ListDJ'] != 0 ? true : false;
      commentListDJ = response['Comment_ListDJ'] as String?;
      commentDirectorListDJ = response['CommentDirector_ListDJ'] as String?;
      analyzeGraph = response['AnalyzeGraph'] != 0 ? true : false;
      commentAnalyzeGraph = response['Comment_AnalyzeGraph'] as String?;
      commentDirectorAnalyzeGraph = response['CommentDirector_AnalyzeGraph'] as String?;
      controlArtistAnalize = response['ControlArtistAnalize'] != 0 ? true : false;
      commentControlArtistAnalize = response['Comment_ControlArtistAnalize'] as String?;
      commentDirectorControlArtistAnalize = response['CommentDirector_ControlArtistAnalize'] as String?;
      fiveMinutes = response['FiveMinutes'] != 0 ? true : false;
      commentFiveMinutes = response['Comment_FiveMinutes'] as String?;
      commentDirectorFiveMinutes = response['CommentDirector_FiveMinutes'] as String?;
      firstCard = response['FirstCard'] != 0 ? true : false;
      secondCard = response['SecondCard'] != 0 ? true : false;
      thirdCard = response['ThirdCard'] != 0 ? true : false;
      commentCard = response['Comment_Card'] as String?;
      commentDirectorCard = response['CommentDirector_Card'] as String?;
      control1 = response['Control1'] != 0 ? true : false;
      commentControl1 = response['Comment_Control1'] as String?;
      control2 = response['Control2'] != 0 ? true : false;
      commentControl2 = response['Comment_Control2'] as String?;
      control3 = response['Control3'] != 0 ? true : false;
      commentControl3 = response['Comment_Control3'] as String?;
      control4 = response['Control4'] != 0 ? true : false;
      commentControl4 = response['Comment_Control4'] as String?;
      control5 = response['Control5'] != 0 ? true : false;
      commentControl5 = response['Comment_Control5'] as String?;
      toyOrder = response['ToyOrder'] != 0 ? true : false;
      commentToyOrder = response['Comment_ToyOrder'] as String?;
      commentDirectorToyOrder = response['CommentDirector_ToyOrder'] as String?;
      setState(() {});
    }
  }

  @override
  void initState() {
    getStatusReport();
    super.initState();
  }

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
                        child: Align(alignment: Alignment.topRight, child: Image.asset("assets/emblem.png")),
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
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(builder: (context, state) {
                              if (enabled == false) {
                                return ShowCheck(
                                 text: 'Составить список артисток на смене',
                                 value: listArtist
                                );
                              } else {
                                return NewCheck(
                                  text: 'Составить список артисток на смене',
                                  value: state.checkboxStates['listArtist'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'listArtist',
                                  enabled: enabled,
                                );
                              }
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
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(builder: (context, state) {
                              return NewCheck(
                                text:
                                'Проверка готовности артисток к работе(внести данные в таблицу).Недостатки и исправления уточнить в прилагающем сообщении',
                                value: state.checkboxStates['readiness'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'readiness',
                                enabled: enabled,
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                                  value: state.checkboxStates['sendListOfGirls'] ?? false,
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
                                  value: state.checkboxStates['listDJ'] ?? false,
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
                                  text: "Проанализировать график на ближайшие 7 дней",
                                  value: state.checkboxStates['analyzeGraph'] ?? false,
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
                                  value: state.checkboxStates['controlArtistAnalize'] ?? false,
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
                                  value: state.checkboxStates['fiveMinutes'] ?? false,
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
                            valueDirector: commentDirectorFiveMinutes,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                                  value: state.checkboxStates['firstCard'] ?? false,
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
                                  value: state.checkboxStates['secondCard'] ?? false,
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
                                  value: state.checkboxStates['thirdCard'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'thirdCard',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentCard,
                            onChanged: (value) {
                              commentCard = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorCard,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                          const SizedBox(
                            height: 20,
                          ),
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
                              Expanded(
                                flex: 1,
                                child: BlocProvider<CheckboxBloc>(
                                  create: (context) => checkboxBloc,
                                  child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                    builder: (context, state) {
                                      return NewCheck(
                                        text: '',
                                        value: state.checkboxStates['control1'] ?? false,
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
                              Expanded(
                                flex: 1,
                                child: BlocProvider<CheckboxBloc>(
                                  create: (context) => checkboxBloc,
                                  child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                    builder: (context, state) {
                                      return NewCheck(
                                        text: '',
                                        value: state.checkboxStates['control2'] ?? false,
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
                          const SizedBox(
                            height: 20,
                          ),
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
                              Expanded(
                                flex: 1,
                                child: BlocProvider<CheckboxBloc>(
                                  create: (context) => checkboxBloc,
                                  child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                    builder: (context, state) {
                                      return NewCheck(
                                          text: '',
                                          value: state.checkboxStates['control3'] ?? false,
                                          checkboxBloc: checkboxBloc,
                                          checkboxId: 'control3',
                                          enabled: enabled);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                              Expanded(
                                flex: 1,
                                child: BlocProvider<CheckboxBloc>(
                                  create: (context) => checkboxBloc,
                                  child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                    builder: (context, state) {
                                      return NewCheck(
                                        text: '',
                                        value: state.checkboxStates['control4'] ?? false,
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
                          const SizedBox(
                            height: 20,
                          ),
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
                              Expanded(
                                flex: 1,
                                child: BlocProvider<CheckboxBloc>(
                                  create: (context) => checkboxBloc,
                                  child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                    builder: (context, state) {
                                      return NewCheck(
                                        text: '',
                                        value: state.checkboxStates['control5'] ?? false,
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
                                  value: state.checkboxStates['toyOrder'] ?? false,
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
                                  listArtist = state.checkboxStates['listArtist'] ?? false;
                                  readiness = state.checkboxStates['readiness'] ?? false;
                                  sendListOfGirls = state.checkboxStates['sendListOfGirls'] ?? false;
                                  listDJ = state.checkboxStates['listDJ'] ?? false;
                                  analyzeGraph = state.checkboxStates['analyzeGraph'] ?? false;
                                  controlArtistAnalize = state.checkboxStates['controlArtistAnalize'] ?? false;
                                  fiveMinutes = state.checkboxStates['fiveMinutes'] ?? false;
                                  firstCard = state.checkboxStates['firstCard'] ?? false;
                                  secondCard = state.checkboxStates['secondCard'] ?? false;
                                  thirdCard = state.checkboxStates['thirdCard'] ?? false;
                                  control1 = state.checkboxStates['control1'] ?? false;
                                  control2 = state.checkboxStates['control2'] ?? false;
                                  control3 = state.checkboxStates['control3'] ?? false;
                                  control4 = state.checkboxStates['control4'] ?? false;
                                  control5 = state.checkboxStates['control5'] ?? false;
                                  toyOrder = state.checkboxStates['toyOrder'] ?? false;

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
                                  : const SizedBox(
                                height: 0,
                              )),
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
