import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/bloc/photo_bloc.dart';
import 'package:test_form/component/photo/photo.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Waiter/waiter.dart';
import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';

class Waiter_begin extends StatelessWidget {
  Waiter_begin({super.key});

  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();

  String? tableArrangementPath = null;
  String? wipeTheTablesPath = null;
  String? inspectionOfTheHallPath = null;
  String? arrangeOttomansPath = null;
  String? putEverythingOnTheTablesPath = null;
  String? wipeMenuPath = null;

  String commentTableArrangment = '';
  String commentWipeTheTables = '';
  String commentInspectionOfTheHall = '';
  String commentArrangeOttomans = '';
  String commentPutEverithingOnTheTables = '';
  String commentWipeMenu = '';
  String commentCleanWineCabinet = '';
  String commentFillTheNapkinHolder = '';
  String commentGarbageEmpty = '';
  String commentPassDishesKitchen = '';
  String commentRequestStartAndStopList = '';
  String commentCleanHumidor = '';

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

  bool readOnly = false;
  bool enabled = true;

  // var db = Mysql();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = '${now.year}-${now.month}-${now.day}';
    final response = Api().showWaiterBegin(date);
    if (response != null){
      readOnly = true;
      enabled = false;
    }
    return Scaffold(
      body: Container(
        // frame5Sco (207:23)
        width: 400,
        height: double.infinity,
        child: Column(
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
                    // appbar7Yb (207:165)
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
                          // group5Pm1 (207:166)
                          margin: const EdgeInsets.fromLTRB(0, 6.58, 67, 12.74),
                          width: 173,
                          height: double.infinity,
                          child: Container(
                            // autogroupc5usX6X (Qd8Af2EBZv8YZ9YRmLC5Us)
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
                                    'Привет Официант',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                const Text(
                                  // 6oq (207:28)
                                  'сегодня',
                                  style: TextStyle(
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
                'Смена:',
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
                            Container(
                              // autogroupssnkLeB (Qd7tBVgL7cMFvwHZ7FsSNK)
                              // padding:const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              width: double.infinity,
                              child: Container(
                                // ANK (211:310)
                                child: const Text(
                                  'Порядок в зале:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text:
                                        "Расставить столы на равном расстоянии от диванов",
                                    value: state.checkboxStates[
                                            'tableArrangement'] ??
                                        false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'tableArrangement',
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
                                    photoId: 'tableArrangementPhoto',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            CommentWorker(
                              commentValue: commentTableArrangment,
                              onChanged: (value) {
                                commentTableArrangment = value!;
                              },
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorTableArrangment,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Протереть столы во всех местах",
                                    value:
                                        state.checkboxStates['wipeTheTables'] ??
                                            false,
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
                              onChanged: (value) {
                                commentWipeTheTables = value!;
                              },
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorWipeTheTables,
                            ),
                            const SizedBox(height: 20),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text:
                                        "Осмотреть зал на предмет мелкого мусора. При необходимости убрать",
                                    value: state.checkboxStates[
                                            'inspectionOfTheHall'] ??
                                        false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'inspectionOfTheHall',
                                    enabled: enabled,
                                  );
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
                              onChanged: (value) {
                                commentInspectionOfTheHall = value!;
                              },
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorInspectionOfTheHall,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Расставить ровно все пуфики",
                                    value: state.checkboxStates[
                                            'arrangeOttomans'] ??
                                        false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'arrangeOttomans',
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
                                    photoId: 'arrangeOttomansPhoto',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            CommentWorker(
                              commentValue: commentArrangeOttomans,
                              onChanged: (value) {
                                commentArrangeOttomans = value!;
                              },
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
                                  return NewCheck(
                                    text:
                                        "Выставить всё ровно на столах: салфетницы справа от кнопки, свечи слева от кнопки и крейзи меню слева от свечи",
                                    value: state.checkboxStates[
                                            'putEverythingOnTheTables'] ??
                                        false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'putEverythingOnTheTables',
                                    enabled: enabled,
                                  );
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
                              onChanged: (value) {
                                commentPutEverithingOnTheTables = value!;
                              },
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector:
                                  commentDirectorPutEverithingOnTheTables,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text:
                                        "Протереть все крейзи меню и меню бара",
                                    value: state.checkboxStates['wipeMenu'] ??
                                        false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'wipeMenu',
                                    enabled: enabled,
                                  );
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
                              onChanged: (value) {
                                commentWipeMenu = value!;
                              },
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorWipeMenu,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Протереть винный шкаф",
                                    value: state.checkboxStates[
                                            'cleanWineCabinet'] ??
                                        false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'cleanWineCabinet',
                                    enabled: enabled,
                                  );
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentCleanWineCabinet,
                              onChanged: (value) {
                                commentCleanWineCabinet = value!;
                              },
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorCleanWineCabinet,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Заполнить все салфетницы",
                                    value: state.checkboxStates[
                                            'fillTheNapkinHolder'] ??
                                        false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'fillTheNapkinHolder',
                                    enabled: enabled,
                                  );
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentFillTheNapkinHolder,
                              onChanged: (value) {
                                commentFillTheNapkinHolder = value!;
                              },
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
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text:
                                        "Ведерко для мусора должно быть пустым",
                                    value:
                                        state.checkboxStates['garbageEmpty'] ??
                                            false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'garbageEmpty',
                                    enabled: enabled,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommentWorker(
                              commentValue: commentGarbageEmpty,
                              onChanged: (value) {
                                commentGarbageEmpty = value!;
                              },
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorGarbageEmpty,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Передать посуду на кухню",
                                    value: state.checkboxStates[
                                            'passDishesKitchen'] ??
                                        false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'passDishesKitchen',
                                    enabled: enabled,
                                  );
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentPassDishesKitchen,
                              onChanged: (value) {
                                commentPassDishesKitchen = value!;
                              },
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
                                  return NewCheck(
                                    text:
                                        "Запросить стоп-лист и старт-лист по кухне и бару",
                                    value: state.checkboxStates[
                                            'requestStartAndStopList'] ??
                                        false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'requestStartAndStopList',
                                    enabled: enabled,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommentWorker(
                              commentValue: commentRequestStartAndStopList,
                              onChanged: (value) {
                                commentRequestStartAndStopList = value!;
                              },
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector:
                                  commentDirectorRequestStartAndStopList,
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Протереть хьюмидор",
                                    value:
                                        state.checkboxStates['cleanHumidor'] ??
                                            false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'cleanHumidor',
                                    enabled: enabled,
                                  );
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentCleanHumidor,
                              onChanged: (value) {
                                commentCleanHumidor = value!;
                              },
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(
                              valueDirector: commentDirectorCleanHumidor,
                            ),
                          ],
                        ),
                      ),
                      Center(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          final photostate = photoBloc.state;

                          final tableArrangementPhoto = photostate.photoStates['tableArrangementPhoto'];
                          if (tableArrangementPhoto != null) {
                            tableArrangementPath = tableArrangementPhoto.path;
                          }

                          final wipeTheTablesPhoto =
                              photostate.photoStates['wipeTheTablesPhoto'];
                          if (wipeTheTablesPhoto != null) {
                            wipeTheTablesPath = wipeTheTablesPhoto.path;
                          }

                          final inspectionOfTheHallPhoto = photostate
                              .photoStates['inspectionOfTheHallPhoto'];
                          if (inspectionOfTheHallPhoto != null) {
                            inspectionOfTheHallPath =
                                inspectionOfTheHallPhoto.path;
                          }

                          final arrangeOttomansPhoto =
                              photostate.photoStates['arrangeOttomansPhoto'];
                          if (arrangeOttomansPhoto != null) {
                            arrangeOttomansPath = arrangeOttomansPhoto.path;
                          }

                          final putEverythingOnTheTablesPhoto = photostate
                              .photoStates['putEverythingOnTheTablesPhoto'];
                          if (putEverythingOnTheTablesPhoto != null) {
                            putEverythingOnTheTablesPath =
                                putEverythingOnTheTablesPhoto.path;
                          }

                          final wipeMenuPhoto =
                              photostate.photoStates['wipeMenuPhoto'];
                          if (wipeMenuPhoto != null) {
                            wipeMenuPath = wipeMenuPhoto.path;
                          }

                          DateTime now = DateTime.now();
                          String date = '${now.year}-${now.month}-${now.day}';
                          String time =
                              '${now.hour}:${now.minute}:${now.second}';
                          final state = checkboxBloc.state;
                          final tableArrangement =
                              state.checkboxStates['tableArrangement'] ?? false;
                          final wipeTheTables =
                              state.checkboxStates['wipeTheTables'] ?? false;
                          final inspectionOfTheHall =
                              state.checkboxStates['inspectionOfTheHall'] ??
                                  false;
                          final arrangeOttomans =
                              state.checkboxStates['arrangeOttomans'] ?? false;
                          final putEverythingOnTheTables = state
                                  .checkboxStates['putEverythingOnTheTables'] ??
                              false;
                          final wipeMenu =
                              state.checkboxStates['wipeMenu'] ?? false;
                          final cleanWineCabinet =
                              state.checkboxStates['cleanWineCabinet'] ?? false;
                          final fillTheNapkinHolder =
                              state.checkboxStates['fillTheNapkinHolder'] ??
                                  false;
                          final garbageEmpty =
                              state.checkboxStates['garbageEmpty'] ?? false;
                          final passDishesKitchen =
                              state.checkboxStates['passDishesKitchen'] ??
                                  false;
                          final requestStartAndStopList =
                              state.checkboxStates['requestStartAndStopList'] ??
                                  false;
                          final cleanHumidor =
                              state.checkboxStates['cleanHumidor'] ?? false;

                          Api().waiterBegin(
                              date,
                              time,
                              tableArrangement,
                              tableArrangementPath,
                              commentTableArrangment,
                              commentDirectorTableArrangment,
                              wipeTheTables,
                              wipeTheTablesPath,
                              commentWipeTheTables,
                              commentDirectorWipeTheTables,
                              inspectionOfTheHall,
                              inspectionOfTheHallPath,
                              commentInspectionOfTheHall,
                              commentDirectorInspectionOfTheHall,
                              arrangeOttomans,
                              arrangeOttomansPath,
                              commentArrangeOttomans,
                              commentDirectorArrangeOttomans,
                              putEverythingOnTheTables,
                              putEverythingOnTheTablesPath,
                              commentPutEverithingOnTheTables,
                              commentDirectorPutEverithingOnTheTables,
                              wipeMenu,
                              wipeMenuPath,
                              commentWipeMenu,
                              commentDirectorWipeMenu,
                              cleanWineCabinet,
                              commentCleanWineCabinet,
                              commentDirectorCleanWineCabinet,
                              fillTheNapkinHolder,
                              commentFillTheNapkinHolder,
                              commentDirectorFillTheNapkinHolder,
                              garbageEmpty,
                              commentGarbageEmpty,
                              commentDirectorGarbageEmpty,
                              passDishesKitchen,
                              commentPassDishesKitchen,
                              commentDirectorPassDishesKitchen,
                              requestStartAndStopList,
                              commentRequestStartAndStopList,
                              commentDirectorRequestStartAndStopList,
                              cleanHumidor,
                              commentCleanHumidor,
                              commentDirectorCleanHumidor,
                              2);
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
                      )),
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