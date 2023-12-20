import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import '../../../../component/checkbox/checkbox.dart';

class ShowWaiterEnd extends StatefulWidget {
  final String formatterdate;
  final int id;
  final String post;
  
  ShowWaiterEnd({required this.formatterdate,required this.id, required this.post});
  
  @override
  _ShowWaiterEndState createState() => _ShowWaiterEndState();
}

class _ShowWaiterEndState extends State<ShowWaiterEnd> {

  TextEditingController commentDirectorChargerCandle = TextEditingController();
  TextEditingController commentDirectorFixOttomansAndTables = TextEditingController();
  TextEditingController commentDirectorCleanTables = TextEditingController();
  TextEditingController commentDirectorPutAwayTheNapkins = TextEditingController();

  bool readOnly = false;

  bool chargerCandle = false;
  String? commentChargerCandle;
  bool fixOttomansAndTables = false;
  String? commentFixOttomansAndTables;
  bool cleanTables = false;
  String? commentCleanTables;
  bool putAwayTheNapkins = false;
  String? commentPutAwayTheNapkins;

  void getData() async{
    final response = await Api().showWaiterEnd(widget.formatterdate);
    chargerCandle = response['ChargerCandle'] != 0 ? true : false;
    commentChargerCandle = response['Comment_ChargerCandle'] as String?;
    commentDirectorChargerCandle.text = response['CommentDirector_ChargerCandle'];
    fixOttomansAndTables = response['FixOttomansAndTables'] != 0 ? true : false;
    commentFixOttomansAndTables = response['Comment_FixOttomansAndTables'] as String?;
    commentDirectorFixOttomansAndTables.text = response['CommentDirector_FixOttomansAndTables'];
    cleanTables = response['CleanTables'] != 0 ? true : false;
    commentCleanTables = response['Comment_CleanTables'] as String?;
    commentDirectorCleanTables.text = response['CommentDirector_CleanTables'];
    putAwayTheNapkins = response['PutAwayTheNapkins'] != 0 ? true : false;
    commentPutAwayTheNapkins = response['Comment_PutAwayTheNapkins'] as String?;
    commentDirectorPutAwayTheNapkins.text = response['CommentDirector_PutAwayTheNapkins'];

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
    if(widget.post == 'Owner'){
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
                                    'Отчет Официанта',
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
                                text: "Убрать на зарядку свечи",
                                value: chargerCandle),
                            ShowCommentWorker(commentValue: commentChargerCandle,),
                            const SizedBox(
                              height: 20,
                            ),
                            ShowCheck(
                                text: "Поправить пуфы и столики",
                                value: fixOttomansAndTables),
                            ShowCommentWorker(commentValue: commentFixOttomansAndTables,),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Протереть столы",
                                value: cleanTables),
                            ShowCommentWorker(commentValue: commentCleanTables),
                            // CommentDirector(valueDirector: commentDirectorSendMessage),
                            ShowCheck(
                                text: "Убрать все салфетки (которыми протирали пилон) от зеркала",
                                value: putAwayTheNapkins),
                            ShowCommentWorker(commentValue: commentPutAwayTheNapkins),
                            if (widget.post == 'Manager')
                              ElevatedButton(
                                onPressed: () {
                                  Api().updateWaiterEnd(commentDirectorChargerCandle.text, commentDirectorFixOttomansAndTables.text, commentDirectorCleanTables.text, commentDirectorPutAwayTheNapkins.text, widget.id, widget.formatterdate);
                                },
                                child: const Text('Отправить комментарии'),
                              )
                            else 
                              ElevatedButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: const Text('Выйти'))
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