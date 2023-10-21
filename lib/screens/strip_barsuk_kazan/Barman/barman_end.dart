import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/bloc/photo_bloc.dart';
import 'package:test_form/connection/database.dart';

import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';
import '../../../component/photo/photo.dart';

class barman_end extends StatelessWidget {

  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();

  String commentCleanlinessWorkplace = '';
  String commentCloseShift = '';
  String commentFillOutReport = '';
  String commentApplication = '';

  String? commentDirectorApplication;
  String? commentDirectorFillOutReport;
  String? commentDirectorCloseShift;
  String? commentDirectorCleanlinessWorkplace;

  var db = Mysql();

  barman_end({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // frame5Sco (207:23)a
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
                      // autogroupssnkLeB (Qd7tBVgL7cMFvwHZ7FsSNK)
                      // padding:const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      width: double.infinity,
                      child: Container(
                        // ANK (211:310)
                        child: const Text(
                          'Составить заявку:',
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
                      // BlocBuilder(builder: builder)
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          return NewCheck(
                              text: "Алкоголь",
                              value: state.checkboxStates['alcogol'] ?? false,
                              checkboxBloc:checkboxBloc,
                          checkboxId: 'alcogol',);
                        },
                      ),
                    ),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      // BlocBuilder(builder: builder)
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          return NewCheck(
                              text: "Б/а",
                              value: state.checkboxStates['nonalcogol'] ?? false,
                              checkboxBloc:checkboxBloc,
                          checkboxId: 'nonalcogol',);
                        },
                      ),
                    ),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      // BlocBuilder(builder: builder)
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          return NewCheck(
                              text: "Табак",
                              value: state.checkboxStates['tobacco'] ?? false,
                              checkboxBloc:checkboxBloc,
                          checkboxId: 'tobacco',);
                        },
                      ),
                    ),
                    CommentWorker(commentValue: commentApplication, onChanged: (value){
                      commentApplication = value!;
                    },),
                    CommentDirector(valueDirector: commentDirectorApplication,),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          return NewCheck(
                              text: "Заполнить отчет",
                              value: state.checkboxStates['fillOutReport'] ?? false,
                              checkboxBloc:checkboxBloc,
                          checkboxId: 'fillOutReport',);
                        },
                      ),
                    ),
                    CommentWorker(commentValue: commentFillOutReport, onChanged: (value){
                      commentFillOutReport = value!;
                    },),
                    CommentDirector(valueDirector: commentDirectorFillOutReport,),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      // BlocBuilder(builder: builder)
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          return NewCheck(
                              text: "Закрыть смену",
                              value: state.checkboxStates['closeShift'] ?? false,
                              checkboxBloc:checkboxBloc,
                          checkboxId: 'closeShift',);
                        },
                      ),
                    ),
                    CommentWorker(commentValue: commentCloseShift,onChanged: (value){
                      commentCloseShift = value!;
                    },),
                    CommentDirector(valueDirector: commentDirectorCloseShift,),
                    BlocProvider<CheckboxBloc>(
                      create: (context) => checkboxBloc,
                      // BlocBuilder(builder: builder)
                      child: BlocBuilder<CheckboxBloc, CheckboxState>(
                        builder: (context, state) {
                          return NewCheck(
                              text: "Навести порядок на рабочем месте",
                              value: state.checkboxStates['cleanlinessWorkplace'] ?? false,
                              checkboxBloc:checkboxBloc,
                          checkboxId: 'cleanlinessWorkplace',);
                        },
                      ),
                    ),
                    BlocProvider<PhotoBloc>(
                      create: (context) => photoBloc,
                      child: BlocBuilder<PhotoBloc, PhotoState>(
                        builder: (context, state) {
                          return NewPhoto(
                            photoBloc: photoBloc,
                            photoId: 'cleanlinessWorkplacePhoto',);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentWorker(commentValue: commentCleanlinessWorkplace,
                      onChanged:(value){
                        commentCleanlinessWorkplace= value!;
                      },
                      ),
                    CommentDirector(valueDirector: commentDirectorCleanlinessWorkplace,),
                    const SizedBox(
                      height: 20,
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
                          final cleanlinessWorkplacePhoto = photostate.photoStates['cleanlinessWorkplacePhoto'];

                          List<int> cleanlinessWorkplacePhotoBLOB = File(cleanlinessWorkplacePhoto!.path).readAsBytesSync();

                          DateTime now = DateTime.now().toUtc();
                          DateTime date = DateTime(now.year, now.month, now.day).toUtc();
                          DateTime datenow = DateTime(now.year, now.month, now.day, now.hour, now.minute).toUtc();
                          final state = checkboxBloc.state;
                          final alcogol = state.checkboxStates['alcogol'] ?? false;
                          final nonalcogol = state.checkboxStates['nonalcogol'] ?? false;
                          final tobacco = state.checkboxStates['tobacco'] ?? false;
                          final fillOutReport = state.checkboxStates['fillOutReport'] ?? false;
                          final closeShift = state.checkboxStates['closeShift'] ?? false;
                          final cleanlinessWorkplace = state.checkboxStates['cleanlinessWorkplace'] ?? false;

                          db.getConnection().then((conn) {
                            conn.query(
                                'INSERT INTO BarmanEnd_StripBarsukKazan (Date,DateTime,Alcogol,Nonalcogol,Tobacco,Comment_Application,CommentDirector_Application,FillOutReport,Comment_FillOutReport,'
                                    'CommentDirector_FillOutReport,CloseShift,Comment_CloseShift,CommentDirector_CloseShift,CleanlinessWorkplace,CleanlinessWorkplacePhotoBLOB,Comment_CleanlinessWorkplace,'
                                    'CommentDirector_CleanlinessWorkplace,Users_idUsers) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
                                [
                                  date,
                                  datenow,
                                  alcogol,
                                  nonalcogol,
                                  tobacco,
                                  commentApplication,
                                  commentDirectorApplication,
                                  fillOutReport,
                                  commentFillOutReport,
                                  commentDirectorFillOutReport,
                                  closeShift,
                                  commentCloseShift,
                                  commentDirectorCloseShift,
                                  cleanlinessWorkplace,
                                  cleanlinessWorkplacePhotoBLOB,
                                  commentCleanlinessWorkplace,
                                  commentDirectorCleanlinessWorkplace,
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
