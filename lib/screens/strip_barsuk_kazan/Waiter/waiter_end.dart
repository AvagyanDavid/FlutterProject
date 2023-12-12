import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/checkbox/bloc/checkbox_bloc.dart';
import 'package:test_form/main.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Waiter/waiter.dart';

import '../../../component/checkbox/checkbox.dart';

class Waiter_end extends StatelessWidget {
  Waiter_end({super.key});

  CheckboxBloc checkboxBloc = CheckboxBloc();

  String commentChargerCandle = '';
  String commentFixOttomansAndTables = '';
  String commentCleanTables = '';
  String commentPutAwayTheNapkins = '';

  String? commentDirectorChargerCandle;
  String? commentDirectorFixOttomansAndTables;
  String? commentDirectorCleanTables;
  String? commentDirectorPutAwayTheNapkins;

  bool readOnly = false;
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = '${now.year}-${now.month}-${now.day}';
    final response = Api().showWaiterEnd(date);
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
                                const Text(
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
                  padding: const EdgeInsets.fromLTRB(26, 31.5, 0, 62),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 19, 56),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                      text: "Убрать на зарядку свечи",
                                      value: state.checkboxStates['chargerCandle'] ?? false,
                                      checkboxBloc:checkboxBloc,
                                    checkboxId: 'chargerCandle',
                                  enabled: enabled,);
                                },
                              ),
                            ),
                            CommentWorker(commentValue: commentChargerCandle,
                              onChanged: (value){
                              commentChargerCandle = value!;
                            },readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCommentDirector(valueDirector: commentDirectorChargerCandle),
                            const SizedBox(height: 20,),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                      text: "Поправить пуфы и столики",
                                      value: state.checkboxStates['fixOttomansAndTables'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                    checkboxId: 'fixOttomansAndTables',
                                  enabled: enabled,);
                                },
                              ),
                            ),
                            CommentWorker(commentValue: commentFixOttomansAndTables,onChanged: (value){
                              commentFixOttomansAndTables = value!;
                            },readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCommentDirector(valueDirector: commentDirectorFixOttomansAndTables,),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                      text: "Протереть столы",
                                      value: state.checkboxStates['cleanTables'] ?? false,
                                      checkboxBloc:checkboxBloc,
                                    checkboxId: 'cleanTables',
                                  enabled: enabled,);
                                },
                              ),
                            ),
                            CommentWorker(commentValue: commentCleanTables,onChanged: (value){
                              commentCleanTables = value!;
                            },readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCommentDirector(valueDirector: commentDirectorCleanTables,),
                            const SizedBox(height: 20,),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                      text: "Убрать все салфетки (которыми протирали пилон) от зеркала",
                                      value: state.checkboxStates['putAwayTheNapkins'] ?? false,
                                      checkboxBloc:checkboxBloc,
                                    checkboxId: 'putAwayTheNapkins',
                                  enabled: enabled,);
                                },
                              ),
                            ),
                            CommentWorker(commentValue: commentPutAwayTheNapkins, onChanged: (value){
                              commentPutAwayTheNapkins = value!;
                            },
                              readOnly: readOnly,
                            ),
                            const SizedBox(height: 20,),
                            ShowCommentDirector(valueDirector: commentDirectorPutAwayTheNapkins,),
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
                                  DateTime now = DateTime.now();
                                  String date = '${now.year}-${now.month}-${now.day}';
                                  String time = '${now.hour}:${now.minute}:${now.second}';

                                  final state = checkboxBloc.state;

                                  final chargerCandle = state.checkboxStates['chargerCandle'] ?? false;
                                  final fixOttomansAndTables = state.checkboxStates['fixOttomansAndTables'] ?? false;
                                  final cleanTables = state.checkboxStates['cleanTables'] ?? false;
                                  final putAwayTheNapkins = state.checkboxStates['putAwayTheNapkins'] ?? false;

                                  Api().waiterEnd(
                                    date,
                                    time,
                                    chargerCandle,
                                    commentChargerCandle,
                                    commentDirectorChargerCandle,
                                    fixOttomansAndTables,
                                    commentFixOttomansAndTables,
                                    commentDirectorFixOttomansAndTables,
                                    cleanTables,
                                    commentCleanTables,
                                    commentDirectorCleanTables,
                                    putAwayTheNapkins,
                                    commentPutAwayTheNapkins,
                                    commentDirectorPutAwayTheNapkins,
                                    2,
                                  );
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
