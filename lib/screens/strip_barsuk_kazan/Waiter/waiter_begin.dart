import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/connection/database.dart';
import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';

class waiter_begin extends StatelessWidget {
  waiter_begin({super.key});

  CheckboxBloc checkboxBloc = CheckboxBloc();

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
  String? commentDirectorPassDishesKitchen;
  String? commentDirectorRequestStartAndStopList;
  String? commentDirectorCleanHumidor;


  var db = Mysql();

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.fromLTRB(26, 31.5, 0, 62),
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
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Расставить столы на равном расстоянии от диванов",
                                    value: state.checkboxStates['tableArrangement'] ??
                                        false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'tableArrangement',
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(commentValue: commentTableArrangment, onChanged: (value){
                              commentTableArrangment = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorTableArrangment,),
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
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(commentValue: commentWipeTheTables,onChanged: (value){
                              commentWipeTheTables = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorWipeTheTables,),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text:
                                        "Осмотреть зал на предмет мелкого мусора. При необходимости убрать",
                                    value: state.checkboxStates['inspectionOfTheHall'] ?? false,
                                    checkboxBloc:checkboxBloc,
                                    checkboxId: 'inspectionOfTheHall',
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(
                                commentValue: commentInspectionOfTheHall,onChanged: (value){
                              commentInspectionOfTheHall = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorInspectionOfTheHall,),
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
                                    checkboxBloc:
                                        checkboxBloc,
                                    checkboxId: 'arrangeOttomans',
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(commentValue: commentArrangeOttomans, onChanged: (value){
                              commentArrangeOttomans = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorArrangeOttomans,),
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
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(commentValue: commentPutEverithingOnTheTables, onChanged: (value){
                              commentPutEverithingOnTheTables = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorPutEverithingOnTheTables,),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Протереть все крейзи меню и меню бара",
                                    value: state.checkboxStates['wipeMenu'] ?? false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'wipeMenu',
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(commentValue: commentWipeMenu,onChanged: (value){
                              commentWipeMenu = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorWipeMenu,),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Протереть винный шкаф",
                                    value: state.checkboxStates[
                                            'cleanWineCabinet'] ??
                                        false,
                                    checkboxBloc:
                                        checkboxBloc,
                                    checkboxId: 'cleanWineCabinet',
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(
                                commentValue: commentCleanWineCabinet, onChanged: (value){
                              commentCleanWineCabinet = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorCleanWineCabinet,),
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
                                    checkboxBloc:
                                        checkboxBloc,
                                    checkboxId: 'fillTheNapkinHolder',
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(
                                commentValue: commentFillTheNapkinHolder, onChanged: (value){
                              commentFillTheNapkinHolder = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorFillTheNapkinHolder,),
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
                                    checkboxBloc:
                                        checkboxBloc,
                                    checkboxId: 'garbageEmpty',
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(commentValue: commentGarbageEmpty),
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
                                    checkboxBloc:
                                       checkboxBloc,
                                    checkboxId: 'passDishesKitchen',
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(
                                commentValue: commentPassDishesKitchen, onChanged: (value){
                              commentPassDishesKitchen = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorPassDishesKitchen,),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Запросить стоп-лист и старт-лист по кухне и бару",
                                    value: state.checkboxStates['requestStartAndStopList'] ?? false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'requestStartAndStopList',
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(commentValue: commentRequestStartAndStopList, onChanged: (value){
                              commentRequestStartAndStopList = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorRequestStartAndStopList,),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Протереть хьюмидор",
                                    value: state.checkboxStates['cleanHumidor'] ?? false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'cleanHumidor',
                                  );
                                },
                              ),
                            ),
                            /// ФОТО
                            CommentWorker(commentValue: commentCleanHumidor, onChanged: (value){
                              commentCleanHumidor = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorCleanHumidor,),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                            // group167uy (231:53)
                            width: double.infinity,
                            height: 51,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 100),
                                textStyle: const TextStyle(fontSize: 20),
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                DateTime now = DateTime.now().toUtc();
                                DateTime date = DateTime(now.year, now.month, now.day).toUtc();
                                DateTime datenow = DateTime(now.year, now.month, now.day, now.hour, now.minute).toUtc();
                                final state = checkboxBloc.state;

                                final tableArrangement = state.checkboxStates['tableArrangement'] ?? false;
                                final wipeTheTables = state.checkboxStates['wipeTheTables'] ?? false;
                                final chargeRadioTerminalTelephone = state.checkboxStates['chargeRadioTerminalTelephone'] ?? false;
                                final cleanlinessWorkplaceHost = state.checkboxStates['cleanlinessWorkplaceHost'] ?? false;
                                final chargeRadioTerminalTelephone = state.checkboxStates['chargeRadioTerminalTelephone'] ?? false;
                                final cleanlinessWorkplaceHost = state.checkboxStates['cleanlinessWorkplaceHost'] ?? false;
                                final chargeRadioTerminalTelephone = state.checkboxStates['chargeRadioTerminalTelephone'] ?? false;
                                final cleanlinessWorkplaceHost = state.checkboxStates['cleanlinessWorkplaceHost'] ?? false;
                                final chargeRadioTerminalTelephone = state.checkboxStates['chargeRadioTerminalTelephone'] ?? false;
                                final cleanlinessWorkplaceHost = state.checkboxStates['cleanlinessWorkplaceHost'] ?? false;
                                final chargeRadioTerminalTelephone = state.checkboxStates['chargeRadioTerminalTelephone'] ?? false;
                                final cleanlinessWorkplaceHost = state.checkboxStates['cleanlinessWorkplaceHost'] ?? false;















                                db.getConnection().then((conn) {
                                  conn.query(
                                      'INSERT INTO WaiterBegin_StripBarsukKazan (Date,DateTime,TableArrangement,Comment_TableArrangment,CommentDirector_TableArrangment,               ,Users_idUsers) VALUES (?, ?, ?, ?, ?, ?,?,?,?,?)',
                                      [
                                        date,
                                        datenow,
                                        tableArrangement,
                                        commentTableArrangment,
                                        commentDirectorTableArrangment,





                                        '4'
                                      ]).then((results) {
                                    print('${results}');
                                  });
                                });







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
