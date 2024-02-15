import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';

import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';

class Art_begin extends StatefulWidget {
  final int idUser;
  final DateTime now;

  Art_begin({super.key, required this.idUser, required this.now});

  @override
  State<Art_begin> createState() => _Art_beginState();
}

class _Art_beginState extends State<Art_begin> {

  TextEditingController commentListArtist = TextEditingController();
  TextEditingController commentReadiness = TextEditingController();
  TextEditingController commentSendListOfGirls = TextEditingController();
  TextEditingController commentListDJ = TextEditingController();
  TextEditingController commentAnalyzeGraph = TextEditingController();
  TextEditingController commentControlArtistAnalize = TextEditingController();
  TextEditingController commentFiveMinutes = TextEditingController();
  TextEditingController commentCard = TextEditingController();
  TextEditingController commentControl1 = TextEditingController();
  TextEditingController commentControl2 = TextEditingController();
  TextEditingController commentControl3 = TextEditingController();
  TextEditingController commentControl4 = TextEditingController();
  TextEditingController commentControl5 = TextEditingController();
  TextEditingController commentToyOrder = TextEditingController();

  bool readOnly = false;
  bool enabled = true;

  CheckboxBloc checkboxBloc = CheckboxBloc();

  String commentDirectorListArtist = '';
  String commentDirectorReadiness = '';
  String commentDirectorSendListOfGirls = '';
  String commentDirectorListDJ = '';
  String commentDirectorAnalyzeGraph = '';
  String commentDirectorControlArtistAnalize = '';
  String commentDirectorFiveMinutes = '';
  String commentDirectorCard = '';
  String commentDirectorToyOrder = '';
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
  int id = 0;

  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final results = await Api().checkReportArtBegin(date);
    if (results != null) {
      final response = await Api().showArtBegin(date);
      readOnly = true;
      enabled = false;
      id = response['idArtManager'];
      listArtist = response['ListArtist'] != 0 ? true : false;
      commentListArtist.text = response['Comment_ListArtist'];
      commentDirectorListArtist = response['CommentDirector_ListArtist'];
      readiness = response['Readiness'] != 0 ? true : false;
      commentReadiness.text = response['Comment_Readiness'];
      commentDirectorReadiness = response['CommentDirector_Readiness'];
      sendListOfGirls = response['SendListOfGirls'] != 0 ? true : false;
      commentSendListOfGirls.text = response['Comment_SendListOfGirls'];
      commentDirectorSendListOfGirls = response['CommentDirector_SendListOfGirls'];
      listDJ = response['ListDJ'] != 0 ? true : false;
      commentListDJ.text = response['Comment_ListDJ'];
      commentDirectorListDJ = response['CommentDirector_ListDJ'];
      analyzeGraph = response['AnalyzeGraph'] != 0 ? true : false;
      commentAnalyzeGraph.text = response['Comment_AnalyzeGraph'];
      commentDirectorAnalyzeGraph = response['CommentDirector_AnalyzeGraph'];
      controlArtistAnalize = response['ControlArtistAnalize'] != 0 ? true : false;
      commentControlArtistAnalize.text = response['Comment_ControlArtistAnalize'];
      commentDirectorControlArtistAnalize = response['CommentDirector_ControlArtistAnalize'];
      fiveMinutes = response['FiveMinutes'] != 0 ? true : false;
      commentFiveMinutes.text = response['Comment_FiveMinutes'];
      commentDirectorFiveMinutes = response['CommentDirector_FiveMinutes'];
      firstCard = response['FirstCard'] != 0 ? true : false;
      secondCard = response['SecondCard'] != 0 ? true : false;
      thirdCard = response['ThirdCard'] != 0 ? true : false;
      commentCard.text = response['Comment_Card'];
      commentDirectorCard = response['CommentDirector_Card'];
      control1 = response['Control1'] != 0 ? true : false;
      commentControl1.text = response['Comment_Control1'];
      control2 = response['Control2'] != 0 ? true : false;
      commentControl2.text = response['Comment_Control2'];
      control3 = response['Control3'] != 0 ? true : false;
      commentControl3.text = response['Comment_Control3'];
      control4 = response['Control4'] != 0 ? true : false;
      commentControl4.text = response['Comment_Control4'];
      control5 = response['Control5'] != 0 ? true : false;
      commentControl5.text = response['Comment_Control5'];
      toyOrder = response['ToyOrder'] != 0 ? true : false;
      commentToyOrder.text = response['Comment_ToyOrder'];
      commentDirectorToyOrder = response['CommentDirector_ToyOrder'];
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
                  padding: const EdgeInsets.fromLTRB(22, 35.93, 0, 53.58),
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xff000000),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 6.58, 67, 12.74),
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 7.61),
                      width: 173,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: SingleChildScrollView(
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                  'Привет Арт',
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
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          const Text('Стрип Барсук Казань'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Align(alignment: Alignment.topRight, child: Image.asset("assets/emblem.png")),
                    ),
                  ]),
                ),
            ),
          const SizedBox(
            child: Text(
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
                padding: const EdgeInsets.fromLTRB(0, 31.5, 0, 62),
                margin: const EdgeInsets.fromLTRB(14, 0, 19, 56),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(text: 'Составить список артисток на смене', value: listArtist);
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
                      readOnly: readOnly,
                    ),
                    ShowCommentDirector(
                      valueDirector: commentDirectorListArtist,
                    ),
                    const SizedBox(height: 20),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(
                              text:
                                  'Проверка готовности артисток к работе(внести данные в таблицу).Недостатки и исправления уточнить в прилагающем сообщении',
                              value: readiness);
                        } else {
                          return NewCheck(
                            text:
                                'Проверка готовности артисток к работе(внести данные в таблицу).Недостатки и исправления уточнить в прилагающем сообщении',
                            value: state.checkboxStates['readiness'] ?? false,
                            checkboxBloc: checkboxBloc,
                            checkboxId: 'readiness',
                            enabled: enabled,
                          );
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentWorker(
                      commentValue: commentReadiness,
                      readOnly: readOnly,
                    ),
                    ShowCommentDirector(
                      valueDirector: commentDirectorReadiness,
                    ),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowCheck(text: 'Скинуть список девочек в чат Арт ', value: sendListOfGirls);
                          } else {
                            return NewCheck(
                              text: 'Скинуть список девочек в чат Арт ',
                              value: state.checkboxStates['sendListOfGirls'] ?? false,
                              checkboxBloc: checkboxBloc,
                              checkboxId: 'sendListOfGirls',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    CommentWorker(
                      commentValue: commentSendListOfGirls,
                      readOnly: readOnly,
                    ),
                    ShowCommentDirector(
                      valueDirector: commentDirectorSendListOfGirls,
                    ),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowCheck(text: 'Составить список для диджея', value: listDJ);
                          } else {
                            return NewCheck(
                              text: 'Составить список для диджея',
                              value: state.checkboxStates['listDJ'] ?? false,
                              checkboxBloc: checkboxBloc,
                              checkboxId: 'listDJ',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    CommentWorker(
                      commentValue: commentListDJ,
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
                          if (enabled == false) {
                            return ShowCheck(text: 'Проанализировать график на ближайшие 7 дней', value: analyzeGraph);
                          } else {
                            return NewCheck(
                              text: "Проанализировать график на ближайшие 7 дней",
                              value: state.checkboxStates['analyzeGraph'] ?? false,
                              checkboxBloc: checkboxBloc,
                              checkboxId: 'analyzeGraph',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    CommentWorker(
                      commentValue: commentAnalyzeGraph,
                      readOnly: readOnly,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowCheck(text: 'Контроль наличия анализов у артисток', value: controlArtistAnalize);
                          } else {
                            return NewCheck(
                              text: "Контроль наличия анализов у артисток",
                              value: state.checkboxStates['controlArtistAnalize'] ?? false,
                              checkboxBloc: checkboxBloc,
                              checkboxId: 'controlArtistAnalize',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    CommentWorker(
                      commentValue: commentControlArtistAnalize,
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
                          if (enabled == false) {
                            return ShowCheck(text: 'Пятиминутка', value: fiveMinutes);
                          } else {
                            return NewCheck(
                              text: "Пятиминутка",
                              value: state.checkboxStates['fiveMinutes'] ?? false,
                              checkboxBloc: checkboxBloc,
                              checkboxId: 'fiveMinutes',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    CommentWorker(
                      commentValue: commentFiveMinutes,
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
                          if (enabled == false) {
                            return ShowCheck(text: '1 карта', value: firstCard);
                          } else {
                            return NewCheck(
                              text: '1 карта',
                              value: state.checkboxStates['firstCard'] ?? false,
                              checkboxBloc: checkboxBloc,
                              checkboxId: 'firstCard',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowCheck(text: '2 карта', value: secondCard);
                          } else {
                            return NewCheck(
                              text: '2 карта',
                              value: state.checkboxStates['secondCard'] ?? false,
                              checkboxBloc: checkboxBloc,
                              checkboxId: 'secondCard',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          if (enabled == false) {
                            return ShowCheck(text: '3 карта', value: thirdCard);
                          } else {
                            return NewCheck(
                              text: '3 карта',
                              value: state.checkboxStates['thirdCard'] ?? false,
                              checkboxBloc: checkboxBloc,
                              checkboxId: 'thirdCard',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    CommentWorker(
                      commentValue: commentCard,
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
                            readOnly: readOnly,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                if (enabled == false) {
                                  return ShowCheck(text: '', value: control1);
                                } else {
                                  return NewCheck(
                                    text: '',
                                    value: state.checkboxStates['control1'] ?? false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'control1',
                                    enabled: enabled,
                                  );
                                }
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
                            readOnly: readOnly,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                if (enabled == false) {
                                  return ShowCheck(text: '', value: control2);
                                } else {
                                  return NewCheck(
                                    text: '',
                                    value: state.checkboxStates['control2'] ?? false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'control2',
                                    enabled: enabled,
                                  );
                                }
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
                            readOnly: readOnly,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                if (enabled == false) {
                                  return ShowCheck(text: '', value: control3);
                                } else {
                                  return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['control3'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'control3',
                                      enabled: enabled);
                                }
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
                            readOnly: readOnly,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                if (enabled == false) {
                                  return ShowCheck(text: '', value: control4);
                                } else {
                                  return NewCheck(
                                    text: '',
                                    value: state.checkboxStates['control4'] ?? false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'control4',
                                    enabled: enabled,
                                  );
                                }
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
                            readOnly: readOnly,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                if (enabled == false) {
                                  return ShowCheck(text: '', value: control5);
                                } else {
                                  return NewCheck(
                                    text: '',
                                    value: state.checkboxStates['control5'] ?? false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'control5',
                                    enabled: enabled,
                                  );
                                }
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
                          if (enabled == false) {
                            return ShowCheck(text: 'Составить заявку на игрушки', value: toyOrder);
                          } else {
                            return NewCheck(
                              text: 'Составить заявку на игрушки',
                              value: state.checkboxStates['toyOrder'] ?? false,
                              checkboxBloc: checkboxBloc,
                              checkboxId: 'toyOrder',
                              enabled: enabled,
                            );
                          }
                        },
                      ),
                    ),
                    CommentWorker(
                      commentValue: commentToyOrder,
                      readOnly: readOnly,
                    ),
                    ShowCommentDirector(
                      valueDirector: commentDirectorToyOrder,
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: Column(
                      children: [
                        if (enabled == true)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 50),
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Colors.green[800],
                            ),
                            onPressed: () {
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

                              Api().artBegin(
                                  date,
                                  time,
                                  listArtist,
                                  commentListArtist.text,
                                  commentDirectorListArtist,
                                  readiness,
                                  commentReadiness.text,
                                  commentDirectorReadiness,
                                  sendListOfGirls,
                                  commentSendListOfGirls.text,
                                  commentDirectorSendListOfGirls,
                                  listDJ,
                                  commentListDJ.text,
                                  commentDirectorListDJ,
                                  analyzeGraph,
                                  commentAnalyzeGraph.text,
                                  commentDirectorAnalyzeGraph,
                                  controlArtistAnalize,
                                  commentControlArtistAnalize.text,
                                  commentDirectorControlArtistAnalize,
                                  fiveMinutes,
                                  commentFiveMinutes.text,
                                  commentDirectorFiveMinutes,
                                  firstCard,
                                  secondCard,
                                  thirdCard,
                                  commentCard.text,
                                  commentDirectorCard,
                                  control1,
                                  commentControl1.text,
                                  control2,
                                  commentControl2.text,
                                  control3,
                                  commentControl3.text,
                                  control4,
                                  commentControl4.text,
                                  control5,
                                  commentControl5.text,
                                  toyOrder,
                                  commentToyOrder.text,
                                  commentDirectorToyOrder,
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
                          )
                        else
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[800],
                              ),
                              child: const Text('На главный экран'))
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
