import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';

import '../../../component/photo/bloc/photo_bloc.dart';
import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';
import '../../../connection/database.dart';

class host_end extends StatelessWidget {
  host_end({Key? key});


  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();

  String commentChargeRadioTerminalTelephone = '';
  String commentCleanlinessWorkplaceHost = '';

  String? commentDirectorChargeRadioTerminalTelephone;
  String? commentDirectorCleanlinessWorkplaceHost;

  var db = Mysql();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // frame5Sco (207:23)
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
                                  'Привет Хостес',
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
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text:
                                      "Поставить на зарядку рацию, терминал, телефон",
                                  value: state.checkboxStates['chargeRadioTerminalTelephone'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'chargeRadioTerminalTelephone',
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommentWorker(
                              commentValue:
                                  commentChargeRadioTerminalTelephone,
                            onChanged: (value) {
                                commentChargeRadioTerminalTelephone = value!;
                                },),
                          const SizedBox(
                            height: 20,
                          ),
                          CommentDirector(valueDirector: commentDirectorChargeRadioTerminalTelephone,),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            // BlocBuilder(builder: builder)
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: "Навести порядок на рабочем месте",
                                  value: state.checkboxStates['cleanlinessWorkplaceHost'] ?? false,
                                  checkboxBloc:checkboxBloc,
                                  checkboxId: 'cleanlinessWorkplaceHost',
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
                                  photoId: 'cleanlinessWorkplaceHostPhoto',
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommentWorker(
                              commentValue: commentCleanlinessWorkplaceHost,onChanged: (value) {
                                commentCleanlinessWorkplaceHost = value!;
                                },),
                          const SizedBox(
                            height: 20,
                          ),
                          CommentDirector(
                            valueDirector:
                                commentDirectorCleanlinessWorkplaceHost,
                          ),
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
                            final photostate = photoBloc.state;
                            final cleanlinessWorkplaceHostPhoto = photostate
                                .photoStates['cleanlinessWorkplaceHostPhoto'];

                              List<int> cleanlinessWorkplaceHostPhotoBLOB =
                                  File(cleanlinessWorkplaceHostPhoto!.path).readAsBytesSync();

                              DateTime now = DateTime.now().toUtc();
                              DateTime date = DateTime(now.year, now.month, now.day).toUtc();
                              DateTime datenow = DateTime(now.year, now.month, now.day, now.hour, now.minute).toUtc();
                              final state = checkboxBloc.state;
                              final chargeRadioTerminalTelephone = state.checkboxStates['chargeRadioTerminalTelephone'] ?? false;
                              final cleanlinessWorkplaceHost = state.checkboxStates['cleanlinessWorkplaceHost'] ?? false;
                              db.getConnection().then((conn) {
                                conn.query(
                                    'INSERT INTO HostEnd_StripBarsukKazan (Date,DateTime,ChargerRadioTerminalTelephone,Comment_ChargerRadioTerminalTelephone,CommentDirector_ChargerRadioTerminalTelephone,'
                                        'CleanWorkplace,WorkplacePhoto,Comment_Workplace,CommentDirector_Workplace,Users_idUsers) VALUES (?, ?, ?, ?, ?, ?,?,?,?,?)',
                                    [
                                      date,
                                      datenow,
                                      chargeRadioTerminalTelephone,
                                      commentChargeRadioTerminalTelephone,
                                      commentDirectorChargeRadioTerminalTelephone,
                                      cleanlinessWorkplaceHost,
                                      cleanlinessWorkplaceHostPhotoBLOB,
                                      commentCleanlinessWorkplaceHost,
                                      commentDirectorCleanlinessWorkplaceHost,
                                      '1'
                                    ]).then((results) {
                                  print('${results}');
                                });
                                print(commentChargeRadioTerminalTelephone);
                                print(commentCleanlinessWorkplaceHost);
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
            ),
          ),
        ]),
      ),
    );
  }
}
