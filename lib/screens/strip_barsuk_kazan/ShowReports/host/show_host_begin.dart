import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import '../../../../component/checkbox/checkbox.dart';

class ShowHostBegin extends StatefulWidget {
  final String formatterdate;
  final int id;
  final String post;
  ShowHostBegin({required this.formatterdate,required this.id, required this.post});

  @override
  _ShowHostBeginState createState() => _ShowHostBeginState();
}

class _ShowHostBeginState extends State<ShowHostBegin> {
  TextEditingController commentWorkerSendMessageController = TextEditingController();

  bool readOnly = false;
  bool enabled = true;

  bool takeRadioTerminalTelephone = false;
  String? commentWorkerTakeRadioTerminalTelephone;
  String? commentDirectorTakeRadioTerminalTelephone;
  bool sendMessageTelegram = false;
  bool sendMessageWatsApp = false;
  String? commentWorkerSendMessage;
  String? commentDirectorSendMessage;

  void getData() async {
    debugPrint('дата в шоу = ${widget.formatterdate}');
    final response = await Api().showHostBegin(widget.formatterdate);
    takeRadioTerminalTelephone = response['TakeRadioTerminalTelephone'] != 0 ? true : false;
    commentWorkerTakeRadioTerminalTelephone = response['CommentWorker_TakeRadioTerminalTelephone'] as String?;
    commentDirectorTakeRadioTerminalTelephone =
        response['CommentDirector_TakeRadioTerminalTelephone'] as String?;
    sendMessageWatsApp = response['SendMessageWatsApp'] != 0 ? true : false;
    sendMessageTelegram = response['SendMessageTelegram'] != 0 ? true : false;
    commentWorkerSendMessage = response['CommentWorker_SendMessage'] as String?;
    commentDirectorSendMessage =
        response['CommentDirector_SendMessage'] as String?;
    debugPrint(response.toString());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.post == "Owner"){
      readOnly = true;
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
                                    'Отчет Хостеса',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Отчет за ${widget.formatterdate}',
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
                            ShowCheck(
                                text: "Взять рацию, терминал, телефон",
                                value: takeRadioTerminalTelephone),
                            ShowCommentWorker(
                              commentValue:
                                  commentWorkerTakeRadioTerminalTelephone,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CommentDirector(
                              valueDirector:
                                  commentDirectorTakeRadioTerminalTelephone,
                              onChanged: (value) {
                                commentDirectorTakeRadioTerminalTelephone =
                                    value!;
                              },
                              readOnly: readOnly,
                            ),
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
                            ShowCheck(
                                text: "WhatsApp", value: sendMessageWatsApp),
                            ShowCheck(
                                text: "Telegram", value: sendMessageTelegram),
                            ShowCommentWorker(
                                commentValue: commentWorkerSendMessage),
                            const SizedBox(
                              height: 20,
                            ),
                            CommentDirector(
                              valueDirector: commentDirectorSendMessage,
                              onChanged: (value) {
                                commentDirectorSendMessage = value!;
                              },
                              readOnly: readOnly,
                            ),
                            if (widget.post == 'Manager')
                              ElevatedButton(
                                onPressed: () {
                                  Api().updateHostBegin(commentDirectorTakeRadioTerminalTelephone, commentDirectorSendMessage, widget.id,widget.formatterdate);
                                },
                                child: const Text('Отправить комментарии'),
                              ),
                          ],
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
