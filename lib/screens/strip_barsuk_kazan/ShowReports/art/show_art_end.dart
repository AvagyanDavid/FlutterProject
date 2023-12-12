import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import '../../../../component/checkbox/checkbox.dart';

class ShowArtEnd extends StatefulWidget {
  final String formatterdate;
  ShowArtEnd({required this.formatterdate});
  @override
  _ShowArtEndState createState() => _ShowArtEndState();
}

class _ShowArtEndState extends State<ShowArtEnd> {

  TextEditingController commentWorkerSendMessageController = TextEditingController();

  bool readOnly = false;
  bool enabled = true;

  bool reportCompletedArt = false;
  String? commentReportCompleteArt;
  String? commentDirectorReportCompletedArt;
  bool reportCompleteMarket = false;
  String? commentReportCompleteMarket;
  String? commentDirectorReportCompleteMarket;
  bool  art= false;
  bool bar = false;
  bool market = false;
  bool hostes = false;
  String? commentSendReportChat;
  String? commentDirectorSendReportChat;
  bool orderDressingRoom = false;
  String? orderDressingRoomFile;
  String? commentOrderDressingRoom;
  String? commentDirectorOrderDressingRoom;

  void getData() async{
    final response = await Api().showArtEnd(widget.formatterdate);
    reportCompletedArt = response['ReportCompletedArt'] != 0 ? true : false;
    commentReportCompleteArt = response['Comment_ReportCompleteArt'] as String?;
    commentDirectorReportCompletedArt = response['CommentDirector_ReportCompletedArt'] as String?;
    reportCompleteMarket = response['ReportCompleteMarket'] != 0 ? true : false;
    commentReportCompleteMarket= response['Comment_ReportCompleteMarket'] as String?;
    commentDirectorReportCompleteMarket = response['CommentDirector_ReportCompleteMarket'] as String?;
    art = response['Art'] != 0 ? true : false;
    bar = response['Bar'] != 0 ? true : false;
    market = response['Market'] != 0 ? true : false;
    hostes = response['Hostes'] != 0 ? true : false;
    commentSendReportChat = response['Comment_SendReportChat'] as String?;
    commentDirectorSendReportChat = response['CommentDirector_SendReportChat'] as String?;
    orderDressingRoom = response['OrderDressingRoom'] != 0 ? true : false;
    commentOrderDressingRoom = response['Comment_OrderDressingRoom'] as String?;
    commentDirectorOrderDressingRoom = response['CommentDirector_OrderDressingRoom'] as String?;

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
                                    'Отчет Арта',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Отчет по дате ${widget.formatterdate}',
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
                  padding: const EdgeInsets.fromLTRB(0, 31.5, 0, 0),
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
                                    text: 'Заполнить отчет арта',
                                    value: reportCompletedArt),
                            ShowCommentWorker(
                              commentValue: commentReportCompleteArt,
                            ),
                            CommentDirector(
                              valueDirector: commentDirectorReportCompletedArt,
                              onChanged: (value){
                                commentDirectorReportCompletedArt = value!;
                              },
                              readOnly: readOnly,
                            ),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                    text: 'Заполнить отчет маркетолога',
                                    value: reportCompleteMarket),
                            ShowCommentWorker(
                              commentValue: commentReportCompleteMarket,
                            ),
                            CommentDirector(
                              valueDirector: commentDirectorReportCompleteMarket,
                              onChanged: (value){
                                commentDirectorReportCompleteMarket = value!;
                              },
                              readOnly: readOnly,
                            ),
                            const SizedBox(height: 20,),
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
                            ShowCheck(
                                    text: 'Арт',
                                    value: art
                            ),
                            ShowCheck(
                                    text: 'Бар',
                                    value: bar),
                            ShowCheck(
                                    text: 'Маркетологи',
                                    value: market
                                  ),
                            ShowCheck(
                                    text: 'хостес',
                                    value: hostes),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentSendReportChat,),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorSendReportChat,
                              onChanged: (value){
                                commentDirectorSendReportChat = value!;
                              },
                              readOnly: readOnly,
                            ),
                            ShowCheck(
                                    text: 'Проверить порядок в гримерке',
                                    value: orderDressingRoom
                                  ),
                            ShowPhoto(image: orderDressingRoomFile),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentOrderDressingRoom,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorOrderDressingRoom,
                            onChanged: (value){
                              commentDirectorOrderDressingRoom = value!;
                            },
                              readOnly: readOnly,
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