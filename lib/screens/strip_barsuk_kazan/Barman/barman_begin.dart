import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mysql1/mysql1.dart';
import '../../../component/Forms.dart';
import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';
import '../../../component/photo/bloc/photo_bloc.dart';
import '../../../component/photo/photo.dart';
import 'barman_end.dart';
import '../../../connection/database.dart';

class barman_begin extends StatelessWidget {

  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();

  DateTime now = DateTime.now();

  String commentOpenCheckout = '';
  String commentCheckAndTakeAlcogol = '';
  String commentExtractorHumidifier = '';
  String commentWriteStopList = '';
  String commentRubTheDishes = '';
  String commentCleaning = '';

  String? commentDirectorOpenCheckout;
  String? commentDirectorCheckAndTakeAlcogol;
  String? commentDirectorExtractorHumidifier;
  String? commentDirectorWriteStopList;
  String? commentDirectorRubTheDishes;
  String? commentDirectorCleaning;

  var db = Mysql();

  barman_begin({super.key});

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
                                'Привет Бармен',
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
                          create: (context) => CheckboxBloc(),
                          child: BlocBuilder<CheckboxBloc, CheckboxState>(
                            builder: (context, state) {
                              return NewCheck(
                                  text: "Открыть кассовую смену",
                                  value: state
                                      .checkboxStates['openCheckout'] ??
                                      false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'openCheckout');
                            },
                          ),
                        ),
                        CommentWorker(commentValue: commentOpenCheckout,
                          onChanged: (value) {
                            commentOpenCheckout = value!;
                          },),
                        CommentDirector(
                          valueDirector: commentDirectorOpenCheckout,),

                        BlocProvider<CheckboxBloc>(
                          create: (context) => CheckboxBloc(),
                          child: BlocBuilder<CheckboxBloc, CheckboxState>(
                            builder: (context, state) {
                              return NewCheck(
                                text: "Проверить и принять алкоголь",
                                value: state
                                    .checkboxStates['checkAndTakeAlcogol'] ??
                                    false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'checkAndTakeAlcogol',);
                            },
                          ),
                        ),
                        BlocProvider<PhotoBloc>(
                          create: (context) => photoBloc,
                          child: BlocBuilder<PhotoBloc, PhotoState>(
                            builder: (context, state) {
                              return NewPhoto(
                                photoBloc: photoBloc,
                                photoId: 'checkAndTakeAlcogolPhoto',);
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        CommentWorker(commentValue: commentCheckAndTakeAlcogol,
                          onChanged: (value) {
                            commentCheckAndTakeAlcogol = value!;
                          },),
                        CommentDirector(
                          valueDirector: commentDirectorCheckAndTakeAlcogol,),

                        BlocProvider<CheckboxBloc>(
                          create: (context) => CheckboxBloc(),
                          child: BlocBuilder<CheckboxBloc, CheckboxState>(
                            builder: (context, state) {
                              return NewCheck(
                                text: "Включить вытяжку и увлажнитель",
                                value: state
                                    .checkboxStates['extractorHumidifier'] ??
                                    false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'extractorHumidifier',);
                            },
                          ),
                        ),
                        CommentWorker(commentValue: commentExtractorHumidifier,
                          onChanged: (value) {
                            commentCheckAndTakeAlcogol = value!;
                          },),
                        CommentDirector(
                          valueDirector: commentDirectorExtractorHumidifier,),

                        BlocProvider<CheckboxBloc>(
                          create: (context) => CheckboxBloc(),
                          child: BlocBuilder<CheckboxBloc, CheckboxState>(
                            builder: (context, state) {
                              return NewCheck(
                                text: "Написать стоп-лист",
                                value: state.checkboxStates['writeStopList'] ??
                                    false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'writeStopList',);
                            },
                          ),
                        ),
                        CommentWorker(commentValue: commentWriteStopList,
                          onChanged: (value) {
                            commentWriteStopList = value!;
                          },),
                        CommentDirector(
                          valueDirector: commentDirectorWriteStopList,),
                        BlocProvider<CheckboxBloc>(
                          create: (context) => CheckboxBloc(),
                          child: BlocBuilder<CheckboxBloc, CheckboxState>(
                            builder: (context, state) {
                              return NewCheck(
                                text: "Натереть посуду",
                                value: state.checkboxStates['rubTheDishes'] ??
                                    false,
                                checkboxBloc: checkboxBloc,
                                checkboxId: 'rubTheDishes',);
                            },
                          ),
                        ),
                        BlocProvider<PhotoBloc>(
                          create: (context) => PhotoBloc(),
                          child: BlocBuilder<PhotoBloc, PhotoState>(
                            builder: (context, state) {
                              return NewPhoto(
                                photoBloc:
                                photoBloc,
                                photoId: 'rubTheDishesPhoto',);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommentWorker(commentValue: commentRubTheDishes,
                          onChanged: (value) {
                            commentRubTheDishes = value!;
                          },),
                        CommentDirector(
                          valueDirector: commentDirectorRubTheDishes,),

                        if (now.weekday == DateTime.sunday)
                          Column(
                            children: [
                              BlocProvider<CheckboxBloc>(
                                create: (context) => CheckboxBloc(),
                                child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                  builder: (context, state) {
                                    return NewCheck(
                                      text: "Уборка",
                                      value: state.checkboxStates['cleaning'] ??
                                          false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'cleaning',
                                    );
                                  },
                                ),
                              ),
                              BlocProvider<PhotoBloc>(
                                create: (context) => PhotoBloc(),
                                child: BlocBuilder<PhotoBloc, PhotoState>(
                                  builder: (context, state) {
                                    return NewPhoto(
                                      photoBloc: photoBloc,
                                      photoId: 'cleaningPhoto',
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CommentWorker(
                                commentValue: commentCleaning,
                                onChanged: (value) {
                                  commentCleaning = value!;
                                },
                              ),
                              CommentDirector(
                                  valueDirector: commentDirectorCleaning),
                            ],
                          )
                        else
                          const SizedBox(height: 0)

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
                    final checkAndTakeAlcogolPhoto = photostate.photoStates['checkAndTakeAlcogolPhoto'];
                    final rubTheDishesPhoto = photostate.photoStates['rubTheDishesPhoto'];
                    final cleaningPhoto = photostate.photoStates['cleaningPhoto'];

                    List<int> checkAndTakeAlcogolPhotoBLOB = File(checkAndTakeAlcogolPhoto!.path).readAsBytesSync();

                    List<int> rubTheDishesPhotoBLOB = File(rubTheDishesPhoto!.path).readAsBytesSync();

                    List<int> cleaningPhotoBLOB = File(cleaningPhoto!.path).readAsBytesSync();

                    DateTime now = DateTime.now().toUtc();
                    DateTime date = DateTime(now.year, now.month, now.day).toUtc();
                    DateTime datenow = DateTime(now.year, now.month, now.day, now.hour, now.minute).toUtc();
                    final state = checkboxBloc.state;
                    final openCheckout = state.checkboxStates['openCheckout'] ?? false;
                    final checkAndTakeAlcogol = state.checkboxStates['checkAndTakeAlcogol'] ?? false;
                    final extractorHumidifier = state.checkboxStates['extractorHumidifier'] ?? false;
                    final writeStopList = state.checkboxStates['writeStopList'] ?? false;
                    final rubTheDishes = state.checkboxStates['rubTheDishes'] ?? false;
                    final cleaning = state.checkboxStates['cleaning'] ?? false;


                    db.getConnection().then((conn) {
                      conn.query(
                          'INSERT INTO BarmanBegin_StripBarsukKazan (Date,DateTime,OpenCheckout,Comment_OpenCheckout,CommentDirector_OpenCheckout,CheckAndTakeAlcogol,CheckAndTakeAlcogolPhotoBLOB,'
                              'Comment_CheckAndTakeAlcogol,CommentDirector_CheckAndTakeAlcogol,ExtractorHumidifier,Comment_ExtractorHumidifier,CommentDirector_ExtractorHumidifier,WriteStopList,'
                              'Comment_WriteStopList, CommentDirector_WriteStopList,  RubTheDishes,RubTheDishesPhotoBLOB,Comment_RubTheDishes,CommentDirector_RubTheDishes,Cleaning,CleaningPhotoBLOB,Comment_Cleaning,CommentDirector_Cleaning, Users_idUsers) '
                              'VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
                          [
                            date,
                            datenow,
                            openCheckout,
                            commentOpenCheckout,
                            commentDirectorOpenCheckout,
                            checkAndTakeAlcogol,
                            checkAndTakeAlcogolPhotoBLOB,
                            commentCheckAndTakeAlcogol,
                            commentDirectorCheckAndTakeAlcogol,
                            extractorHumidifier,
                            commentExtractorHumidifier,
                            commentDirectorExtractorHumidifier,
                            writeStopList,
                            commentWriteStopList,
                            commentDirectorWriteStopList,
                            rubTheDishes,
                            rubTheDishesPhotoBLOB,
                            commentRubTheDishes,
                            commentDirectorRubTheDishes,
                            cleaning,
                            cleaningPhotoBLOB,
                            commentCleaning,
                            commentDirectorCleaning,
                            '3'
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
    ),
    ),
  ],
    ),
    ),
    );
  }
}
