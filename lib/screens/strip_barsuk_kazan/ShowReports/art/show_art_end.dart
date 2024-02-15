import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import '../../../../component/checkbox/checkbox.dart';

class ShowArtEnd extends StatefulWidget {
  final String formatterdate;
  final String post;

  ShowArtEnd({required this.formatterdate, required this.post});

  @override
  _ShowArtEndState createState() => _ShowArtEndState();
}

class _ShowArtEndState extends State<ShowArtEnd> {
  TextEditingController commentDirectorReportCompletedArt = TextEditingController();
  TextEditingController commentDirectorReportCompleteMarket = TextEditingController();
  TextEditingController commentDirectorSendReportChat = TextEditingController();
  TextEditingController commentDirectorOrderDressingRoom = TextEditingController();

  bool readOnly = false;

  int idWorker = 0;

  bool reportCompletedArt = false;
  String? commentReportCompleteArt;
  bool reportCompleteMarket = false;
  String? commentReportCompleteMarket;
  bool art = false;
  bool bar = false;
  bool market = false;
  bool hostes = false;
  String? commentSendReportChat;
  bool orderDressingRoom = false;
  String? orderDressingRoomFile;
  String? commentOrderDressingRoom;

  void getData() async {
    final response = await Api().showArtEnd(widget.formatterdate);
    reportCompletedArt = response['ReportCompletedArt'] != 0 ? true : false;
    commentReportCompleteArt = response['Comment_ReportCompleteArt'] as String?;
    commentDirectorReportCompletedArt.text = response['CommentDirector_ReportCompletedArt'];
    reportCompleteMarket = response['ReportCompleteMarket'] != 0 ? true : false;
    commentReportCompleteMarket = response['Comment_ReportCompleteMarket'] as String?;
    commentDirectorReportCompleteMarket.text = response['CommentDirector_ReportCompleteMarket'];
    art = response['Art'] != 0 ? true : false;
    bar = response['Bar'] != 0 ? true : false;
    market = response['Market'] != 0 ? true : false;
    hostes = response['Hostes'] != 0 ? true : false;
    commentSendReportChat = response['Comment_SendReportChat'] as String?;
    commentDirectorSendReportChat.text = response['CommentDirector_SendReportChat'];
    orderDressingRoom = response['OrderDressingRoom'] != 0 ? true : false;
    commentOrderDressingRoom = response['Comment_OrderDressingRoom'] as String?;
    commentDirectorOrderDressingRoom.text = response['CommentDirector_OrderDressingRoom'];

    idWorker = response['Users_idUsers'];
    debugPrint(response.toString());
    orderDressingRoomFile = response['OrderDressingRoomPhoto'] == null ? null : Api().getPhoto(response['OrderDressingRoomPhoto']);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.post == 'Owner') {
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
                                    'Отчет Арта',
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
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 120, 0),
          child: const Text(
            'Конец смены',
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
                  ShowCheck(text: 'Заполнить отчет арта', value: reportCompletedArt),
                  ShowCommentWorker(
                    commentValue: commentReportCompleteArt,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(
                    valueDirector: commentDirectorReportCompletedArt,
                    readOnly: readOnly,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowCheck(text: 'Заполнить отчет маркетолога', value: reportCompleteMarket),
                  ShowCommentWorker(
                    commentValue: commentReportCompleteMarket,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(
                    valueDirector: commentDirectorReportCompleteMarket,
                    readOnly: readOnly,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    child: Text(
                      'Скинуть все отчеты в чат:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ShowCheck(text: 'Арт', value: art),
                  ShowCheck(text: 'Бар', value: bar),
                  ShowCheck(text: 'Маркетологи', value: market),
                  ShowCheck(text: 'хостес', value: hostes),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowCommentWorker(
                    commentValue: commentSendReportChat,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(
                    valueDirector: commentDirectorSendReportChat,
                    readOnly: readOnly,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowCheck(text: 'Проверить порядок в гримерке', value: orderDressingRoom),
                  ShowPhoto(image: orderDressingRoomFile),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowCommentWorker(
                    commentValue: commentOrderDressingRoom,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(
                    valueDirector: commentDirectorOrderDressingRoom,
                    readOnly: readOnly,
                  ),
                  if (widget.post == 'Manager')
                    Column(
                      children: [
                        const SizedBox(height: 20,),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Api().updateDirectorArtEnd(commentDirectorReportCompletedArt.text, commentDirectorReportCompleteMarket.text,
                                  commentDirectorSendReportChat.text, commentDirectorOrderDressingRoom.text, idWorker, widget.formatterdate);
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
