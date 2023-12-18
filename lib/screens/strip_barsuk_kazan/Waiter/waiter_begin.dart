import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/bloc/photo_bloc.dart';
import 'package:test_form/component/photo/photo.dart';
import 'package:test_form/main.dart';
import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';

class Waiter_begin extends StatefulWidget {
  final int idUser;
  final DateTime now;

  Waiter_begin({super.key, required this.idUser, required this.now});

  @override
  State<Waiter_begin> createState() => _Waiter_beginState();
}

class _Waiter_beginState extends State<Waiter_begin> {

  TextEditingController commentTableArrangment = TextEditingController();
  TextEditingController commentWipeTheTables = TextEditingController();
  TextEditingController commentInspectionOfTheHall = TextEditingController();
  TextEditingController commentArrangeOttomans = TextEditingController();
  TextEditingController commentPutEverithingOnTheTables = TextEditingController();
  TextEditingController commentWipeMenu = TextEditingController();
  TextEditingController commentCleanWineCabinet = TextEditingController();
  TextEditingController commentFillTheNapkinHolder = TextEditingController();
  TextEditingController commentGarbageEmpty = TextEditingController();
  TextEditingController commentPassDishesKitchen = TextEditingController();
  TextEditingController commentRequestStartAndStopList = TextEditingController();
  TextEditingController commentCleanHumidor = TextEditingController();

  bool readOnly = false;
  bool enabled = true;

  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();

  String? tableArrangementPath = null;
  String? wipeTheTablesPath = null;
  String? inspectionOfTheHallPath = null;
  String? arrangeOttomansPath = null;
  String? putEverythingOnTheTablesPath = null;
  String? wipeMenuPath = null;

  String? commentDirectorTableArrangment;
  String? commentDirectorWipeTheTables;
  String? commentDirectorInspectionOfTheHall;
  String? commentDirectorArrangeOttomans;
  String? commentDirectorPutEverithingOnTheTables;
  String? commentDirectorWipeMenu;
  String? commentDirectorCleanWineCabinet;
  String? commentDirectorFillTheNapkinHolder;
  String? commentDirectorGarbageEmpty;
  String? commentDirectorPassDishesKitchen;
  String? commentDirectorRequestStartAndStopList;
  String? commentDirectorCleanHumidor;
  bool tableArrangement = false;
  bool wipeTheTables = false;
  bool inspectionOfTheHall = false;
  bool arrangeOttomans = false;
  bool putEverythingOnTheTables = false;
  bool wipeMenu = false;
  bool cleanWineCabinet = false;
  bool fillTheNapkinHolder = false;
  bool garbageEmpty = false;
  bool passDishesKitchen = false;
  bool requestStartAndStopList = false;
  bool cleanHumidor = false;

  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final results = await Api().checkReportWaiterBegin(date);
    if (results != null) {
      readOnly = true;
      enabled = false;
      final response = await Api().showWaiterBegin(date);
      tableArrangement = response['TableArrangement'] != 0 ? true : false;
      commentTableArrangment.text = response['Comment_TableArrangment'];
      commentDirectorTableArrangment = response['CommentDirector_TableArrangment'] as String?;
      wipeTheTables = response['WipeTheTables'] != 0 ? true : false;
      commentWipeTheTables.text = response['Comment_WipeTheTables'];
      commentDirectorWipeTheTables = response['CommentDirector_WipeTheTables'] as String?;
      inspectionOfTheHall = response['InspectionOfTheHall'] != 0 ? true : false;
      commentInspectionOfTheHall.text = response['Comment_InspectionOfTheHall'];
      commentDirectorInspectionOfTheHall = response['CommentDirector_InspectionOfTheHall'] as String?;
      arrangeOttomans = response['ArrangeOttomans'] != 0 ? true : false;
      commentArrangeOttomans.text = response['Comment_ArrangeOttomans'];
      commentDirectorArrangeOttomans = response['CommentDirector_ArrangeOttomans'] as String?;
      putEverythingOnTheTables = response['PutEverythingOnTheTables'] != 0 ? true : false;
      commentPutEverithingOnTheTables.text = response['Comment_PutEverithingOnTheTables'];
      commentDirectorPutEverithingOnTheTables = response['CommentDirector_PutEverithingOnTheTables'] as String?;
      wipeMenu = response['WipeMenu'] != 0 ? true : false;
      commentWipeMenu.text = response['Comment_WipeMenu'];
      commentDirectorWipeMenu = response['CommentDirector_WipeMenu'] as String?;
      cleanWineCabinet = response ['CleanWineCabinet'] != 0 ? true : false;
      commentCleanWineCabinet.text = response['Comment_CleanWineCabinet'];
      commentDirectorCleanWineCabinet = response['CommentDirector_CleanWineCabinet'] as String?;
      fillTheNapkinHolder = response ['FillTheNapkinHolder'] != 0 ? true : false;
      commentFillTheNapkinHolder.text = response['Comment_FillTheNapkinHolder'];
      commentDirectorFillTheNapkinHolder = response['CommentDirector_FillTheNapkinHolder'] as String?;
      garbageEmpty = response ['GarbageEmpty'] != 0 ? true : false;
      commentGarbageEmpty.text = response['Comment_GarbageEmpty'];
      commentDirectorGarbageEmpty = response['CommentDirector_GarbageEmpty'] as String?;
      passDishesKitchen = response ['PassDishesKitchen'] != 0 ? true : false;
      commentPassDishesKitchen.text = response['Comment_PassDishesKitchen'];
      commentDirectorPassDishesKitchen = response['CommentDirector_PassDishesKitchen'] as String?;
      requestStartAndStopList = response['RequestStartAndStopList'] != 0 ? true : false;
      commentRequestStartAndStopList.text = response['Comment_RequestStartAndStopList'];
      commentDirectorRequestStartAndStopList = response['CommentDirector_RequestStartAndStopList'] as String?;
      cleanHumidor = response['CleanHumidor'] != 0 ? true : false;
      commentCleanHumidor.text = response['Comment_CleanHumidor'];
      commentDirectorCleanHumidor = response['CommentDirector_CleanHumidor'] as String?;

      tableArrangementPath = response['TableArrangementPhoto'] == null ? null : Api().getPhoto(response['TableArrangementPhoto']);
      wipeTheTablesPath = response['WipeTheTablesPhoto'] == null ? null : Api().getPhoto(response['WipeTheTablesPhoto']);
      inspectionOfTheHallPath = response['InspectionOfTheHallPhoto'] == null ? null : Api().getPhoto(response['InspectionOfTheHallPhoto']);
      arrangeOttomansPath = response['ArrangeOttomansPhoto'] == null ? null : Api().getPhoto(response['ArrangeOttomansPhoto']);
      putEverythingOnTheTablesPath = response['PutEverythingOnTheTablesPhoto'] == null ? null : Api().getPhoto(response['PutEverythingOnTheTablesPhoto']);
      wipeMenuPath = response['WipeMenuPhoto'] == null ? null : Api().getPhoto(response['WipeMenuPhoto']);
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
      body: SizedBox(
        width: 400,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
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
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 9.56),
                                  child: const Text(
                                    'Привет Официант',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      color: Color(0xffffffff),
                                    ),
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
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 150,
                          child: Align(alignment: Alignment.topRight, child: Image.asset("assets/emblem.png")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 120, 0),
              child: const Text(
                'Начало смены',
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
                  padding: const EdgeInsets.fromLTRB(0, 31.5, 0, 62),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(14, 0, 19, 56),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              child: Text(
                                  'Порядок в зале:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                            const SizedBox(height: 20),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Расставить столы на равном расстоянии от диванов',
                                        value: tableArrangement);
                                  } else {
                                    return NewCheck(
                                      text: "Расставить столы на равном расстоянии от диванов",
                                      value: state.checkboxStates['tableArrangement'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'tableArrangement',
                                      enabled: enabled,
                                    );
                                  }
                                },
                              ),
                            ),
                            BlocProvider<PhotoBloc>(
                              create: (context) => photoBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<PhotoBloc, PhotoState>(
                                builder: (context, state) {
                                  return NewPhoto(
                                    photoBloc: photoBloc,
                                    photoId: 'tableArrangementPhoto',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            CommentWorker(
                              commentValue: commentTableArrangment,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorTableArrangment,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if (enabled == false){
                                    return ShowCheck(
                                        text: 'Протереть стоы во всех местах',
                                        value: wipeTheTables);
                                  }
                                  return NewCheck(
                                    text: "Протереть столы во всех местах",
                                    value: state.checkboxStates['wipeTheTables'] ?? false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'wipeTheTables',
                                    enabled: enabled,
                                  );
                                },
                              ),
                            ),
                            BlocProvider<PhotoBloc>(
                              create: (context) => photoBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<PhotoBloc, PhotoState>(
                                builder: (context, state) {
                                  return NewPhoto(
                                    photoBloc: photoBloc,
                                    photoId: 'wipeTheTablesPhoto',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            CommentWorker(
                              commentValue: commentWipeTheTables,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorWipeTheTables,
                            ),
                            const SizedBox(height: 20),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Осмотреть зал на предмет мелкого мусора. При необходимости убрать',
                                        value: inspectionOfTheHall);
                                  } else {
                                    return NewCheck(
                                      text: "Осмотреть зал на предмет мелкого мусора. При необходимости убрать",
                                      value: state.checkboxStates['inspectionOfTheHall'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'inspectionOfTheHall',
                                      enabled: enabled,
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            BlocProvider<PhotoBloc>(
                              create: (context) => photoBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<PhotoBloc, PhotoState>(
                                builder: (context, state) {
                                  return NewPhoto(
                                    photoBloc: photoBloc,
                                    photoId: 'inspectionOfTheHallPhoto',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            CommentWorker(
                              commentValue: commentInspectionOfTheHall,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorInspectionOfTheHall,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Расставить ровна все пуфики',
                                        value: arrangeOttomans);
                                  } else {
                                    return NewCheck(
                                      text: "Расставить ровно все пуфики",
                                      value: state.checkboxStates['arrangeOttomans'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'arrangeOttomans',
                                      enabled: enabled,
                                    );
                                  }
                                },
                              ),
                            ),
                            BlocProvider<PhotoBloc>(
                              create: (context) => photoBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<PhotoBloc, PhotoState>(
                                builder: (context, state) {
                                  return NewPhoto(
                                    photoBloc: photoBloc,
                                    photoId: 'arrangeOttomansPhoto',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            CommentWorker(
                              commentValue: commentArrangeOttomans,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorArrangeOttomans,
                            ),
                            const SizedBox(height: 20),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Выставить все ровно на столах: салфетницы справа от кнопки, свечи слева от кнопки и крейзи меню слева от свечи',
                                        value: putEverythingOnTheTables);
                                  } else {
                                    return NewCheck(
                                      text:
                                      "Выставить всё ровно на столах: салфетницы справа от кнопки, свечи слева от кнопки и крейзи меню слева от свечи",
                                      value: state.checkboxStates['putEverythingOnTheTables'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'putEverythingOnTheTables',
                                      enabled: enabled,
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            BlocProvider<PhotoBloc>(
                              create: (context) => photoBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<PhotoBloc, PhotoState>(
                                builder: (context, state) {
                                  return NewPhoto(
                                    photoBloc: photoBloc,
                                    photoId: 'putEverythingOnTheTablesPhoto',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            CommentWorker(
                              commentValue: commentPutEverithingOnTheTables,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorPutEverithingOnTheTables,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Протереть все крейзи меню и меню бара',
                                        value: wipeMenu);
                                  } else {
                                    return NewCheck(
                                      text: "Протереть все крейзи меню и меню бара",
                                      value: state.checkboxStates['wipeMenu'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'wipeMenu',
                                      enabled: enabled,
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            BlocProvider<PhotoBloc>(
                              create: (context) => photoBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<PhotoBloc, PhotoState>(
                                builder: (context, state) {
                                  return NewPhoto(
                                    photoBloc: photoBloc,
                                    photoId: 'wipeMenuPhoto',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            CommentWorker(
                              commentValue: commentWipeMenu,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorWipeMenu,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Протереть винный шкаф',
                                        value: cleanWineCabinet);
                                  } else {
                                    return NewCheck(
                                      text: "Протереть винный шкаф",
                                      value: state.checkboxStates['cleanWineCabinet'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'cleanWineCabinet',
                                      enabled: enabled,
                                    );
                                  }
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentCleanWineCabinet,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorCleanWineCabinet,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Заполнить все салфетницы',
                                        value: fillTheNapkinHolder);
                                  } else {
                                    return NewCheck(
                                      text: "Заполнить все салфетницы",
                                      value: state.checkboxStates['fillTheNapkinHolder'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'fillTheNapkinHolder',
                                      enabled: enabled,
                                    );
                                  }
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentFillTheNapkinHolder,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorFillTheNapkinHolder,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Ведерко для мусора должно быть пустым',
                                        value: garbageEmpty);
                                  } else {
                                    return NewCheck(
                                      text: "Ведерко для мусора должно быть пустым",
                                      value: state.checkboxStates['garbageEmpty'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'garbageEmpty',
                                      enabled: enabled,
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommentWorker(
                              commentValue: commentGarbageEmpty,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorGarbageEmpty,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Передать посуду на кухне',
                                        value: passDishesKitchen);
                                  }
                                  return NewCheck(
                                    text: "Передать посуду на кухню",
                                    value: state.checkboxStates['passDishesKitchen'] ?? false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'passDishesKitchen',
                                    enabled: enabled,
                                  );
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentPassDishesKitchen,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorPassDishesKitchen,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Зарпосить стоп-лист и старт-лист по кухне и бару',
                                        value: requestStartAndStopList);
                                  } else {
                                    return NewCheck(
                                      text: "Запросить стоп-лист и старт-лист по кухне и бару",
                                      value: state.checkboxStates['requestStartAndStopList'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'requestStartAndStopList',
                                      enabled: enabled,
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommentWorker(
                              commentValue: commentRequestStartAndStopList,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorRequestStartAndStopList,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Протереть хьюмидор',
                                        value: cleanHumidor);
                                  } else {
                                    return NewCheck(
                                      text: "Протереть хьюмидор",
                                      value: state.checkboxStates['cleanHumidor'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'cleanHumidor',
                                      enabled: enabled,
                                    );
                                  }
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentCleanHumidor,
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorCleanHumidor,
                            ),
                          ],
                        ),
                      ),
                      Center(
                          child: enabled == true ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () async {
                          final photostate = photoBloc.state;

                          final tableArrangementPhoto = photostate.photoStates['tableArrangementPhoto'];
                          if (tableArrangementPhoto != null) {
                            tableArrangementPath = tableArrangementPhoto.path;
                          }

                          final wipeTheTablesPhoto = photostate.photoStates['wipeTheTablesPhoto'];
                          if (wipeTheTablesPhoto != null) {
                            wipeTheTablesPath = wipeTheTablesPhoto.path;
                          }

                          final inspectionOfTheHallPhoto = photostate.photoStates['inspectionOfTheHallPhoto'];
                          if (inspectionOfTheHallPhoto != null) {
                            inspectionOfTheHallPath = inspectionOfTheHallPhoto.path;
                          }

                          final arrangeOttomansPhoto = photostate.photoStates['arrangeOttomansPhoto'];
                          if (arrangeOttomansPhoto != null) {
                            arrangeOttomansPath = arrangeOttomansPhoto.path;
                          }

                          final putEverythingOnTheTablesPhoto = photostate.photoStates['putEverythingOnTheTablesPhoto'];
                          if (putEverythingOnTheTablesPhoto != null) {
                            putEverythingOnTheTablesPath = putEverythingOnTheTablesPhoto.path;
                          }

                          final wipeMenuPhoto = photostate.photoStates['wipeMenuPhoto'];
                          if (wipeMenuPhoto != null) {
                            wipeMenuPath = wipeMenuPhoto.path;
                          }

                          DateTime now = DateTime.now();
                          String date = '${now.year}-${now.month}-${now.day}';
                          String time = '${now.hour}:${now.minute}:${now.second}';
                          final state = checkboxBloc.state;
                          tableArrangement = state.checkboxStates['tableArrangement'] ?? false;
                          wipeTheTables = state.checkboxStates['wipeTheTables'] ?? false;
                          inspectionOfTheHall = state.checkboxStates['inspectionOfTheHall'] ?? false;
                          arrangeOttomans = state.checkboxStates['arrangeOttomans'] ?? false;
                          putEverythingOnTheTables = state.checkboxStates['putEverythingOnTheTables'] ?? false;
                          wipeMenu = state.checkboxStates['wipeMenu'] ?? false;
                          cleanWineCabinet = state.checkboxStates['cleanWineCabinet'] ?? false;
                          fillTheNapkinHolder = state.checkboxStates['fillTheNapkinHolder'] ?? false;
                          garbageEmpty = state.checkboxStates['garbageEmpty'] ?? false;
                          passDishesKitchen = state.checkboxStates['passDishesKitchen'] ?? false;
                          requestStartAndStopList = state.checkboxStates['requestStartAndStopList'] ?? false;
                          cleanHumidor = state.checkboxStates['cleanHumidor'] ?? false;

                          await Api().waiterBegin(
                              date,
                              time,
                              tableArrangement,
                              tableArrangementPath,
                              commentTableArrangment.text,
                              commentDirectorTableArrangment,
                              wipeTheTables,
                              wipeTheTablesPath,
                              commentWipeTheTables.text,
                              commentDirectorWipeTheTables,
                              inspectionOfTheHall,
                              inspectionOfTheHallPath,
                              commentInspectionOfTheHall.text,
                              commentDirectorInspectionOfTheHall,
                              arrangeOttomans,
                              arrangeOttomansPath,
                              commentArrangeOttomans.text,
                              commentDirectorArrangeOttomans,
                              putEverythingOnTheTables,
                              putEverythingOnTheTablesPath,
                              commentPutEverithingOnTheTables.text,
                              commentDirectorPutEverithingOnTheTables,
                              wipeMenu,
                              wipeMenuPath,
                              commentWipeMenu.text,
                              commentDirectorWipeMenu,
                              cleanWineCabinet,
                              commentCleanWineCabinet.text,
                              commentDirectorCleanWineCabinet,
                              fillTheNapkinHolder,
                              commentFillTheNapkinHolder.text,
                              commentDirectorFillTheNapkinHolder,
                              garbageEmpty,
                              commentGarbageEmpty.text,
                              commentDirectorGarbageEmpty,
                              passDishesKitchen,
                              commentPassDishesKitchen.text,
                              commentDirectorPassDishesKitchen,
                              requestStartAndStopList,
                              commentRequestStartAndStopList.text,
                              commentDirectorRequestStartAndStopList,
                              cleanHumidor,
                              commentCleanHumidor.text,
                              commentDirectorCleanHumidor,
                              idUser);
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
                      ): const SizedBox(height: 0,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
