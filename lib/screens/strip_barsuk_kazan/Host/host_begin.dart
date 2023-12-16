import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';

class Host_begin extends StatefulWidget {
  final int idUser;
  final DateTime now;

  Host_begin({super.key, required this.idUser, required this.now});

  @override
  State<Host_begin> createState() => _Host_beginState();
}

class _Host_beginState extends State<Host_begin> {
  CheckboxBloc checkboxBloc = CheckboxBloc();

  bool readOnly = false;
  bool enabled = true;

  String? cleanlinessWorkplaceHostPath = null;
  String? cleanlinessWorkplaceHostName = null;
  String? commentTakeRadioTerminalTelephone;
  String? commentSendMessage;
  String? commentDirectorTakeRadioTerminalTelephone;
  String? commentDirectorSendMessage;
  bool takeRadioTerminalTelephone = false;
  bool sendMessageWatsApp = false;
  bool sendMessageTelegram = false;

  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final results = await Api().checkReportHostBegin(date);
    if (results != null) {
      readOnly = true;
      enabled = false;
      final response = await Api().showHostBegin(date);
      takeRadioTerminalTelephone = response['TakeRadioTerminalTelephone'] != 0 ? true : false;
      commentTakeRadioTerminalTelephone = response['CommentWorker_TakeRadioTerminalTelephone'] as String?;
      commentDirectorTakeRadioTerminalTelephone =
      response['CommentDirector_TakeRadioTerminalTelephone'] as String?;
      sendMessageWatsApp = response['SendMessageWatsApp'] != 0 ? true : false;
      sendMessageTelegram = response['SendMessageTelegram'] != 0 ? true : false;
      commentSendMessage = response['CommentWorker_SendMessage'] as String?;
      commentDirectorSendMessage = response['CommentDirector_SendMessage'] as String?;
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
                                    'сегодня ${widget.now.day}-${widget.now.month}-${widget.now.year}',
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
                    padding: const EdgeInsets.fromLTRB(26, 31.5, 0, 62),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
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
                                          text: 'Взять рацию, терминал, телефон',
                                          value: takeRadioTerminalTelephone);
                                    } else {
                                      return NewCheck(
                                        text: "Взять рацию, терминал, телефон",
                                        value: state.checkboxStates['takeRadioTerminalTelephone'] ?? false,
                                        checkboxBloc: checkboxBloc,
                                        checkboxId: 'takeRadioTerminalTelephone',
                                        enabled: enabled,);
                                    }
                                  },
                                ),
                              ),
                              CommentWorker(commentValue: commentTakeRadioTerminalTelephone, onChanged: (value) {
                                commentTakeRadioTerminalTelephone = value!;
                              },
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
                                child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                  builder: (context, state) {
                                    if(enabled == false){
                                      return ShowCheck(
                                          text: 'WhatsApp',
                                          value: sendMessageWatsApp);
                                    } else {
                                      return NewCheck(
                                        text: "WhatsApp",
                                        value: state.checkboxStates['sendMessageWatsApp'] ?? false,
                                        checkboxBloc: checkboxBloc,
                                        checkboxId: 'sendMessageWatsApp',
                                        enabled: enabled,);
                                    }
                                  },
                                ),
                              ),
                              BlocProvider<CheckboxBloc>(
                                create: (context) => checkboxBloc,
                                child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                  builder: (context, state) {
                                    if(enabled == true){
                                      return ShowCheck(
                                          text: 'Telegram',
                                          value: sendMessageTelegram);
                                    } else {
                                      return NewCheck(
                                        text: "Telegram",
                                        value: state.checkboxStates['sendMessageTelegram'] ?? false,
                                        checkboxBloc: checkboxBloc,
                                        checkboxId: 'sendMessageTelegram',
                                        enabled: enabled,);
                                    }
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
                                takeRadioTerminalTelephone = state.checkboxStates['takeRadioTerminalTelephone'] ?? false;
                                sendMessageWatsApp = state.checkboxStates['sendMessageWatsApp'] ?? false;
                                sendMessageTelegram = state.checkboxStates['sendMessageTelegram'] ?? false;

                                Api().hostBegin(
                                    date,
                                    time,
                                    takeRadioTerminalTelephone,
                                    commentTakeRadioTerminalTelephone,
                                    commentDirectorTakeRadioTerminalTelephone,
                                    sendMessageWatsApp,
                                    sendMessageTelegram,
                                    commentSendMessage,
                                    commentDirectorSendMessage,
                                    1);

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
                            ) : const SizedBox(height: 0,),
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


