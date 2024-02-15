import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import '../../../../component/checkbox/checkbox.dart';

class ShowWaiterEnd extends StatefulWidget {
  final String formatterdate;
  final String post;

  ShowWaiterEnd({required this.formatterdate, required this.post});

  @override
  _ShowWaiterEndState createState() => _ShowWaiterEndState();
}

class _ShowWaiterEndState extends State<ShowWaiterEnd> {
  TextEditingController commentDirectorChargerCandle = TextEditingController();
  TextEditingController commentDirectorFixOttomansAndTables = TextEditingController();
  TextEditingController commentDirectorCleanTables = TextEditingController();
  TextEditingController commentDirectorPutAwayTheNapkins = TextEditingController();

  bool readOnly = false;

  int idWorker = 0;

  bool chargerCandle = false;
  String? commentChargerCandle;
  bool fixOttomansAndTables = false;
  String? commentFixOttomansAndTables;
  bool cleanTables = false;
  String? commentCleanTables;
  bool putAwayTheNapkins = false;
  String? commentPutAwayTheNapkins;

  void getData() async {
    final response = await Api().showWaiterEnd(widget.formatterdate);
    chargerCandle = response['ChargerCandle'] != 0 ? true : false;
    commentChargerCandle = response['Comment_ChargerCandle'] as String?;
    commentDirectorChargerCandle.text = response['CommentDirector_ChargerCandle'] as String;
    fixOttomansAndTables = response['FixOttomansAndTables'] != 0 ? true : false;
    commentFixOttomansAndTables = response['Comment_FixOttomansAndTables'] as String?;
    commentDirectorFixOttomansAndTables.text = response['CommentDirector_FixOttomansAndTables']  as String;
    cleanTables = response['CleanTables'] != 0 ? true : false;
    commentCleanTables = response['Comment_CleanTables'] as String?;
    commentDirectorCleanTables.text = response['CommentDirector_CleanTables']  as String;
    putAwayTheNapkins = response['PutAwayTheNapkins'] != 0 ? true : false;
    commentPutAwayTheNapkins = response['Comment_PutAwayTheNapkins'] as String?;
    commentDirectorPutAwayTheNapkins.text = response['CommentDirector_PutAwayTheNapkins']  as String;

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
    if (widget.post == 'Owner') {
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
                  width: 173,
                  height: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 7.61),
                    width: double.infinity,
                    height: 63.17,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: SingleChildScrollView(
                            child: SizedBox(
                              width: 200,
                              child: Text(
                                'Отчет Официанта',
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
                ),
                SizedBox(
                  width: 100,
                  height: 150,
                  child: Align(alignment: Alignment.topRight, child: Image.asset("assets/emblem.png")),
                ),
              ],
            ),
          ),
        ),
        const Text(
            'Конец смены',
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
              padding: const EdgeInsets.fromLTRB(0, 31.5, 0, 62),
              margin: const EdgeInsets.fromLTRB(14, 0, 19, 56),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowCheck(text: "Убрать на зарядку свечи", value: chargerCandle),
                  ShowCommentWorker(commentValue: commentChargerCandle,),
                  const SizedBox(height: 20,),
                  CommentDirector(valueDirector: commentDirectorChargerCandle, readOnly: readOnly),
                  const SizedBox(height: 20,),
                  ShowCheck(text: "Поправить пуфы и столики", value: fixOttomansAndTables),
                  ShowCommentWorker(commentValue: commentFixOttomansAndTables,),
                  const SizedBox(height: 20,),
                  CommentDirector(valueDirector: commentDirectorFixOttomansAndTables, readOnly: readOnly),
                  const SizedBox(height: 20,),
                  ShowCheck(text: "Протереть столы", value: cleanTables),
                  ShowCommentWorker(commentValue: commentCleanTables),
                  const SizedBox(height: 20,),
                  CommentDirector(valueDirector: commentDirectorCleanTables, readOnly: readOnly),
                  const SizedBox(height: 20,),
                  ShowCheck(text: "Убрать все салфетки (которыми протирали пилон) от зеркала", value: putAwayTheNapkins),
                  ShowCommentWorker(commentValue: commentPutAwayTheNapkins),
                  const SizedBox(height: 20,),
                  CommentDirector(valueDirector: commentDirectorPutAwayTheNapkins, readOnly: readOnly),
                  if (widget.post == 'Manager')
                    ElevatedButton(
                      onPressed: () {
                        Api().updateWaiterEnd(commentDirectorChargerCandle.text, commentDirectorFixOttomansAndTables.text,
                            commentDirectorCleanTables.text, commentDirectorPutAwayTheNapkins.text, idWorker, widget.formatterdate);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[800],
                      ),
                      child: const Text('Отправить комментарии'),
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
                              child: const Text('Выйти')),
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