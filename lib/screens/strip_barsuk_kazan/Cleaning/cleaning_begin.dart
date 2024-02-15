import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/checkbox/bloc/checkbox_bloc.dart';
import 'package:test_form/component/checkbox/checkbox.dart';

class Cleaning_begin extends StatefulWidget {
  final int idUser;
  final DateTime now;

  Cleaning_begin({super.key, required this.idUser, required this.now});

  @override
  State<Cleaning_begin> createState() => _Cleaning_beginState();
}

class _Cleaning_beginState extends State<Cleaning_begin> {
  CheckboxBloc checkboxBloc = CheckboxBloc();

  TextEditingController commentCabinet = TextEditingController();
  TextEditingController commentFirstFloor = TextEditingController();
  TextEditingController commentToilets = TextEditingController();
  TextEditingController commentWashStairsSecondFloor = TextEditingController();
  TextEditingController commentSecondFloor = TextEditingController();
  TextEditingController commentBar = TextEditingController();
  TextEditingController commentAlice = TextEditingController();
  TextEditingController commentTakeAllTrash = TextEditingController();
  TextEditingController commentStreet = TextEditingController();
  TextEditingController commentCheckRoomsCobwebs = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms1 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms2 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms3 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms4 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms5 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms6 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms7 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms8 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms9 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms10 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms11 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms12 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms13 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms14 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms15 = TextEditingController();
  TextEditingController commentCheckCleanlinessBathrooms16 = TextEditingController();

  String commentDirectorCabinet = '';
  String commentDirectorFirstFloor = '';
  String commentDirectorToilets = '';
  String commentDirectorWashStairsSecondFloor = '';
  String commentDirectorSecondFloor = '';
  String commentDirectorBar = '';
  String commentDirectorAlice = '';
  String commentDirectorTakeAllTrash = '';
  String commentDirectorStreet = '';
  String commentDirectorCheckRoomsCobwebs = '';
  String commentDirectorCheckCleanlinessBathrooms = '';

  bool readOnly = false;
  bool enabled = true;

  bool washFloors = false;
  bool wipeTablesWindowShelves = false;
  bool corridor = false;
  bool relax = false;
  bool guestbook = false;
  bool toilet = false;
  bool wipeWindowSills = false;
  bool wipePanelBox = false;
  bool wipePaintings = false;
  bool wipeInteriorDoors = false;
  bool wipeWalls = false;
  bool cleanSinks = false;
  bool cleanToilets = false;
  bool wipeMirrors = false;
  bool wipeDispensers = false;
  bool fillDispensers = false;
  bool washStairsSecondFloor = false;
  bool washFloorsSecondFloor = false;
  bool washStage = false;
  bool wipeLargeMirror = false;
  bool vacuum = false;
  bool wipeBaseboardsOnColumn = false;
  bool prepareCrazyRoom = false;
  bool washFloorsBar = false;
  bool washDishesBar = false;
  bool washFloorsAlice = false;
  bool wipeMirrorsHallway = false;
  bool fillDispensersAlice = false;
  bool wipeBathroomMirror = false;
  bool cleanSinkToilet = false;
  bool wipeReception = false;
  bool wipeTableGuestRoom = false;
  bool vacuumStairs = false;
  bool takeAllTrash = false;
  bool wipeIronWindowSills = false;
  bool wipeDoorSign = false;
  bool removeCobwebs = false;
  bool emptyTrashCan = false;
  bool checkRoomsCobwebs = false;
  bool checkCleanlinessBathrooms1 = false;
  bool checkCleanlinessBathrooms2 = false;
  bool checkCleanlinessBathrooms3 = false;
  bool checkCleanlinessBathrooms4 = false;
  bool checkCleanlinessBathrooms5 = false;
  bool checkCleanlinessBathrooms6 = false;
  bool checkCleanlinessBathrooms7 = false;
  bool checkCleanlinessBathrooms8 = false;
  bool checkCleanlinessBathrooms9 = false;
  bool checkCleanlinessBathrooms10 = false;
  bool checkCleanlinessBathrooms11 = false;
  bool checkCleanlinessBathrooms12 = false;
  bool checkCleanlinessBathrooms13 = false;
  bool checkCleanlinessBathrooms14 = false;
  bool checkCleanlinessBathrooms15 = false;
  bool checkCleanlinessBathrooms16 = false;

  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final results = await Api().checkReportCleaningBegin(date);
    if (results != null) {
      readOnly = true;
      enabled = false;
      final response = await Api().showCleaningBegin(date);
      washFloors = response['WashFloors'] != 0 ? true : false;
      wipeTablesWindowShelves = response['WipeTablesWindowShelves'] != 0 ? true : false;
      commentCabinet.text = response['Comment_Cabinet'];
      commentDirectorCabinet = response['CommentDirector_Cabinet'];
      corridor = response['Corridor'] != 0 ? true : false;
      relax = response['Relax'] != 0 ? true : false;
      guestbook = response['Guestbook'] != 0 ? true : false;
      toilet = response['Toilet'] != 0 ? true : false;
      wipeWindowSills = response['WipeWindowSills'] != 0 ? true : false;
      wipePanelBox = response['WipePanelBox'] != 0 ? true : false;
      wipePaintings = response['WipePaintings'] != 0 ? true : false;
      wipeInteriorDoors = response['WipeInteriorDoors'] != 0 ? true : false;
      commentFirstFloor.text = response['Comment_FirstFloor'];
      commentDirectorFirstFloor = response['CommentDirector_FirstFloor'];
      wipeWalls = response['WipeWalls'] != 0 ? true : false;
      cleanSinks = response['CleanSinks'] != 0 ? true : false;
      cleanToilets = response['CleanToilets'] != 0 ? true : false;
      wipeMirrors = response['WipeMirrors'] != 0 ? true : false;
      wipeDispensers = response['WipeDispensers'] != 0 ? true : false;
      fillDispensers = response['FillDispensers'] != 0 ? true : false;
      commentToilets.text = response['Comment_Toilets'];
      commentDirectorToilets = response['CommentDirector_Toilets'];
      washStairsSecondFloor = response['WashStairsSecondFloor'] != 0 ? true : false;
      commentWashStairsSecondFloor.text = response['Comment_WashStairsSecondFloor'];
      commentDirectorWashStairsSecondFloor = response['CommentDirector_WashStairsSecondFloor'];
      washFloorsSecondFloor = response['WashFloorsSecondFloor'] != 0 ? true : false;
      washStage = response['WashStage'] != 0 ? true : false;
      wipeLargeMirror = response['WipeLargeMirror'] != 0 ? true : false;
      vacuum = response['Vacuum'] != 0 ? true : false;
      wipeBaseboardsOnColumn = response['WipeBaseboardsOnColumn'] != 0 ? true : false;
      prepareCrazyRoom = response['PrepareCrazyRoom'] != 0 ? true : false;
      commentSecondFloor.text = response['Comment_SecondFloor'];
      commentDirectorSecondFloor = response['CommentDirector_SecondFloor'];
      washFloorsBar = response['WashFloorsBar'] != 0 ? true : false;
      washDishesBar = response['WashDishesBar'] != 0 ? true : false;
      commentBar.text = response['Comment_Bar'];
      commentDirectorBar = response['CommentDirector_Bar'];
      washFloorsAlice = response['WashFloorsAlice'] != 0 ? true : false;
      wipeMirrorsHallway = response['WipeMirrorsHallway'] != 0 ? true : false;
      fillDispensersAlice = response['FillDispensersAlice'] != 0 ? true : false;
      wipeBathroomMirror = response['WipeBathroomMirror'] != 0 ? true : false;
      cleanSinkToilet = response['CleanSinkToilet'] != 0 ? true : false;
      wipeReception = response['WipeReception'] != 0 ? true : false;
      wipeTableGuestRoom = response['WipeTableGuestRoom'] != 0 ? true : false;
      vacuumStairs = response['VacuumStairs'] != 0 ? true : false;
      commentAlice.text = response['Comment_Alice'];
      commentDirectorAlice = response['CommentDirector_Alice'];
      takeAllTrash = response['TakeAllTrash'] != 0 ? true : false;
      commentTakeAllTrash.text = response['Comment_TakeAllTrash'];
      commentDirectorTakeAllTrash = response['CommentDirector_TakeAllTrash'] as String;
      wipeIronWindowSills = response['WipeIronWindowSills'] != 0 ? true : false;
      wipeDoorSign = response['WipeDoorSign'] != 0 ? true : false;
      removeCobwebs = response['RemoveCobwebs'] != 0 ? true : false;
      emptyTrashCan = response['EmptyTrashCan'] != 0 ? true : false;
      commentStreet.text = response['Comment_Street'];
      commentDirectorStreet = response['CommentDirector_Street'];
      checkRoomsCobwebs = response['CheckRoomsCobwebs'] != 0 ? true : false;
      commentCheckRoomsCobwebs.text = response['Comment_CheckRoomsCobwebs'];
      commentDirectorCheckRoomsCobwebs = response['CommentDirector_CheckRoomsCobwebs'];
      commentCheckCleanlinessBathrooms1.text = response['Comment_CheckCleanlinessBathrooms1'];
      checkCleanlinessBathrooms1 = response['CheckCleanlinessBathrooms1'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms2.text = response['Comment_CheckCleanlinessBathrooms2'];
      checkCleanlinessBathrooms2 = response['CheckCleanlinessBathrooms2'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms3.text = response['Comment_CheckCleanlinessBathrooms3'];
      checkCleanlinessBathrooms3 = response['CheckCleanlinessBathrooms3'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms4.text = response['Comment_CheckCleanlinessBathrooms4'];
      checkCleanlinessBathrooms4 = response['CheckCleanlinessBathrooms4'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms5.text = response['Comment_CheckCleanlinessBathrooms5'];
      checkCleanlinessBathrooms5 = response['CheckCleanlinessBathrooms5'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms6.text = response['Comment_CheckCleanlinessBathrooms6'];
      checkCleanlinessBathrooms6 = response['CheckCleanlinessBathrooms6'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms7.text = response['Comment_CheckCleanlinessBathrooms7'];
      checkCleanlinessBathrooms7 = response['CheckCleanlinessBathrooms7'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms8.text = response['Comment_CheckCleanlinessBathrooms8'];
      checkCleanlinessBathrooms8 = response['CheckCleanlinessBathrooms8'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms9.text = response['Comment_CheckCleanlinessBathrooms9'];
      checkCleanlinessBathrooms9 = response['CheckCleanlinessBathrooms9'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms10.text = response['Comment_CheckCleanlinessBathrooms10'];
      checkCleanlinessBathrooms10 = response['CheckCleanlinessBathrooms10'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms11.text = response['Comment_CheckCleanlinessBathrooms11'];
      checkCleanlinessBathrooms11 = response['CheckCleanlinessBathrooms11'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms12.text = response['Comment_CheckCleanlinessBathrooms12'];
      checkCleanlinessBathrooms12 = response['CheckCleanlinessBathrooms12'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms13.text = response['Comment_CheckCleanlinessBathrooms13'];
      checkCleanlinessBathrooms13 = response['CheckCleanlinessBathrooms13'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms14.text = response['Comment_CheckCleanlinessBathrooms14'];
      checkCleanlinessBathrooms14 = response['CheckCleanlinessBathrooms14'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms15.text = response['Comment_CheckCleanlinessBathrooms15'];
      checkCleanlinessBathrooms15 = response['СheckCleanlinessBathrooms15'] != 0 ? true : false;
      commentCheckCleanlinessBathrooms16.text = response['Comment_CheckCleanlinessBathrooms16'];
      checkCleanlinessBathrooms16 = response['СheckCleanlinessBathrooms16'] != 0 ? true : false;
      commentDirectorCheckCleanlinessBathrooms = response['CommentDirector_CheckCleanlinessBathrooms'];
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
              child: Column(
                children: [
                  const SizedBox(
                    child: Text(
                      'Начало смены',
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
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Кабинет:',
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
                              return ShowCheck(text: 'Помыть полы', value: washFloors);
                            } else {
                              return NewCheck(
                                text: "Помыть полы",
                                value: state.checkboxStates['washFloors'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'washFloors',
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
                              return ShowCheck(text: 'Протереть столы, подоконники, полки', value: wipeTablesWindowShelves);
                            } else {
                              return NewCheck(
                                text: "Протереть столы, подоконники, полки",
                                value: state.checkboxStates['wipeTablesWindowShelves'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeTablesWindowShelves',
                                enabled: enabled,
                              );
                            }
                          },
                        ),
                      ),
                      CommentWorker(
                        commentValue: commentCabinet,
                        readOnly: readOnly,
                      ),
                      ShowCommentDirector(valueDirector: commentDirectorCabinet),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Первый этаж (помыть полы):',
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
                              return ShowCheck(text: 'Коридор', value: corridor);
                            } else {
                              return NewCheck(
                                text: "Коридор",
                                value: state.checkboxStates['corridor'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'corridor',
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
                              return ShowCheck(text: 'Релакс', value: relax);
                            } else {
                              return NewCheck(
                                text: "Релакс",
                                value: state.checkboxStates['relax'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'relax',
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
                              return ShowCheck(text: 'Гостевая', value: guestbook);
                            } else {
                              return NewCheck(
                                text: "Гостевая",
                                value: state.checkboxStates['guestbook'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'guestbook',
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
                              return ShowCheck(text: 'Туалет', value: toilet);
                            } else {
                              return NewCheck(
                                text: "Туалет",
                                value: state.checkboxStates['toilet'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'toilet',
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
                              return ShowCheck(text: 'Протереть подоконники', value: wipeWindowSills);
                            } else {
                              return NewCheck(
                                text: "Протереть подоконники",
                                value: state.checkboxStates['wipeWindowSills'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeWindowSills',
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
                              return ShowCheck(text: 'Протереть щитовой короб', value: wipePanelBox);
                            } else {
                              return NewCheck(
                                text: "Протереть щитовой короб",
                                value: state.checkboxStates['wipePanelBox'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipePanelBox',
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
                              return ShowCheck(text: 'Протереть картины', value: wipePaintings);
                            } else {
                              return NewCheck(
                                text: "Протереть картины",
                                value: state.checkboxStates['wipePaintings'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipePaintings',
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
                              return ShowCheck(text: 'Протереть межкомнатные двери', value: wipeInteriorDoors);
                            } else {
                              return NewCheck(
                                text: "Протереть межкомнатные двери",
                                value: state.checkboxStates['wipeInteriorDoors'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeInteriorDoors',
                                enabled: enabled,
                              );
                            }
                          },
                        ),
                      ),
                      CommentWorker(
                        commentValue: commentFirstFloor,
                        readOnly: readOnly,
                      ),
                      ShowCommentDirector(valueDirector: commentDirectorFirstFloor),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Туалеты:',
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
                              return ShowCheck(text: 'Протереть стены', value: wipeWalls);
                            } else {
                              return NewCheck(
                                text: "Протереть стены",
                                value: state.checkboxStates['wipeWalls'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeWalls',
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
                              return ShowCheck(text: 'Протереть раковины', value: cleanSinks);
                            } else {
                              return NewCheck(
                                text: "Протереть раковины",
                                value: state.checkboxStates['cleanSinks'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'cleanSinks',
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
                              return ShowCheck(text: 'Почистить унитазы', value: cleanToilets);
                            } else {
                              return NewCheck(
                                text: "Почистить унитазы",
                                value: state.checkboxStates['cleanToilets'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'cleanToilets',
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
                              return ShowCheck(text: 'Протереть зеркала', value: wipeMirrors);
                            } else {
                              return NewCheck(
                                text: "Протереть зеркала",
                                value: state.checkboxStates['wipeMirrors'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeMirrors',
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
                              return ShowCheck(text: 'Протереть диспенсеры для сухих полотенец и туалетной бумаги ', value: wipeDispensers);
                            } else {
                              return NewCheck(
                                text: "Протереть диспенсеры для сухих полотенец и туалетной бумаги ",
                                value: state.checkboxStates['wipeDispensers'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeDispensers',
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
                              return ShowCheck(text: 'Заполнить диспенсеры (бумага/полотенца/мыло)', value: fillDispensers);
                            } else {
                              return NewCheck(
                                text: "Заполнить диспенсеры (бумага/полотенца/мыло)",
                                value: state.checkboxStates['fillDispensers'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'fillDispensers',
                                enabled: enabled,
                              );
                            }
                          },
                        ),
                      ),
                      CommentWorker(
                        commentValue: commentToilets,
                        readOnly: readOnly,
                      ),
                      ShowCommentDirector(valueDirector: commentDirectorToilets),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocProvider<CheckboxBloc>(
                        create: (context) => checkboxBloc,
                        child: BlocBuilder<CheckboxBloc, CheckboxState>(
                          builder: (context, state) {
                            if (enabled == false) {
                              return ShowCheck(text: 'Помыть лестницу на второй этаж и протереть перила', value: washStairsSecondFloor);
                            } else {
                              return NewCheck(
                                text: "Помыть лестницу на второй этаж и протереть перила",
                                value: state.checkboxStates['washStairsSecondFloor'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'washStairsSecondFloor',
                                enabled: enabled,
                              );
                            }
                          },
                        ),
                      ),
                      CommentWorker(
                        commentValue: commentWashStairsSecondFloor,
                        readOnly: readOnly,
                      ),
                      ShowCommentDirector(valueDirector: commentDirectorWashStairsSecondFloor),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Второй этаж:',
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
                              return ShowCheck(text: 'Помыть полы', value: washFloorsSecondFloor);
                            } else {
                              return NewCheck(
                                text: "Помыть полы",
                                value: state.checkboxStates['washFloorsSecondFloor'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'washFloorsSecondFloor',
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
                              return ShowCheck(text: 'Помыть сцену', value: washStage);
                            } else {
                              return NewCheck(
                                text: "Помыть сцену",
                                value: state.checkboxStates['washStage'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'washStage',
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
                              return ShowCheck(text: 'Протереть большое зеркало', value: wipeLargeMirror);
                            } else {
                              return NewCheck(
                                text: "Протереть большое зеркало",
                                value: state.checkboxStates['wipeLargeMirror'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeLargeMirror',
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
                              return ShowCheck(text: 'Пропылесосить', value: vacuum);
                            } else {
                              return NewCheck(
                                text: "Пропылесосить",
                                value: state.checkboxStates['vacuum'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'vacuum',
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
                              return ShowCheck(text: 'Протереть плинтуса на каждой колонне', value: wipeBaseboardsOnColumn);
                            } else {
                              return NewCheck(
                                text: "Протереть плинтуса на каждой колонне",
                                value: state.checkboxStates['wipeBaseboardsOnColumn'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeBaseboardsOnColumn',
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
                              return ShowCheck(
                                  text:
                                      'Подготовить комнату крейзи ( постельное/полотенца, протереть подоконник, почистить душевую, заполнить диспенсеры, очистить ведерко для мусора)',
                                  value: prepareCrazyRoom);
                            } else {
                              return NewCheck(
                                text:
                                    "Подготовить комнату крейзи ( постельное/полотенца, протереть подоконник, почистить душевую, заполнить диспенсеры, очистить ведерко для мусора)",
                                value: state.checkboxStates['prepareCrazyRoom'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'prepareCrazyRoom',
                                enabled: enabled,
                              );
                            }
                          },
                        ),
                      ),
                      CommentWorker(
                        commentValue: commentSecondFloor,
                        readOnly: readOnly,
                      ),
                      ShowCommentDirector(
                        valueDirector: commentDirectorSecondFloor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Бар:',
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
                              return ShowCheck(text: 'Помыть полы', value: washFloorsBar);
                            } else {
                              return NewCheck(
                                text: "Помыть полы",
                                value: state.checkboxStates['washFloorsBar'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'washFloorsBar',
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
                              return ShowCheck(text: 'Помыть посуду', value: washDishesBar);
                            } else {
                              return NewCheck(
                                text: "Помыть посуду",
                                value: state.checkboxStates['washDishesBar'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'washDishesBar',
                                enabled: enabled,
                              );
                            }
                          },
                        ),
                      ),
                      CommentWorker(
                        commentValue: commentBar,
                        readOnly: readOnly,
                      ),
                      ShowCommentDirector(
                        valueDirector: commentDirectorBar,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Алиса:',
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
                              return ShowCheck(text: 'Помыть полы', value: washFloorsAlice);
                            } else {
                              return NewCheck(
                                text: "Помыть полы",
                                value: state.checkboxStates['washFloorsAlice'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'washFloorsAlice',
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
                              return ShowCheck(text: 'Протереть зеркала в коридоре', value: wipeMirrorsHallway);
                            } else {
                              return NewCheck(
                                text: "Протереть зеркала в коридоре",
                                value: state.checkboxStates['wipeMirrorsHallway'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeMirrorsHallway',
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
                              return ShowCheck(text: 'Заполнить диспенсеры (бумага/полотенца/мыло)', value: fillDispensersAlice);
                            } else {
                              return NewCheck(
                                text: "Заполнить диспенсеры (бумага/полотенца/мыло)",
                                value: state.checkboxStates['fillDispensersAlice'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'fillDispensersAlice',
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
                              return ShowCheck(text: 'Протереть зеркало в с/у', value: wipeBathroomMirror);
                            } else {
                              return NewCheck(
                                text: "Протереть зеркало в с/у",
                                value: state.checkboxStates['wipeBathroomMirror'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeBathroomMirror',
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
                              return ShowCheck(text: 'Почистить раковину и унитаз', value: cleanSinkToilet);
                            } else {
                              return NewCheck(
                                text: "Почистить раковину и унитаз",
                                value: state.checkboxStates['cleanSinkToilet'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'cleanSinkToilet',
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
                              return ShowCheck(text: 'Протереть Ресепшен', value: wipeReception);
                            } else {
                              return NewCheck(
                                text: "Протереть Ресепшен",
                                value: state.checkboxStates['wipeReception'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeReception',
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
                              return ShowCheck(text: 'Протереть стол в гостевой', value: wipeTableGuestRoom);
                            } else {
                              return NewCheck(
                                text: "Протереть стол в гостевой",
                                value: state.checkboxStates['wipeTableGuestRoom'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeTableGuestRoom',
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
                              return ShowCheck(text: 'Пропылесосить лестницу', value: vacuumStairs);
                            } else {
                              return NewCheck(
                                text: "Пропылесосить лестницу",
                                value: state.checkboxStates['vacuumStairs'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'vacuumStairs',
                                enabled: enabled,
                              );
                            }
                          },
                        ),
                      ),
                      CommentWorker(
                        commentValue: commentAlice,
                        readOnly: readOnly,
                      ),
                      ShowCommentDirector(
                        valueDirector: commentDirectorAlice,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocProvider<CheckboxBloc>(
                        create: (context) => checkboxBloc,
                        child: BlocBuilder<CheckboxBloc, CheckboxState>(
                          builder: (context, state) {
                            if (enabled == false) {
                              return ShowCheck(text: 'Вынести весь мусор', value: takeAllTrash);
                            } else {
                              return NewCheck(
                                text: "Вынести весь мусор",
                                value: state.checkboxStates['takeAllTrash'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'takeAllTrash',
                                enabled: enabled,
                              );
                            }
                          },
                        ),
                      ),
                      CommentWorker(
                        commentValue: commentTakeAllTrash,
                        readOnly: readOnly,
                      ),
                      ShowCommentDirector(
                        valueDirector: commentDirectorTakeAllTrash,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Улица:',
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
                              return ShowCheck(text: 'Протереть железные подоконники', value: wipeIronWindowSills);
                            } else {
                              return NewCheck(
                                text: "Протереть железные подоконники",
                                value: state.checkboxStates['wipeIronWindowSills'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeIronWindowSills',
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
                              return ShowCheck(text: 'Протереть дверь и табличку', value: wipeDoorSign);
                            } else {
                              return NewCheck(
                                text: "Протереть дверь и табличку",
                                value: state.checkboxStates['wipeDoorSign'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'wipeDoorSign',
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
                              return ShowCheck(text: 'Убрать паутину', value: removeCobwebs);
                            } else {
                              return NewCheck(
                                text: "Убрать паутину",
                                value: state.checkboxStates['removeCobwebs'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'removeCobwebs',
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
                              return ShowCheck(text: 'Очистить урну', value: emptyTrashCan);
                            } else {
                              return NewCheck(
                                text: "Очистить урну",
                                value: state.checkboxStates['emptyTrashCan'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'emptyTrashCan',
                                enabled: enabled,
                              );
                            }
                          },
                        ),
                      ),
                      CommentWorker(
                        commentValue: commentStreet,
                        readOnly: readOnly,
                      ),
                      ShowCommentDirector(
                        valueDirector: commentDirectorStreet,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocProvider<CheckboxBloc>(
                        create: (context) => checkboxBloc,
                        child: BlocBuilder<CheckboxBloc, CheckboxState>(
                          builder: (context, state) {
                            if (enabled == false) {
                              return ShowCheck(text: 'Проверить все помещения на наличие паутины/убрать', value: checkRoomsCobwebs);
                            } else {
                              return NewCheck(
                                text: "Проверить все помещения на наличие паутины/убрать",
                                value: state.checkboxStates['checkRoomsCobwebs'] ?? false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'checkRoomsCobwebs',
                                enabled: enabled,
                              );
                            }
                          },
                        ),
                      ),
                      CommentWorker(
                        commentValue: commentCheckRoomsCobwebs,
                        readOnly: readOnly,
                      ),
                      ShowCommentDirector(
                        valueDirector: commentDirectorCheckRoomsCobwebs,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'В течение смены проверять чистоту сунузлов каждые 30 минут',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 3,
                            child: CommentWorker(
                              commentValue: commentCheckCleanlinessBathrooms1,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms1);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms1'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms1',
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
                              commentValue: commentCheckCleanlinessBathrooms2,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms2);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms2'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms2',
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
                              commentValue: commentCheckCleanlinessBathrooms3,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms3);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms3'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms3',
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
                              commentValue: commentCheckCleanlinessBathrooms4,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms4);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms4'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms4',
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
                              commentValue: commentCheckCleanlinessBathrooms5,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms5);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms5'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms5',
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
                              commentValue: commentCheckCleanlinessBathrooms6,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms6);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms6'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms6',
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
                              commentValue: commentCheckCleanlinessBathrooms7,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms7);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms7'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms7',
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
                              commentValue: commentCheckCleanlinessBathrooms8,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms8);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms8'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms8',
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
                              commentValue: commentCheckCleanlinessBathrooms9,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms9);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms9'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms9',
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
                              commentValue: commentCheckCleanlinessBathrooms10,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms10);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms10'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms10',
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
                              commentValue: commentCheckCleanlinessBathrooms11,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms11);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms11'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms11',
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
                              commentValue: commentCheckCleanlinessBathrooms12,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms12);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms12'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms12',
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
                              commentValue: commentCheckCleanlinessBathrooms13,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms13);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms13'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms13',
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
                              commentValue: commentCheckCleanlinessBathrooms14,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms14);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms14'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms14',
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
                              commentValue: commentCheckCleanlinessBathrooms15,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms15);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms15'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms15',
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
                              commentValue: commentCheckCleanlinessBathrooms16,
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
                                    return ShowCheck(text: '', value: checkCleanlinessBathrooms16);
                                  } else {
                                    return NewCheck(
                                      text: '',
                                      value: state.checkboxStates['checkCleanlinessBathrooms16'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'checkCleanlinessBathrooms16',
                                      enabled: enabled,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      ShowCommentDirector(
                        valueDirector: commentDirectorCheckCleanlinessBathrooms,
                      ),
                      const SizedBox(height: 20),
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
                              DateTime now = DateTime.now();
                              String date = '${now.year}-${now.month}-${now.day}';
                              String time = '${now.hour}:${now.minute}:${now.second}';

                              final state = checkboxBloc.state;
                              final washFloors = state.checkboxStates['washFloors'] ?? false;
                              final wipeTablesWindowShelves = state.checkboxStates['wipeTablesWindowShelves'] ?? false;
                              final corridor = state.checkboxStates['corridor'] ?? false;
                              final relax = state.checkboxStates['relax'] ?? false;
                              final guestbook = state.checkboxStates['guestbook'] ?? false;
                              final toilet = state.checkboxStates['toilet'] ?? false;
                              final wipeWindowSills = state.checkboxStates['wipeWindowSills'] ?? false;
                              final wipePanelBox = state.checkboxStates['wipePanelBox'] ?? false;
                              final wipePaintings = state.checkboxStates['wipePaintings'] ?? false;
                              final wipeInteriorDoors = state.checkboxStates['wipeInteriorDoors'] ?? false;
                              final wipeWalls = state.checkboxStates['wipeWalls'] ?? false;
                              final cleanSinks = state.checkboxStates['cleanSinks'] ?? false;
                              final cleanToilets = state.checkboxStates['cleanToilets'] ?? false;
                              final wipeMirrors = state.checkboxStates['wipeMirrors'] ?? false;
                              final wipeDispensers = state.checkboxStates['wipeDispensers'] ?? false;
                              final fillDispensers = state.checkboxStates['fillDispensers'] ?? false;
                              final washStairsSecondFloor = state.checkboxStates['washStairsSecondFloor'] ?? false;
                              final washFloorsSecondFloor = state.checkboxStates['washFloorsSecondFloor'] ?? false;
                              final washStage = state.checkboxStates['washStage'] ?? false;
                              final wipeLargeMirror = state.checkboxStates['wipeLargeMirror'] ?? false;
                              final vacuum = state.checkboxStates['vacuum'] ?? false;
                              final wipeBaseboardsOnColumn = state.checkboxStates['wipeBaseboardsOnColumn'] ?? false;
                              final prepareCrazyRoom = state.checkboxStates['prepareCrazyRoom'] ?? false;
                              final washFloorsBar = state.checkboxStates['washFloorsBar'] ?? false;
                              final washDishesBar = state.checkboxStates['washDishesBar'] ?? false;
                              final washFloorsAlice = state.checkboxStates['washFloorsAlice'] ?? false;
                              final wipeMirrorsHallway = state.checkboxStates['wipeMirrorsHallway'] ?? false;
                              final fillDispensersAlice = state.checkboxStates['fillDispensersAlice'] ?? false;
                              final wipeBathroomMirror = state.checkboxStates['wipeBathroomMirror'] ?? false;
                              final cleanSinkToilet = state.checkboxStates['cleanSinkToilet'] ?? false;
                              final wipeReception = state.checkboxStates['wipeReception'] ?? false;
                              final wipeTableGuestRoom = state.checkboxStates['wipeTableGuestRoom'] ?? false;
                              final vacuumStairs = state.checkboxStates['vacuumStairs'] ?? false;
                              final takeAllTrash = state.checkboxStates['takeAllTrash'] ?? false;
                              final wipeIronWindowSills = state.checkboxStates['wipeIronWindowSills'] ?? false;
                              final wipeDoorSign = state.checkboxStates['wipeDoorSign'] ?? false;
                              final removeCobwebs = state.checkboxStates['removeCobwebs'] ?? false;
                              final emptyTrashCan = state.checkboxStates['emptyTrashCan'] ?? false;
                              final checkRoomsCobwebs = state.checkboxStates['checkRoomsCobwebs'] ?? false;
                              final checkCleanlinessBathrooms1 = state.checkboxStates['checkCleanlinessBathrooms1'] ?? false;
                              final checkCleanlinessBathrooms2 = state.checkboxStates['checkCleanlinessBathrooms2'] ?? false;
                              final checkCleanlinessBathrooms3 = state.checkboxStates['checkCleanlinessBathrooms3'] ?? false;
                              final checkCleanlinessBathrooms4 = state.checkboxStates['checkCleanlinessBathrooms4'] ?? false;
                              final checkCleanlinessBathrooms5 = state.checkboxStates['checkCleanlinessBathrooms5'] ?? false;
                              final checkCleanlinessBathrooms6 = state.checkboxStates['checkCleanlinessBathrooms6'] ?? false;
                              final checkCleanlinessBathrooms7 = state.checkboxStates['checkCleanlinessBathrooms7'] ?? false;
                              final checkCleanlinessBathrooms8 = state.checkboxStates['checkCleanlinessBathrooms8'] ?? false;
                              final checkCleanlinessBathrooms9 = state.checkboxStates['checkCleanlinessBathrooms9'] ?? false;
                              final checkCleanlinessBathrooms10 = state.checkboxStates['checkCleanlinessBathrooms10'] ?? false;
                              final checkCleanlinessBathrooms11 = state.checkboxStates['checkCleanlinessBathrooms11'] ?? false;
                              final checkCleanlinessBathrooms12 = state.checkboxStates['checkCleanlinessBathrooms12'] ?? false;
                              final checkCleanlinessBathrooms13 = state.checkboxStates['checkCleanlinessBathrooms13'] ?? false;
                              final checkCleanlinessBathrooms14 = state.checkboxStates['checkCleanlinessBathrooms14'] ?? false;
                              final checkCleanlinessBathrooms15 = state.checkboxStates['checkCleanlinessBathrooms15'] ?? false;
                              final checkCleanlinessBathrooms16 = state.checkboxStates['checkCleanlinessBathrooms16'] ?? false;

                              Api().cleaningBegin(
                                  date,
                                  time,
                                  washFloors,
                                  wipeTablesWindowShelves,
                                  commentCabinet.text,
                                  commentDirectorCabinet,
                                  corridor, relax, guestbook, toilet, wipeWindowSills, wipePanelBox, wipePaintings, wipeInteriorDoors,
                                  commentFirstFloor.text, commentDirectorFirstFloor,
                                  wipeWalls, cleanSinks, cleanToilets, wipeMirrors, wipeDispensers, fillDispensers,
                                  commentToilets.text, commentDirectorToilets,
                                  washStairsSecondFloor, commentWashStairsSecondFloor.text, commentDirectorWashStairsSecondFloor,
                                  washFloorsSecondFloor, washStage, wipeLargeMirror, vacuum, wipeBaseboardsOnColumn, prepareCrazyRoom,
                                  commentSecondFloor.text, commentDirectorSecondFloor,
                                  washFloorsBar, washDishesBar, commentBar.text, commentDirectorBar,
                                  washFloorsAlice, wipeMirrorsHallway, fillDispensersAlice, wipeBathroomMirror,
                                  cleanSinkToilet, wipeReception, wipeTableGuestRoom, vacuumStairs,
                                  commentAlice.text, commentDirectorAlice,
                                  takeAllTrash, commentTakeAllTrash.text, commentDirectorTakeAllTrash,
                                  wipeIronWindowSills, wipeDoorSign, removeCobwebs, emptyTrashCan, commentStreet.text, commentDirectorStreet,
                                  checkRoomsCobwebs, commentCheckRoomsCobwebs.text, commentDirectorCheckRoomsCobwebs,
                                  checkCleanlinessBathrooms1, commentCheckCleanlinessBathrooms1.text,
                                  checkCleanlinessBathrooms2, commentCheckCleanlinessBathrooms2.text,
                                  checkCleanlinessBathrooms3, commentCheckCleanlinessBathrooms3.text,
                                  checkCleanlinessBathrooms4, commentCheckCleanlinessBathrooms4.text,
                                  checkCleanlinessBathrooms5, commentCheckCleanlinessBathrooms5.text,
                                  checkCleanlinessBathrooms6, commentCheckCleanlinessBathrooms6.text,
                                  checkCleanlinessBathrooms7, commentCheckCleanlinessBathrooms7.text,
                                  checkCleanlinessBathrooms8, commentCheckCleanlinessBathrooms8.text,
                                  checkCleanlinessBathrooms9, commentCheckCleanlinessBathrooms9.text,
                                  checkCleanlinessBathrooms10, commentCheckCleanlinessBathrooms10.text,
                                  checkCleanlinessBathrooms11, commentCheckCleanlinessBathrooms11.text,
                                  checkCleanlinessBathrooms12, commentCheckCleanlinessBathrooms12.text,
                                  checkCleanlinessBathrooms13, commentCheckCleanlinessBathrooms13.text,
                                  checkCleanlinessBathrooms14, commentCheckCleanlinessBathrooms14.text,
                                  checkCleanlinessBathrooms15, commentCheckCleanlinessBathrooms15.text,
                                  checkCleanlinessBathrooms16, commentCheckCleanlinessBathrooms16.text,
                                  commentDirectorCheckCleanlinessBathrooms,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
