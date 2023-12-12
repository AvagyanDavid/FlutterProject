import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/main.dart';
import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';
import '../../../connection/database.dart';
import 'host.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class host_begin extends StatelessWidget {
  host_begin({super.key});

  CheckboxBloc checkboxBloc = CheckboxBloc();

  String? cleanlinessWorkplaceHostPath = null;
  String? cleanlinessWorkplaceHostName = null;

  String commentTakeRadioTerminalTelephone = '';
  String commentSendMessage = '';

  String? commentDirectorTakeRadioTerminalTelephone;
  String? commentDirectorSendMessage;

  bool readOnly = false;
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = '${now.year}-${now.month}-${now.day}';
    final response = Api().showHostBegin(date);
    if (response != null){
      readOnly = true;
      enabled = false;
    }
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
                                Text(
                                  // 6oq (207:28)
                                  'сегодня $date',
                                  style: const TextStyle(
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
                'Начало смены',
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
                                      checkboxId: 'takeRadioTerminalTelephone',
                                  enabled: enabled,);
                                },
                              ),
                            ),
                            CommentWorker(commentValue: commentTakeRadioTerminalTelephone, onChanged: (value) {
                              commentTakeRadioTerminalTelephone = value!;},
                            readOnly: readOnly,),
                            ShowCommentDirector(valueDirector: commentDirectorTakeRadioTerminalTelephone),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                          'Отправить сообщение:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            color: Colors.white,
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
                                    checkboxId: 'sendMessageWatsApp',
                                  enabled: enabled,);
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
                                    checkboxId: 'sendMessageTelegram',
                                  enabled: enabled,);
                                },
                              ),
                            ),
                            CommentWorker(commentValue: commentSendMessage,
                              onChanged: (value) {
                                commentSendMessage = value!;
                              },
                              readOnly: readOnly,
                            ),
                            ShowCommentDirector(valueDirector: commentDirectorSendMessage),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
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
                          final takeRadioTerminalTelephone = state.checkboxStates['takeRadioTerminalTelephone'] ?? false;
                          final sendMessageWatsApp = state.checkboxStates['sendMessageWatsApp'] ?? false;
                          final sendMessageTelegram = state.checkboxStates['sendMessageTelegram'] ?? false;

                          Api().hostBegin(date,time,takeRadioTerminalTelephone,commentTakeRadioTerminalTelephone,commentDirectorTakeRadioTerminalTelephone,sendMessageWatsApp,sendMessageTelegram,commentSendMessage,commentDirectorSendMessage,1);

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
