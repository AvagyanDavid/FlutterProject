import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/component/Forms.dart';
import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';
import '../../../connection/database.dart';
import 'host.dart';

class host_begin extends StatelessWidget {
  host_begin({super.key});

  CheckboxBloc checkboxBloc = CheckboxBloc();

  String commentTakeRadioTerminalTelephone = '';
  String commentSendMessage = '';

  String? commentDirectorTakeRadioTerminalTelephone;
  String? commentDirectorSendMessage;

  var db = Mysql();

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
                                      text: "Взять рацию, терминал, телефон",
                                      value: state.checkboxStates['takeRadioTerminalTelephone'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                      checkboxId: 'takeRadioTerminalTelephone',);
                                },
                              ),
                            ),
                            CommentWorker(commentValue: commentTakeRadioTerminalTelephone, onChanged: (value) {
                              commentTakeRadioTerminalTelephone = value!;},),
                            CommentDirector(valueDirector: commentDirectorTakeRadioTerminalTelephone),
                const SizedBox(
                  height: 20,
                ),
                Container(
                      // autogroupssnkLeB (Qd7tBVgL7cMFvwHZ7FsSNK)
                      // padding:const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      width: double.infinity,
                      child: Container(
                        // ANK (211:310)
                        child: const Text(
                          'Отправить сообщение:',
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
                                      text: "WhatsApp",
                                    value: state.checkboxStates['sendMessageWatsApp'] ?? false,
                                      checkboxBloc: checkboxBloc,
                                    checkboxId: 'sendMessageWatsApp',);
                                },
                              ),
                            ),
                            BlocProvider<CheckboxBloc>(
                              create: (context) => checkboxBloc,
                              // BlocBuilder(builder: builder)
                              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                builder: (context, state) {
                                  return NewCheck(
                                    text: "Telegram",
                                    value: state.checkboxStates['sendMessageTelegram'] ?? false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'sendMessageTelegram',);
                                },
                              ),
                            ),
                            CommentWorker(commentValue: commentSendMessage, onChanged: (value) {
                              commentSendMessage = value!;
                            },),
                            CommentDirector(valueDirector: commentDirectorSendMessage),
                          ],
                        ),
                      ),
                      Center(
                        child: SizedBox(
                            // group167uy (231:53)
                            width: double.infinity,
                            height: 51,
                        child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 100),
                                textStyle: const TextStyle(fontSize: 20),
                                backgroundColor: Colors.green,
                              ),
                        onPressed: () async {
                          db.getConnection().then((conn) {
                            final state = checkboxBloc.state;
                            final takeRadioTerminalTelephone = state.checkboxStates['takeRadioTerminalTelephone'] ?? false;
                            final sendMessageWatsApp = state.checkboxStates['sendMessageWatsApp'] ?? false;
                            final sendMessageTelegram = state.checkboxStates['sendMessageTelegram'] ?? false;


                            DateTime now = DateTime.now().toUtc();
                            DateTime date =
                                DateTime(now.year, now.month, now.day).toUtc();
                            DateTime datenow = DateTime(now.year, now.month,
                                now.day, now.hour, now.minute).toUtc();
                            conn.query(
                                'INSERT INTO HostBegin_StripBarsukKazan (Date,DateTime,TakeRadioTerminalTelephone, CommentWorker_TakeRadioTerminalTelephone, '
                                    'CommentDirector_TakeRadioTerminalTelephone,'
                                    'SendMessageWatsApp,SendMessageTelegram, CommentWorker_SendMessage, CommentDirector_SendMessage, Users_idUsers) VALUES (?,?,?, ?, ?, ?, ?, ?, ?)',
                                [date,datenow,takeRadioTerminalTelephone,commentTakeRadioTerminalTelephone,commentDirectorTakeRadioTerminalTelephone,sendMessageWatsApp,sendMessageTelegram,commentSendMessage,commentDirectorSendMessage,'1']).then((results) {
                            });
                          });
                          print(commentTakeRadioTerminalTelephone);
                          print(commentSendMessage);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => host()),
                            );
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




  // host_begin_bd(bool takeRadioTerminalTelephone, String commentTakeRadioTerminalTelephone, bool sendMessage, String commentSendMessage) {}
}
