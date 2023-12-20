import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import 'package:test_form/component/checkbox/checkbox.dart';

class ShowBarmanBegin extends StatefulWidget {
  final String formatterdate;
  final int id;
  final String post;
  ShowBarmanBegin({required this.formatterdate,required this.id, required this.post});

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

  bool openCheckout  = false;
  String? commentOpenCheckout;
  bool checkAndTakeAlcogol = false;
  String? commentCheckAndTakeAlcogol;
  bool extractorHumidifier = false;
  String? commentExtractorHumidifier;
  bool writeStopList = false;
  String? commentWriteStopList;
  bool  rubTheDishes = false;
  String? commentRubTheDishes;
  bool wipeDustSelvingBegin = false;
  String? commentWipeDustSelvingBegin;
  bool cleaning = false;
  String? commentCleaning;

  String? photoCheckAndTakeAlcogol;
  String? photoRubTheDishes;
  String? photoCleaning;

  void getData() async {
    final response = await Api().showBarmanBegin(widget.formatterdate);
    openCheckout = response['OpenCheckout']  != 0 ? true : false;
    commentOpenCheckout = response ['Comment_OpenCheckout'] as String?;
    commentDirectorOpenCheckout.text = response ['CommentDirector_OpenCheckout'];
    checkAndTakeAlcogol = response['CheckAndTakeAlcogol']  != 0 ? true : false;
    commentCheckAndTakeAlcogol = response ['Comment_CheckAndTakeAlcogol'] as String?;
    commentDirectorCheckAndTakeAlcogol.text = response ['CommentDirector_CheckAndTakeAlcogol'];
    extractorHumidifier = response['ExtractorHumidifier']  != 0 ? true : false;
    commentExtractorHumidifier = response ['Comment_ExtractorHumidifier'] as String?;
    commentDirectorExtractorHumidifier.text = response ['CommentDirector_ExtractorHumidifier'];;
    writeStopList = response['WriteStopList']  != 0 ? true : false;
    commentWriteStopList = response ['Comment_WriteStopList'] as String?;
    commentDirectorWriteStopList.text = response ['CommentDirector_WriteStopList'];
    rubTheDishes = response['RubTheDishes']  != 0 ? true : false;
    commentRubTheDishes = response ['Comment_RubTheDishes'] as String?;
    commentDirectorRubTHeDishes.text = response ['CommentDirector_RubTHeDishes'];
    wipeDustSelvingBegin = response['WipeDustSelvingBegin'] != 0 ? true : false;
    commentWipeDustSelvingBegin = response['Comment_WipeDustSelvingBegin'] as String?;
    commentDirectorWipeDustSelvingBegin.text = response['CommentDirector_WipeDustSelvingBegin'];
    cleaning = response['Cleaning']  != 0 ? true : false;
    commentCleaning = response ['Comment_Cleaning'] as String?;
    commentDirectorCleaning.text = response ['CommentDirector_Cleaning'];

    photoCheckAndTakeAlcogol = response['CheckAndTakeAlcogolPhoto'] == null ? null : Api().getPhoto(response['CheckAndTakeAlcogolPhoto']);
    photoRubTheDishes = response['RubTheDishesPhoto'] == null ? null : Api().getPhoto(response['RubTheDishesPhoto']);
    photoCleaning = response['CleaningPhoto'] == null ? null : Api().getPhoto(response['CleaningPhoto']);

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
    if(widget.post == 'Onwer'){
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
                                    'Отчет Бармена  ',
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
                                  style:const TextStyle(
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
                                text: "Открыть кассовую смену",
                                value: openCheckout),
                            ShowCommentWorker(commentValue: commentOpenCheckout),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorOpenCheckout,
                              readOnly: readOnly,
                            ),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Проверить и принять алкоголь",
                                value: checkAndTakeAlcogol),
                            const SizedBox(height: 20,),
                            ShowPhoto(image: photoCheckAndTakeAlcogol),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentCheckAndTakeAlcogol),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorCheckAndTakeAlcogol,
                              readOnly: readOnly,
                            ),
                            ShowCheck(
                                text: "Включить вытяжку и увлажнитель",
                                value: extractorHumidifier),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentExtractorHumidifier),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorExtractorHumidifier,
                              readOnly: readOnly,
                            ),
                            ShowCheck(
                                text: "Написать стоп лист",
                                value: writeStopList),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentWriteStopList),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorWriteStopList,
                              readOnly: readOnly,
                            ),
                            ShowCheck(
                                text: "Натереть посуду",
                                value: rubTheDishes),
                            const SizedBox(height: 20,),
                            ShowPhoto(image: photoRubTheDishes),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentRubTheDishes),
                            const SizedBox(height: 20,),
                            CommentDirector(
                                valueDirector: commentDirectorRubTHeDishes,
                                readOnly: readOnly
                            ),

                            ShowCheck(
                              text: 'Протереть пыль со стеллажа',
                              value: ,
                            )



                            /// if (widget.formatterdate.weekday == DateTime.sunday)
                            ///
                            ///
                            ///
                            ошибка допущена специально чтоб привлечь внимание,

                            ShowCheck(
                              text: "Уборка",
                              value: cleaning
                            ),
                            ShowPhoto(image: photoCleaning),
                            ShowCommentWorker(commentValue: commentCleaning),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorCleaning,
                              readOnly: readOnly,
                            ),
                            if (widget.post == 'Manager')
                              ElevatedButton(
                                onPressed: () {
                                  Api().updateBarmanBegin(commentDirectorOpenCheckout.text, commentDirectorCheckAndTakeAlcogol.text, commentDirectorExtractorHumidifier.text, commentDirectorWriteStopList.text, commentDirectorRubTheDishes.text, commentDirectorWipeDustSelvingBegin.text, commentDirectorCleaning.text, widget.id, widget.formatterdate);
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