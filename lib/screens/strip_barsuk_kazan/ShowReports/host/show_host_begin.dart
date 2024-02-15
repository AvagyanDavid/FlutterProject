import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import '../../../../component/checkbox/checkbox.dart';

class ShowHostBegin extends StatefulWidget {
  final String formatterdate;
  final String post;

  ShowHostBegin({required this.formatterdate,required this.post});

  @override
  _ShowHostBeginState createState() => _ShowHostBeginState();
}

class _ShowHostBeginState extends State<ShowHostBegin> {
  TextEditingController commentDirectorTakeRadioTerminalTelephone = TextEditingController();
  TextEditingController commentDirectorSendMessage = TextEditingController();

  int idWorker = 0;

  bool readOnly = false;

  bool takeRadioTerminalTelephone = false;
  String? commentWorkerTakeRadioTerminalTelephone;
  bool sendMessageTelegram = false;
  bool sendMessageWatsApp = false;
  String? commentWorkerSendMessage;

  void getData() async {
    final response = await Api().showHostBegin(widget.formatterdate);
    debugPrint(response.toString());
    takeRadioTerminalTelephone = response['TakeRadioTerminalTelephone'] != 0 ? true : false;
    commentWorkerTakeRadioTerminalTelephone = response['Comment_TakeRadioTerminalTelephone'] as String?;
    commentDirectorTakeRadioTerminalTelephone.text = response['CommentDirector_TakeRadioTerminalTelephone'] as String;
    sendMessageWatsApp = response['SendMessageWatsApp'] != 0 ? true : false;
    sendMessageTelegram = response['SendMessageTelegram'] != 0 ? true : false;
    commentWorkerSendMessage = response['Comment_SendMessage'] as String?;
    commentDirectorSendMessage.text = response['CommentDirector_SendMessage'];

    idWorker = response['idUsers'];
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
    if (widget.post == "Owner") {
      readOnly = true;
    }
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 35.93, 0, 53.58),
            width: double.infinity,
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
                              'Отчет Хост',
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
                        'Отчет за ${widget.formatterdate}',
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
                  child: Align(alignment: Alignment.topRight, child: Image.asset("assets/emblem.png")),
                ),
              ],
            ),
          ),
        ),
        const Text(
          'Начало смены',
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
              padding: const EdgeInsets.fromLTRB(26, 31.5, 0, 62),
              margin: const EdgeInsets.fromLTRB(14, 0, 19, 56),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowCheck(text: "Взять рацию, терминал, телефон", value: takeRadioTerminalTelephone),
                  ShowCommentWorker(
                    commentValue: commentWorkerTakeRadioTerminalTelephone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(
                    valueDirector: commentDirectorTakeRadioTerminalTelephone,
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
                  ShowCheck(text: "WhatsApp", value: sendMessageWatsApp),
                  ShowCheck(text: "Telegram", value: sendMessageTelegram),
                  ShowCommentWorker(commentValue: commentWorkerSendMessage),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(
                    valueDirector: commentDirectorSendMessage,
                    readOnly: readOnly,
                  ),
                  if (widget.post == 'Manager')
                    Column(
                      children: [
                        const SizedBox(height: 20,),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Api().updateHostBegin(
                                  commentDirectorTakeRadioTerminalTelephone.text, commentDirectorSendMessage.text, idWorker, widget.formatterdate);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[800],
                            ),
                            child: const Text('Отправить комментарии'),
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        const SizedBox(height: 20,),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[800]
                            ),
                            child: const Text('Выйти',),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
