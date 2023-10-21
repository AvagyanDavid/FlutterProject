import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:test_form/component/Forms.dart';

import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';
import '../../../component/photo/bloc/photo_bloc.dart';
import '../../../component/photo/photo.dart';
import '../../../connection/database.dart';

class Art_end extends StatelessWidget {
  Art_end({super.key});

  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();

  String commentReportCompletedArt = '';
  String commentReportCompleteMarket = '';
  String commentSendReportChat = '';
  String commentOrderDressingRoom = '';

  String? commentDirectorReportCompletedArt;
  String? commentDirectorReportCompleteMarket;
  String? commentDirectorSendReportChat;
  String? commentDirectorOrderDressingRoom;

  var db = Mysql();

  // TextFormField(
  //   decoration:const  InputDecoration(
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(10.0))),
  //     hintText: "Артистка",
  //     fillColor: Colors.white,
  //   ),
  //   minLines: 1,
  //   maxLines: 3,
  //   textInputAction: TextInputAction.next,
  // ),
  // BlocProvider<CheckboxBloc>(
  //   create: (context) => CheckboxBloc(),
  //   child: BlocBuilder<CheckboxBloc, CheckboxState>(
  //     builder: (context, state) {
  //       return NewCheck(
  //           text: " ",
  //           value: availabilityOfAnalyzes,
  //           checkboxBloc: BlocProvider.of<CheckboxBloc>(context));
  //     },
  //   ),
  // ),
  // ]

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
                  // appbar7Yb (207:165)
                  // margin: const EdgeInsets.fromLTRB(0, 0, 0, 4.5),
                  padding: const EdgeInsets.fromLTRB(22, 35.93, 0, 53.58),
                  // width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xff000000),
                  ),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
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
              'Смена:',
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
                          const SizedBox(height: 20),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Заполнить отчет арта',
                                  value:
                                  state.checkboxStates['reportCompletedArt'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'reportCompletedArt',
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentReportCompletedArt,
                            onChanged: (value) {
                              commentReportCompletedArt = value!;
                            },
                          ),
                          CommentDirector(
                            valueDirector: commentDirectorReportCompletedArt,
                          ),
                          SizedBox(height: 20,),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Заполнить отчет маркетолога',
                                  value:
                                  state
                                      .checkboxStates['reportCompleteMarket'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'reportCompleteMarket',
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentReportCompleteMarket,
                            onChanged: (value) {
                              commentReportCompleteMarket = value!;
                            },
                          ),
                          CommentDirector(
                            valueDirector: commentDirectorReportCompleteMarket,
                          ),
                          Container(
                            // autogroupssnkLeB (Qd7tBVgL7cMFvwHZ7FsSNK)
                            // padding:const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: double.infinity,
                            child: Container(
                              // ANK (211:310)
                              child: const Text(
                                'Скинуть все отчеты в чат:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Арт',
                                  value: state.checkboxStates['art'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'art',
                                );
                              },
                            ),
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Бар',
                                  value:
                                  state
                                      .checkboxStates['bar'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'bar',
                                );
                              },
                            ),
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Маркетологи',
                                  value:
                                  state
                                      .checkboxStates['market'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'market',
                                );
                              },
                            ),
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'хостес',
                                  value:
                                  state
                                      .checkboxStates['hostes'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'hostes',
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentSendReportChat,
                            onChanged: (value) {
                              commentSendReportChat = value!;
                            },
                          ),
                          CommentDirector(
                            valueDirector: commentDirectorSendReportChat,
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Проверить порядок в гримерке',
                                  value: state.checkboxStates['orderDressingRoom'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'orderDressingRoom',
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
                                  photoId: 'orderDressingRoomPhoto',
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentOrderDressingRoom,
                            onChanged: (value) {
                              commentOrderDressingRoom = value!;
                            },
                          ),
                          CommentDirector(
                            valueDirector: commentDirectorOrderDressingRoom,
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
                                  final photostate = photoBloc.state;
                                  final orderDressingRoomPhoto = photostate
                                      .photoStates['orderDressingRoomPhoto'];

                                  List<int> orderDressingRoomPhotoBLOB =
                                    File(orderDressingRoomPhoto!.path).readAsBytesSync();

                                  DateTime now = DateTime.now().toUtc();
                                  DateTime date = DateTime(now.year, now.month, now.day).toUtc();
                                  DateTime datenow = DateTime(now.year, now.month, now.day, now.hour, now.minute).toUtc();
                                  final state = checkboxBloc.state;
                                  final reportCompletedArt = state.checkboxStates['reportCompletedArt'] ?? false;
                                  final reportCompleteMarket = state.checkboxStates['reportCompleteMarket'] ?? false;
                                  final art = state.checkboxStates['art'] ?? false;
                                  final bar = state.checkboxStates['bar'] ?? false;
                                  final market = state.checkboxStates['market'] ?? false;
                                  final hostes = state.checkboxStates['hostes'] ?? false;
                                  final orderDressingRoom = state.checkboxStates['orderDressingRoom'] ?? false;

                                  db.getConnection().then((conn) {
                                    conn.query(
                                        'INSERT INTO ArtManagerEnd_StripBarsukKazan (Date,DateTime,ReportCompletedArt,Comment_ReportCompletedArt,CommentDirector_ReportCompletedArt,ReportCompleteMarket,Comment_ReportCompleteMarket,CommentDirector_ReportCompleteMarket,'
                                            'Art,Bar,Market,Hostes,Comment_SendReportChat,CommentDirector_SendReportChat,OrderDressingRoom,OrderDressingRoomPhotoBLOB,Comment_OrderDressingRoom,CommentDirector_OrderDressingRoom,Users_idUsers) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
                                        [
                                          date,
                                          datenow,
                                          reportCompletedArt,
                                          commentReportCompletedArt,
                                          commentDirectorReportCompletedArt,
                                          reportCompleteMarket,
                                          commentReportCompleteMarket,
                                          commentDirectorReportCompleteMarket,
                                          art,
                                          bar,
                                          market,
                                          hostes,
                                          commentSendReportChat,
                                          commentDirectorSendReportChat,
                                          orderDressingRoom,
                                          orderDressingRoomPhotoBLOB,
                                          commentOrderDressingRoom,
                                          commentDirectorOrderDressingRoom,
                                          '2'
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
                              ),
                            ),
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