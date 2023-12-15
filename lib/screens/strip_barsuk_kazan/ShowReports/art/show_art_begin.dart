import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import '../../../../component/checkbox/checkbox.dart';

class ShowArtBegin extends StatefulWidget {
  final String formatterdate;
  final String post;
  ShowArtBegin({required this.formatterdate, required this.post});
  @override
  _ShowArtBeginState createState() => _ShowArtBeginState();
}

class _ShowArtBeginState extends State<ShowArtBegin> {

  TextEditingController commentWorkerSendMessageController = TextEditingController();

  bool readOnly = false;

  bool listArtist = false;
  String? commentListArtist;
  String? commentDirectorListArtist;
  bool readiness = false;
  String? commentReadiness;
  String? commentDirectorReadiness;
  bool sendListOfGirls = false;
  String? commentSendListOfGirls;
  String? commentDirectorSendListOfGirls;
  bool listDJ = false;
  String? commentListDJ;
  String? commentDirectorListDJ;
  bool analyzeGraph = false;
  String? commentAnalyzeGraph;
  String? commentDirectorAnalyzeGraph;
  bool controlArtistAnalize = false;
  String? commentControlArtistAnalize;
  String? commentDirectorControlArtistAnalize;
  bool fiveMinutes = false;
  String? commentFiveMinutes;
  String? commentDirectorFiveMinutes;
  bool firstCard = false;
  bool secondCard = false;
  bool thirdCard = false;
  String? commentCard;
  String? commentDirectorCard;
  bool control1 = false;
  String? commentControl1;
  bool control2 = false;
  String? commentControl2;
  bool control3 = false;
  String? commentControl3;
  bool control4 = false;
  String? commentControl4;
  bool control5 = false;
  String? commentControl5;
  bool toyOrder = false;
  String? commentToyOrder;
  String? commentDirectorToyOrder;

  void getData() async{
    final response = await Api().showArtBegin(widget.formatterdate);
    listArtist = response['ListArtist'] != 0 ? true : false;
    commentListArtist = response['Comment_ListArtist'] as String?;
    commentDirectorListArtist = response['CommentDirector_ListArtist'] as String?;
    readiness = response['Readiness'] != 0 ? true : false;
    commentReadiness = response['Comment_Readiness'] as String?;
    commentDirectorReadiness = response['CommentDirector_Readiness'] as String?;
    sendListOfGirls= response['SendListOfGirls'] != 0 ? true : false;
    commentSendListOfGirls = response['Comment_SendListOfGirls'] as String?;
    commentDirectorSendListOfGirls = response['CommentDirector_SendListOfGirls'] as String?;
    listDJ = response['ListDJ'] != 0 ? true : false;
    commentListDJ = response['Comment_ListDJ'] as String?;
    commentDirectorListDJ = response['CommentDirector_ListDJ'] as String?;
    analyzeGraph= response['AnalyzeGraph'] != 0 ? true : false;
    commentAnalyzeGraph = response['Comment_AnalyzeGraph'] as String?;
    commentDirectorAnalyzeGraph = response['CommentDirector_AnalyzeGraph'] as String?;
    controlArtistAnalize = response['ControlArtistAnalize'] != 0 ? true : false;
    commentControlArtistAnalize = response['Comment_ControlArtistAnalize'] as String?;
    commentDirectorControlArtistAnalize = response['CommentDirector_ControlArtistAnalize'] as String?;
    fiveMinutes = response['FiveMinutes'] != 0 ? true : false;
    commentFiveMinutes = response['Comment_FiveMinutes'] as String?;
    commentDirectorFiveMinutes = response['CommentDirector_FiveMinutes'] as String?;
    firstCard = response['FirstCard'] != 0 ? true : false;
    secondCard = response['SecondCard'] != 0 ? true : false;
    thirdCard = response['ThirdCard'] != 0 ? true : false;
    commentCard = response['Comment_Card'] as String?;
    commentDirectorCard = response['CommentDirector_Card'] as String?;
    control1 = response['Control1'] != 0 ? true : false;
    commentControl1 = response['Comment_Control1'] as String?;
    control2 = response['Control2'] != 0 ? true : false;
    commentControl2 = response['Comment_Control2'] as String?;
    control3 = response['Control3'] != 0 ? true : false;
    commentControl3 = response['Comment_Control3'] as String?;
    control4 = response['Control4'] != 0 ? true : false;
    commentControl4 = response['Comment_Control4'] as String?;
    control5 = response['Control5'] != 0 ? true : false;
    commentControl5 = response['Comment_Control5'] as String?;
    toyOrder = response['ToyOrder'] != 0 ? true : false;
    commentToyOrder = response['Comment_ToyOrder'] as String?;
    commentDirectorToyOrder = response['CommentDirector_ToyOrder'] as String?;
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
                                  'Отчет за:  ${widget.formatterdate}',
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
                                      text: 'Составить список артисток на смене',
                                      value: listArtist
                            ),
                            ShowCommentWorker(commentValue: commentListArtist,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorListArtist,onChanged: (value){
                              commentDirectorListArtist = value!;
                            },
                            readOnly: readOnly,),
                            const SizedBox(height: 20),
                            ShowCheck(
                                      text: 'Проверка готовности артисток к работе(внести данные в таблицу).Недостатки и исправления уточнить в прилагающем сообщении',
                                      value: readiness
                            ),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(
                              commentValue: commentReadiness,
                            ),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorReadiness,onChanged: (value){
                              commentDirectorReadiness = value!;
                            },
                              readOnly: readOnly,),
                            ShowCheck(
                                    text: 'Скинуть список девочек в чат Арт ',
                                    value: sendListOfGirls
                            ),
                            ShowCommentWorker(
                              commentValue: commentSendListOfGirls,
                            ),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorSendListOfGirls,onChanged: (value){
                              commentDirectorSendListOfGirls = value!;
                            },
                            readOnly: readOnly,),
                            ShowCheck(
                                    text: 'Составить список для диджея ',
                                    value: listDJ
                            ),
                            ShowCommentWorker(
                              commentValue: commentListDJ,
                            ),
                            const SizedBox(height: 10),
                            CommentDirector(valueDirector: commentDirectorListDJ,onChanged: (value){
                              commentDirectorListDJ = value!;
                            },
                            readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                    text:
                                    "Проанализировать график на ближайшие 7 дней",
                                    value: analyzeGraph
                            ),
                            ShowCommentWorker(
                              commentValue: commentAnalyzeGraph
                            ),
                            const SizedBox(height: 10,),
                            CommentDirector(valueDirector: commentDirectorAnalyzeGraph,onChanged: (value){
                              commentDirectorAnalyzeGraph = value!;
                            },
                            readOnly: readOnly,),
                            ShowCheck(
                                    text: "Контроль наличия анализов у артисток",
                                    value: controlArtistAnalize
                            ),
                            ShowCommentWorker(
                              commentValue: commentControlArtistAnalize,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommentDirector(valueDirector: commentDirectorControlArtistAnalize,onChanged: (value){
                              commentDirectorControlArtistAnalize = value!;
                            },readOnly: readOnly),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                    text: "Пятиминутка",
                                    value: fiveMinutes
                            ),
                            ShowCommentWorker(
                              commentValue: commentFiveMinutes,
                            ),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentFiveMinutes,onChanged: (value){
                              commentDirectorFiveMinutes = value!;
                            },
                            readOnly: readOnly,),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                // ANK (211:310)
                                child: const Text(
                                  'Выдача карт:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                                  ShowCheck(
                                    text: '1 карта',
                                    value: firstCard
                            ),
                            ShowCheck(
                                    text: '2 карта',
                                    value: secondCard,
                                  ),
                            ShowCheck(
                                    text: '3 карта',
                                    value: thirdCard
                            ),
                            ShowCommentWorker(commentValue: commentCard),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorCard,onChanged: (value){
                              commentDirectorCard = value!;
                            },
                            readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            const Text(
                                'Контроль:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                  color: Colors.white,
                                ),
                              ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ShowCommentWorker(
                                    commentValue: commentControl1,
                                  ),
                                ),
                                Expanded(flex: 1,
                                  child: ShowCheck(
                                          text: '',
                                          value: control1
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ShowCommentWorker(commentValue: commentControl2,),
                                ),
                                Expanded(flex: 1,
                                  child:ShowCheck(
                                          text: '',
                                          value: control2
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ShowCommentWorker(
                                    commentValue: commentControl3,
                                  ),
                                ),
                                Expanded(flex: 1,
                                  child: ShowCheck(
                                          text: '',
                                          value: control3
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ShowCommentWorker(
                                    commentValue: commentControl4,
                                  ),
                                ),
                                Expanded(flex: 1,
                                  child: ShowCheck(
                                          text: '',
                                          value: control4,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ShowCommentWorker(
                                    commentValue: commentControl5,
                                  ),
                                ),
                                Expanded(flex: 1,
                                        child: ShowCheck(
                                          text: '',
                                          value: control5
                                    ),
                                ),
                              ],
                            ),
                            ShowCheck(
                                    text: 'Составить заявку на игрушки',
                                    value: toyOrder),
                            ShowCommentWorker(commentValue: commentToyOrder,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorToyOrder,onChanged: (value){
                              commentDirectorToyOrder = value!;
                            },
                                readOnly: readOnly),
                        if (widget.post == 'Manager')
                          ElevatedButton(
                            onPressed: () {
                            /// запрос с апдейтом
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