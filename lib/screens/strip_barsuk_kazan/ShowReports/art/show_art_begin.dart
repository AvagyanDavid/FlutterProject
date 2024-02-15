import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import '../../../../component/checkbox/checkbox.dart';

class ShowArtBegin extends StatefulWidget {
  final String formatterdate;
  final String post;
  ShowArtBegin({required this.formatterdate,required this.post});
  @override
  _ShowArtBeginState createState() => _ShowArtBeginState();
}

class _ShowArtBeginState extends State<ShowArtBegin> {

  TextEditingController commentDirectorListArtist = TextEditingController();
  TextEditingController commentDirectorReadiness = TextEditingController();
  TextEditingController commentDirectorSendListOfGirls = TextEditingController();
  TextEditingController commentDirectorListDJ = TextEditingController();
  TextEditingController commentDirectorAnalyzeGraph = TextEditingController();
  TextEditingController commentDirectorControlArtistAnalize = TextEditingController();
  TextEditingController commentDirectorFiveMinutes = TextEditingController();
  TextEditingController commentDirectorCard = TextEditingController();
  TextEditingController commentDirectorToyOrder = TextEditingController();

  bool readOnly = false;

  int idWorker = 0;

  bool listArtist = false;
  String? commentListArtist;
  bool readiness = false;
  String? commentReadiness;
  bool sendListOfGirls = false;
  String? commentSendListOfGirls;
  bool listDJ = false;
  String? commentListDJ;
  bool analyzeGraph = false;
  String? commentAnalyzeGraph;
  bool controlArtistAnalize = false;
  String? commentControlArtistAnalize;
  bool fiveMinutes = false;
  String? commentFiveMinutes;
  bool firstCard = false;
  bool secondCard = false;
  bool thirdCard = false;
  String? commentCard;
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

  void getData() async{
    final response = await Api().showArtBegin(widget.formatterdate);
    listArtist = response['ListArtist'] != 0 ? true : false;
    commentListArtist = response['Comment_ListArtist'] as String?;
    commentDirectorListArtist.text = response['CommentDirector_ListArtist'] as String;
    readiness = response['Readiness'] != 0 ? true : false;
    commentReadiness = response['Comment_Readiness'] as String?;
    commentDirectorReadiness.text = response['CommentDirector_Readiness'] as String;
    sendListOfGirls= response['SendListOfGirls'] != 0 ? true : false;
    commentSendListOfGirls = response['Comment_SendListOfGirls'] as String?;
    commentDirectorSendListOfGirls.text = response['CommentDirector_SendListOfGirls'] as String;
    listDJ = response['ListDJ'] != 0 ? true : false;
    commentListDJ = response['Comment_ListDJ'] as String?;
    commentDirectorListDJ.text = response['CommentDirector_ListDJ'] as String;
    analyzeGraph= response['AnalyzeGraph'] != 0 ? true : false;
    commentAnalyzeGraph = response['Comment_AnalyzeGraph'] as String?;
    commentDirectorAnalyzeGraph.text = response['CommentDirector_AnalyzeGraph'] as String;
    controlArtistAnalize = response['ControlArtistAnalize'] != 0 ? true : false;
    commentControlArtistAnalize = response['Comment_ControlArtistAnalize'] as String?;
    commentDirectorControlArtistAnalize.text = response['CommentDirector_ControlArtistAnalize'] as String;
    fiveMinutes = response['FiveMinutes'] != 0 ? true : false;
    commentFiveMinutes = response['Comment_FiveMinutes'] as String?;
    commentDirectorFiveMinutes.text = response['CommentDirector_FiveMinutes'] as String;
    firstCard = response['FirstCard'] != 0 ? true : false;
    secondCard = response['SecondCard'] != 0 ? true : false;
    thirdCard = response['ThirdCard'] != 0 ? true : false;
    commentCard = response['Comment_Card'] as String?;
    commentDirectorCard.text = response['CommentDirector_Card'] as String;
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
    commentDirectorToyOrder.text = response['CommentDirector_ToyOrder'] as String;

    idWorker = response['Users_idUsers'];
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                          height: 150,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset("assets/emblem.png")),
                        ),
                      ],
                    ),
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
                  margin: const EdgeInsets.fromLTRB(14, 0, 19, 56),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShowCheck(
                                      text: 'Составить список артисток на смене',
                                      value: listArtist
                            ),
                            ShowCommentWorker(commentValue: commentListArtist,),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorListArtist,
                              readOnly: readOnly,
                            ),
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
                            CommentDirector(
                              valueDirector: commentDirectorReadiness,
                              readOnly: readOnly,
                            ),
                            ShowCheck(
                                    text: 'Скинуть список девочек в чат Арт ',
                                    value: sendListOfGirls
                            ),
                            ShowCommentWorker(
                              commentValue: commentSendListOfGirls,
                            ),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorSendListOfGirls,
                              readOnly: readOnly,
                            ),
                            ShowCheck(
                                    text: 'Составить список для диджея ',
                                    value: listDJ
                            ),
                            ShowCommentWorker(
                              commentValue: commentListDJ,
                            ),
                            const SizedBox(height: 10),
                            CommentDirector(
                              valueDirector: commentDirectorListDJ,
                              readOnly: readOnly,
                            ),
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
                            CommentDirector(
                              valueDirector: commentDirectorAnalyzeGraph,
                              readOnly: readOnly,
                            ),
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
                            CommentDirector(
                                valueDirector: commentDirectorControlArtistAnalize,
                                readOnly: readOnly
                            ),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                    text: "Пятиминутка",
                                    value: fiveMinutes
                            ),
                            ShowCommentWorker(
                              commentValue: commentFiveMinutes,
                            ),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorFiveMinutes,
                              readOnly: readOnly,
                            ),
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
                            CommentDirector(
                              valueDirector: commentDirectorCard,
                              readOnly: readOnly,
                            ),
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
                            CommentDirector(
                                valueDirector: commentDirectorToyOrder,
                                readOnly: readOnly
                            ),
                        if (widget.post == 'Manager')
                          Column(
                            children: [
                              const SizedBox(height: 20,),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Api().updateDirectorArtBegin(commentDirectorListArtist.text, commentDirectorReadiness.text, commentDirectorSendListOfGirls.text, commentDirectorListDJ.text, commentDirectorAnalyzeGraph.text, commentDirectorControlArtistAnalize.text, commentDirectorFiveMinutes.text, commentDirectorCard.text, commentDirectorToyOrder.text, idWorker, widget.formatterdate);
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[800],
                                  ),
                                  child: const Text('Отправить комментарии')
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