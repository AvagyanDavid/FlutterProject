import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/checkbox/bloc/checkbox_bloc.dart';
import 'package:test_form/component/checkbox/checkbox.dart';

class Cleaning_end extends StatefulWidget {
  final int idUser;
  final DateTime now;

  Cleaning_end({super.key, required this.idUser, required this.now});

  @override
  State<Cleaning_end> createState() => _Cleaning_endState();
}

class _Cleaning_endState extends State<Cleaning_end> {
  CheckboxBloc checkboxBloc = CheckboxBloc();

  TextEditingController commentEmptyTrashCansAllBathrooms = TextEditingController();
  TextEditingController commentEmptyTrashCanStreet = TextEditingController();
  TextEditingController commentWashFloorsAllRooms = TextEditingController();
  TextEditingController commentTakeTrashStorageRoom = TextEditingController();
  TextEditingController commentCountNumberCleanTowels = TextEditingController();

  String? commentDirectorEmptyTrashCansAllBathrooms = '';
  String? commentDirectorEmptyTrashCanStreet = '';
  String? commentDirectorWashFloorsAllRooms = '';
  String? commentDirectorTakeTrashStorageRoom = '';
  String? commentDirectorCountNumberCleanTowels = '';

  bool readOnly = false;
  bool enabled = true;

  bool emptyTrashCansAllBathrooms = false;
  bool emptyTrashCanStreet = false;
  bool washFloorsAllRooms = false;
  bool takeTrashStorageRoom = false;
  bool countNumberCleanTowels = false;

  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final results = await Api().checkReportCleaningEnd(date);
    if (results != null) {
      readOnly = true;
      enabled = false;
      final response = await Api().showCleaningEnd(date);
      emptyTrashCansAllBathrooms = response['EmptyTrashCansAllBathrooms'] != 0 ? true : false;
      commentEmptyTrashCansAllBathrooms.text = response['Comment_EmptyTrashCansAllBathrooms'];
      commentDirectorEmptyTrashCansAllBathrooms = response['CommentDirector_EmptyTrashCansAllBathrooms'];
      emptyTrashCanStreet = response['EmptyTrashCanStreet'] != 0 ? true : false;
      commentEmptyTrashCanStreet.text = response['Comment_EmptyTrashCanStreet'];
      commentDirectorEmptyTrashCanStreet = response['CommentDirector_EmptyTrashCanStreet'];
      washFloorsAllRooms = response['WashFloorsAllRooms'] != 0 ? true : false;
      commentWashFloorsAllRooms.text = response['Comment_WashFloorsAllRooms'];
      commentDirectorWashFloorsAllRooms = response['CommentDirector_WashFloorsAllRooms'];
      takeTrashStorageRoom = response['TakeTrashStorageRoom'] != 0 ? true : false;
      commentTakeTrashStorageRoom.text = response['Comment_TakeTrashStorageRoom'];
      commentDirectorTakeTrashStorageRoom = response['CommentDirector_TakeTrashStorageRoom'];
      countNumberCleanTowels = response['CountNumberCleanTowels'] != 0 ? true : false;
      commentCountNumberCleanTowels.text = response['Comment_CountNumberCleanTowels'];
      commentDirectorCountNumberCleanTowels = response['CommentDirector_CountNumberCleanTowels'];
      setState(() {});
    }
  }

  @override
  void initState() {
    getStatusReport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
            height: 170,
            decoration: const BoxDecoration(
              color: Color(0xff000000),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 50, 10, 12.74),
                    width: 173,
                    height: double.infinity,
                    // color: Colors.green,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Привет Клининг',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                              color: Color(0xffffffff),
                            ),
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
                        ]
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Align(alignment: Alignment.topRight, child: Image.asset("assets/emblem.png")),
                  ),
                ]
            ),
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 31.5, 0, 62),
                margin: const EdgeInsets.fromLTRB(14, 0, 19, 56),
                width: double.infinity,
                child:Column(children:[
                const SizedBox(
                  child: Text(
                    'Конец смены',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      height: 1.2999999523,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(
                      builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(text: 'Очистить урны во всех санузлах', value: emptyTrashCansAllBathrooms);
                        } else {
                          return NewCheck(
                            text: "Очистить урны во всех санузлах",
                            value: state.checkboxStates['emptyTrashCansAllBathrooms'] ?? false,
                            checkboxBloc: checkboxBloc,
                            checkboxId: 'emptyTrashCansAllBathrooms',
                            enabled: enabled,
                          );
                        }
                      },
                    ),
                  ),
                  CommentWorker(
                    commentValue: commentEmptyTrashCansAllBathrooms,
                    readOnly: readOnly,
                  ),
                  ShowCommentDirector(valueDirector: commentDirectorEmptyTrashCansAllBathrooms),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(
                      builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(text: 'Очистить урну на улице', value: emptyTrashCanStreet);
                        } else {
                          return NewCheck(
                            text: "Очистить урну на улице",
                            value: state.checkboxStates['emptyTrashCanStreet'] ?? false,
                            checkboxBloc: checkboxBloc,
                            checkboxId: 'emptyTrashCanStreet',
                            enabled: enabled,
                          );
                        }
                      },
                    ),
                  ),
                  CommentWorker(
                    commentValue: commentEmptyTrashCanStreet,
                    readOnly: readOnly,
                  ),
                  ShowCommentDirector(valueDirector: commentDirectorEmptyTrashCanStreet),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(
                      builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(
                              text: 'Помыть полы во всех помещениях ',
                              value: washFloorsAllRooms);
                        } else {
                          return NewCheck(
                            text: "Помыть полы во всех помещениях ",
                            value: state.checkboxStates['washFloorsAllRooms'] ?? false,
                            checkboxBloc: checkboxBloc,
                            checkboxId: 'washFloorsAllRooms',
                            enabled: enabled,
                          );
                        }
                      },
                    ),
                  ),
                  CommentWorker(
                    commentValue: commentWashFloorsAllRooms,
                    readOnly: readOnly,
                  ),
                  ShowCommentDirector(valueDirector: commentDirectorWashFloorsAllRooms),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(
                      builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(text: 'Вынести мусор из кладовой', value: takeTrashStorageRoom);
                        } else {
                          return NewCheck(
                            text: "Вынести мусор из кладовой",
                            value: state.checkboxStates['takeTrashStorageRoom'] ?? false,
                            checkboxBloc: checkboxBloc,
                            checkboxId: 'takeTrashStorageRoom',
                            enabled: enabled,
                          );
                        }
                      },
                    ),
                  ),
                  CommentWorker(
                    commentValue: commentTakeTrashStorageRoom,
                    readOnly: readOnly,
                  ),
                  ShowCommentDirector(valueDirector: commentDirectorTakeTrashStorageRoom),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(
                      builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(text: 'Посчитать количество чистых полотенец и передать администратору', value: countNumberCleanTowels);
                        } else {
                          return NewCheck(
                            text: "Посчитать количество чистых полотенец и передать администратору",
                            value: state.checkboxStates['countNumberCleanTowels'] ?? false,
                            checkboxBloc: checkboxBloc,
                            checkboxId: 'countNumberCleanTowels',
                            enabled: enabled,
                          );
                        }
                      },
                    ),
                  ),
                  CommentWorker(
                    commentValue: commentCountNumberCleanTowels,
                    readOnly: readOnly,
                  ),
                  ShowCommentDirector(valueDirector: commentDirectorCountNumberCleanTowels),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Column(children: [
                        if (enabled == true)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 50),
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Colors.green[800],
                            ),
                            onPressed: () {
                              DateTime now = DateTime.now().toUtc();
                              String date = '${now.year}-${now.month}-${now.day}';
                              String time = '${now.hour}:${now.minute}:${now.second}';

                              final state = checkboxBloc.state;
                              final emptyTrashCansAllBathrooms = state.checkboxStates['emptyTrashCansAllBathrooms'] ?? false;
                              final emptyTrashCanStreet = state.checkboxStates['emptyTrashCanStreet'] ?? false;
                              final washFloorsAllRooms = state.checkboxStates['washFloorsAllRooms'] ?? false;
                              final takeTrashStorageRoom = state.checkboxStates['takeTrashStorageRoom'] ?? false;
                              final countNumberCleanTowels = state.checkboxStates['countNumberCleanTowels'] ?? false;

                              Api().cleaningEnd(
                                  date,
                                  time,
                                  emptyTrashCansAllBathrooms,
                                  commentEmptyTrashCansAllBathrooms.text,
                                  commentDirectorEmptyTrashCansAllBathrooms,
                                  emptyTrashCanStreet,
                                  commentEmptyTrashCanStreet.text,
                                  commentDirectorEmptyTrashCanStreet,
                                  washFloorsAllRooms,
                                  commentWashFloorsAllRooms.text,
                                  commentDirectorWashFloorsAllRooms,
                                  takeTrashStorageRoom,
                                  commentTakeTrashStorageRoom.text,
                                  commentDirectorTakeTrashStorageRoom,
                                  countNumberCleanTowels,
                                  commentCountNumberCleanTowels.text,
                                  commentDirectorCountNumberCleanTowels,
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
                      ])),
                ])
              ]
          ),
        )
          ),
        ),
      ]),
    );
  }
}
