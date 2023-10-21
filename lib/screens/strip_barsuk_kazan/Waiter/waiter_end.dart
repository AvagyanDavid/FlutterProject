import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/checkbox/bloc/checkbox_bloc.dart';

import '../../../component/checkbox/checkbox.dart';

class waiter_end extends StatelessWidget {
  const waiter_end({super.key});

  @override
  Widget build(BuildContext context) {
    // String tableArrangement = '';

    String commentChargerCandle = '';
    String commentFixOttomansAndTables = '';
    String commentCleanTables = '';
    String commentPutAwayTheNapkins = '';

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
                              create: (context) => CheckboxBloc(),
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                      text: "Убрать на зарядку свечи",
                                      value: state.checkboxStates['chargerCandle'] ?? false,
                                      checkboxBloc:
                                      BlocProvider.of<CheckboxBloc>(
                                          context), checkboxId: 'chargerCandle',);
                                },
                              ),
                            ),

                            CommentWorker(commentValue: commentChargerCandle),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => CheckboxBloc(),
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                      text: "Поправить пуфы и столики",
                                      value: state.checkboxStates['fixOttomansAndTables'] ?? false,
                                      checkboxBloc:
                                      BlocProvider.of<CheckboxBloc>(
                                          context), checkboxId: 'fixOttomansAndTables',);
                                },
                              ),
                            ),
                            CommentWorker(commentValue: commentFixOttomansAndTables),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => CheckboxBloc(),
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                      text: "Протереть столы",
                                      value: state.checkboxStates['cleanTables'] ?? false,
                                      checkboxBloc:
                                      BlocProvider.of<CheckboxBloc>(
                                          context), checkboxId: 'cleanTables',);
                                },
                              ),
                            ),
                            CommentWorker(commentValue: commentCleanTables),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => CheckboxBloc(),
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                      text: "Убрать все салфетки (которыми протирали пилон) от зеркала",
                                      value: state.checkboxStates['putAwayTheNapkins'] ?? false,
                                      checkboxBloc:
                                      BlocProvider.of<CheckboxBloc>(
                                          context), checkboxId: 'putAwayTheNapkins',);
                                },
                              ),
                            ),
                            CommentWorker(commentValue: commentPutAwayTheNapkins),
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
                                onPressed: () {},
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
