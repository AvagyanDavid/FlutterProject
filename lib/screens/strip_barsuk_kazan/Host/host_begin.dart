import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/checkbox/bloc/checkbox_bloc.dart';
import 'package:test_form/component/checkbox/checkbox.dart';

class Host_begin extends StatefulWidget {
  final int idUser;
  final DateTime now;

  Host_begin({super.key, required this.idUser, required this.now});

  @override
  State<Host_begin> createState() => _Host_beginState();
}

class _Host_beginState extends State<Host_begin> {
  CheckboxBloc checkboxBloc = CheckboxBloc();

  TextEditingController commentTakeRadioTerminalTelephone = TextEditingController();
  TextEditingController commentSendMessage = TextEditingController();

  bool readOnly = false;
  bool enabled = true;

  String? cleanlinessWorkplaceHostPath = null;
  String? cleanlinessWorkplaceHostName = null;

  String commentDirectorTakeRadioTerminalTelephone = '';
  String commentDirectorSendMessage = '';

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
      commentTakeRadioTerminalTelephone.text = response['Comment_TakeRadioTerminalTelephone'];
      commentDirectorTakeRadioTerminalTelephone = response['CommentDirector_TakeRadioTerminalTelephone'];
      sendMessageWatsApp = response['SendMessageWatsApp'] != 0 ? true : false;
      sendMessageTelegram = response['SendMessageTelegram'] != 0 ? true : false;
      commentSendMessage.text = response['Comment_SendMessage'];
      commentDirectorSendMessage = response['CommentDirector_SendMessage'];
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
                child: Column(
                  children: [
                    Container(
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
                                          'Привет Хост',
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
                  ],
                ),
              ),
              const SizedBox(
                child: Text(
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
                              CommentWorker(
                                commentValue: commentTakeRadioTerminalTelephone,
                                readOnly: readOnly, ),
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
                                    if(enabled == false){
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
                              CommentWorker(
                                commentValue: commentSendMessage,
                                readOnly: readOnly,
                              ),
                              ShowCommentDirector(valueDirector: commentDirectorSendMessage),
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
                                          commentTakeRadioTerminalTelephone.text,
                                          commentDirectorTakeRadioTerminalTelephone,
                                          sendMessageWatsApp,
                                          sendMessageTelegram,
                                          commentSendMessage.text,
                                          commentDirectorSendMessage,
                                          widget.idUser);

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
                                  ) :
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green[800],
                                    ),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: const Text('На главный экран'))
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


