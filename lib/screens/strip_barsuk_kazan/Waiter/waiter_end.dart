import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/checkbox/bloc/checkbox_bloc.dart';
import 'package:test_form/component/checkbox/checkbox.dart';

class Waiter_end extends StatefulWidget {
  final int idUser;
  final DateTime now;

  Waiter_end({super.key, required this.idUser, required this.now});

  @override
  State<Waiter_end> createState() => _Waiter_endState();
}

class _Waiter_endState extends State<Waiter_end> {

  TextEditingController commentChargerCandle = TextEditingController();
  TextEditingController commentFixOttomansAndTables = TextEditingController();
  TextEditingController commentCleanTables = TextEditingController();
  TextEditingController commentPutAwayTheNapkins = TextEditingController();

  bool readOnly = false;
  bool enabled = true;

  CheckboxBloc checkboxBloc = CheckboxBloc();

  String commentDirectorChargerCandle = '';
  String commentDirectorFixOttomansAndTables = '';
  String commentDirectorCleanTables = '';
  String commentDirectorPutAwayTheNapkins = '';

  bool chargerCandle = false;
  bool fixOttomansAndTables =  false;
  bool cleanTables = false;
  bool putAwayTheNapkins = false;


  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final results = await Api().checkReportWaiterEnd(date);
    if (results != null) {
      readOnly = true;
      enabled = false;
      final response = await Api().showWaiterEnd(date);
      chargerCandle = response['ChargerCandle'] != 0 ? true : false;
      commentChargerCandle.text = response['Comment_ChargerCandle'];
      commentDirectorChargerCandle = response['CommentDirector_ChargerCandle'];
      fixOttomansAndTables = response['FixOttomansAndTables'] != 0 ? true : false;
      commentFixOttomansAndTables.text = response['Comment_FixOttomansAndTables'];
      commentDirectorFixOttomansAndTables = response['CommentDirector_FixOttomansAndTables'];
      cleanTables = response['CleanTables'] != 0 ? true : false;
      commentCleanTables.text = response['Comment_CleanTables'];
      commentDirectorCleanTables = response['CommentDirector_CleanTables'];
      putAwayTheNapkins = response['PutAwayTheNapkins'] != 0 ? true : false;
      commentPutAwayTheNapkins.text = response['Comment_PutAwayTheNapkins'];
      commentDirectorPutAwayTheNapkins = response['CommentDirector_PutAwayTheNapkins'];
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                    padding: const EdgeInsets.fromLTRB(22, 35.93, 0, 53.58),
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Color(0xff000000),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 6.58, 67, 12.74),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 7.61),
                          width: 173,
                          height: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(
                                  child: SingleChildScrollView(
                                    child: SizedBox(
                                      width: 200,
                                      child: Text(
                                        'Привет Официант',
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
                              ],
                            ),
                          ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset("assets/emblem.png")),
                        ),
                      ],
                    ),
                  ),
            ),
            const Text(
              'Конец смены',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                height: 1.2999999523,
                color: Color(0xffffffff),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 31.5, 0, 62),
                  margin: const EdgeInsets.fromLTRB(14, 0, 19, 56),
                  width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Убрать на зарядку свечи',
                                        value: chargerCandle);
                                  }
                                  return NewCheck(
                                      text: "Убрать на зарядку свечи",
                                      value: state.checkboxStates['chargerCandle'] ?? false,
                                      checkboxBloc:checkboxBloc,
                                    checkboxId: 'chargerCandle',
                                  enabled: enabled,);
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentChargerCandle,
                              readOnly: readOnly,
                            ),
                            const SizedBox(height: 20,),
                            ShowCommentDirector(valueDirector: commentDirectorChargerCandle),
                            const SizedBox(height: 20,),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Поправить пуфы и столики',
                                        value: fixOttomansAndTables);
                                  } else {
                                    return NewCheck(
                                      text: "Поправить пуфы и столики",
                                      value: state.checkboxStates['fixOttomansAndTables'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'fixOttomansAndTables',
                                      enabled: enabled,);
                                  }
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentFixOttomansAndTables,
                              readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCommentDirector(valueDirector: commentDirectorFixOttomansAndTables,),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Протереть столы',
                                        value: cleanTables);
                                  } else {
                                    return NewCheck(
                                      text: "Протереть столы",
                                      value: state.checkboxStates['cleanTables'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'cleanTables',
                                      enabled: enabled,);
                                  }
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentCleanTables,
                              readOnly: readOnly,
                            ),
                            const SizedBox(height: 20,),
                            ShowCommentDirector(valueDirector: commentDirectorCleanTables,),
                            const SizedBox(height: 20,),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  if(enabled == false){
                                    return ShowCheck(
                                        text: 'Убрать все салфетки (которыми протирали пилон) от зеркала',
                                        value: putAwayTheNapkins);
                                  } else {
                                    return NewCheck(
                                      text: "Убрать все салфетки (которыми протирали пилон) от зеркала",
                                      value: state.checkboxStates['putAwayTheNapkins'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'putAwayTheNapkins',
                                      enabled: enabled,);
                                  }
                                },
                              ),
                            ),
                            CommentWorker(
                              commentValue: commentPutAwayTheNapkins,
                              readOnly: readOnly,
                            ),
                            const SizedBox(height: 20,),
                            ShowCommentDirector(valueDirector: commentDirectorPutAwayTheNapkins,),
                            Center(
                                child: enabled == true ? ElevatedButton(
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

                                    chargerCandle = state.checkboxStates['chargerCandle'] ?? false;
                                    fixOttomansAndTables = state.checkboxStates['fixOttomansAndTables'] ?? false;
                                    cleanTables = state.checkboxStates['cleanTables'] ?? false;
                                    putAwayTheNapkins = state.checkboxStates['putAwayTheNapkins'] ?? false;

                                    Api().waiterEnd(
                                      date,
                                      time,
                                      chargerCandle,
                                      commentChargerCandle.text,
                                      commentDirectorChargerCandle,
                                      fixOttomansAndTables,
                                      commentFixOttomansAndTables.text,
                                      commentDirectorFixOttomansAndTables,
                                      cleanTables,
                                      commentCleanTables.text,
                                      commentDirectorCleanTables,
                                      putAwayTheNapkins,
                                      commentPutAwayTheNapkins.text,
                                      commentDirectorPutAwayTheNapkins,
                                      widget.idUser,
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
                                    : ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green[800],
                                    ),
                                    child: const Text('На главный экран'))
                            ),
                          ],
                        ),
                      ),


                  ),
                ),
      ]
              ),
    );
  }
}
