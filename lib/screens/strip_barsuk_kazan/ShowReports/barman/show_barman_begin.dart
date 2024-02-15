import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import 'package:test_form/component/checkbox/checkbox.dart';

class ShowBarmanBegin extends StatefulWidget {
  final String formatterdate;
  final String post;
  // final int id ; /// id сотрудника

  ShowBarmanBegin({required this.formatterdate, required this.post});

  @override
  _ShowBarmanBeginState createState() => _ShowBarmanBeginState();
}

class _ShowBarmanBeginState extends State<ShowBarmanBegin> {

  TextEditingController commentDirectorOpenCheckout = TextEditingController();
  TextEditingController commentDirectorCheckAndTakeAlcogol = TextEditingController();
  TextEditingController commentDirectorExtractorHumidifier = TextEditingController();
  TextEditingController commentDirectorWriteStopList = TextEditingController();
  TextEditingController commentDirectorRubTHeDishes = TextEditingController();
  TextEditingController commentDirectorCleaning = TextEditingController();
  TextEditingController commentDirectorRubTheDishes = TextEditingController();
  TextEditingController commentDirectorWipeDustSelvingBegin = TextEditingController();

  bool readOnly = false;

  int idWorker = 0;

  bool openCheckout = false;
  String? commentOpenCheckout;
  bool checkAndTakeAlcogol = false;
  String? commentCheckAndTakeAlcogol;
  bool extractorHumidifier = false;
  String? commentExtractorHumidifier;
  bool writeStopList = false;
  String? commentWriteStopList;
  bool rubTheDishes = false;
  String? commentRubTheDishes;
  bool wipeDustSelvingBegin = false;
  String? commentWipeDustSelvingBegin;
  bool cleaning = false;
  String? commentCleaning;

  int statusClean = 0;

  String? photoCheckAndTakeAlcogol;
  String? photoRubTheDishes;
  String? photoCleaning;
  String? photoWipeDustSelvingBegin;

  void getData() async {
    final response = await Api().showBarmanBegin(widget.formatterdate);
    openCheckout = response['OpenCheckout'] != 0 ? true : false;
    commentOpenCheckout = response['Comment_OpenCheckout'] as String?;
    commentDirectorOpenCheckout.text = response['CommentDirector_OpenCheckout'] as String;
    checkAndTakeAlcogol = response['CheckAndTakeAlcogol'] != 0 ? true : false;
    commentCheckAndTakeAlcogol = response['Comment_CheckAndTakeAlcogol'] as String?;
    commentDirectorCheckAndTakeAlcogol.text = response['CommentDirector_CheckAndTakeAlcogol'] as String;
    extractorHumidifier = response['ExtractorHumidifier'] != 0 ? true : false;
    commentExtractorHumidifier = response['Comment_ExtractorHumidifier'] as String?;
    commentDirectorExtractorHumidifier.text = response['CommentDirector_ExtractorHumidifier'] as String;
    writeStopList = response['WriteStopList'] != 0 ? true : false;
    commentWriteStopList = response['Comment_WriteStopList'] as String?;
    commentDirectorWriteStopList.text = response['CommentDirector_WriteStopList'] as String;
    rubTheDishes = response['RubTheDishes'] != 0 ? true : false;
    commentRubTheDishes = response['Comment_RubTheDishes'] as String?;
    commentDirectorRubTHeDishes.text = response['CommentDirector_RubTheDishes'] as String;
    wipeDustSelvingBegin = response['WipeDustShelving'] != 0 ? true : false;
    commentWipeDustSelvingBegin = response['Comment_WipeDustShelving'] as String?;
    commentDirectorWipeDustSelvingBegin.text = response['CommentDirector_WipeDustShelving'] as String;
    cleaning = response['Cleaning'] != 0 ? true : false;
    commentCleaning = response['Comment_Cleaning'] as String?;
    commentDirectorCleaning.text = response['CommentDirector_Cleaning'] as String;

    idWorker = response['Users_idUsers'];

    photoCheckAndTakeAlcogol = response['CheckAndTakeAlcogolPhoto'] == null ? null : Api().getPhoto(response['CheckAndTakeAlcogolPhoto']);
    photoRubTheDishes = response['RubTheDishesPhoto'] == null ? null : Api().getPhoto(response['RubTheDishesPhoto']);
    photoCleaning = response['CleaningPhoto'] == null ? null : Api().getPhoto(response['CleaningPhoto']);
    photoWipeDustSelvingBegin = response['WipeDustSelvingBeginPhoto'] == null ? null : Api().getPhoto(response['WipeDustSelvingBeginPhoto']);

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
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: double.infinity,
          child: Container(
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
                              'Отчет Бармена',
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
                  ShowCheck(text: "Открыть кассовую смену", value: openCheckout),
                  ShowCommentWorker(commentValue: commentOpenCheckout),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(
                    valueDirector: commentDirectorOpenCheckout,
                    readOnly: readOnly,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowCheck(text: "Проверить и принять алкоголь", value: checkAndTakeAlcogol),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowPhoto(image: photoCheckAndTakeAlcogol),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowCommentWorker(commentValue: commentCheckAndTakeAlcogol),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(
                    valueDirector: commentDirectorCheckAndTakeAlcogol,
                    readOnly: readOnly,
                  ),
                  const SizedBox(height: 20,),
                  ShowCheck(text: "Включить вытяжку и увлажнитель", value: extractorHumidifier),
                  ShowCommentWorker(commentValue: commentExtractorHumidifier),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(
                    valueDirector: commentDirectorExtractorHumidifier,
                    readOnly: readOnly,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowCheck(text: "Написать стоп лист", value: writeStopList),
                  ShowCommentWorker(commentValue: commentWriteStopList),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(
                    valueDirector: commentDirectorWriteStopList,
                    readOnly: readOnly,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowCheck(text: "Натереть посуду", value: rubTheDishes),
                  ShowPhoto(image: photoRubTheDishes),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowCommentWorker(commentValue: commentRubTheDishes),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(valueDirector: commentDirectorRubTHeDishes, readOnly: readOnly),
                  const SizedBox(
                    height: 20,
                  ),
                  ShowCheck(
                    text: 'Протереть пыль со стеллажа',
                    value: wipeDustSelvingBegin,
                  ),
                  ShowPhoto(image: photoWipeDustSelvingBegin),
                  ShowCommentWorker(commentValue: commentWipeDustSelvingBegin),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentDirector(valueDirector: commentDirectorWipeDustSelvingBegin, readOnly: readOnly),
                  if (statusClean == 1)
                    Column(
                      children: [
                        ShowCheck(text: "Уборка", value: cleaning),
                        ShowPhoto(image: photoCleaning),
                        ShowCommentWorker(commentValue: commentCleaning),
                        const SizedBox(
                          height: 20,
                        ),
                        CommentDirector(
                          valueDirector: commentDirectorCleaning,
                          readOnly: readOnly,
                        ),
                      ],
                    ),
                  if (widget.post == 'Manager')
                    Column(
                      children: [
                        const SizedBox(height: 20,),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Api().updateBarmanBegin(
                                  commentDirectorOpenCheckout.text, commentDirectorCheckAndTakeAlcogol.text, commentDirectorExtractorHumidifier.text, commentDirectorWriteStopList.text, commentDirectorRubTheDishes.text, commentDirectorWipeDustSelvingBegin.text,commentDirectorCleaning.text,idWorker,widget.formatterdate);
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
