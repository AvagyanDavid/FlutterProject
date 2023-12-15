import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import 'package:test_form/component/checkbox/checkbox.dart';

class ShowBarmanBegin extends StatefulWidget {
  final String formatterdate;
  final String post;
  ShowBarmanBegin({required this.formatterdate,required this.post});

  @override
  _ShowBarmanBeginState createState() => _ShowBarmanBeginState();
}

class _ShowBarmanBeginState extends State<ShowBarmanBegin> {

  TextEditingController commentWorkerSendMessageController = TextEditingController();

  bool readOnly = false;

  bool openCheckout  = false;
  String? commentOpenCheckout;
  String? commentDirectorOpenCheckout;
  bool checkAndTakeAlcogol = false;
  String? commentCheckAndTakeAlcogol;
  String? commentDirectorCheckAndTakeAlcogol;
  bool extractorHumidifier = false;
  String? commentExtractorHumidifier;
  String? commentDirectorExtractorHumidifier;
  bool writeStopList = false;
  String? commentWriteStopList;
  String? commentDirectorWriteStopList;
  bool  rubTheDishes = false;
  String? commentRubTheDishes;
  String? commentDirectorRubTHeDishes;
  bool cleaning = false;
  String? commentCleaning;
  String? commentDirectorCleaning;

  String? PhotoCheckAndTakeAlcogol;
  String? PhotoRubTheDishes;
  String? PhotoCleaning;

  void getData() async {
    final response = await Api().showBarmanBegin(widget.formatterdate);
    openCheckout = response['OpenCheckout']  != 0 ? true : false;
    commentOpenCheckout = response ['Comment_OpenCheckout'] as String?;
    commentDirectorOpenCheckout = response ['CommentDirector_OpenCheckout'] as String?;
    checkAndTakeAlcogol = response['CheckAndTakeAlcogol']  != 0 ? true : false;
    commentCheckAndTakeAlcogol = response ['Comment_CheckAndTakeAlcogol'] as String?;
    commentDirectorCheckAndTakeAlcogol = response ['CommentDirector_CheckAndTakeAlcogol'] as String?;
    extractorHumidifier = response['ExtractorHumidifier']  != 0 ? true : false;
    commentExtractorHumidifier = response ['Comment_ExtractorHumidifier'] as String?;
    commentDirectorExtractorHumidifier = response ['CommentDirector_ExtractorHumidifier'] as String?;
    writeStopList = response['WriteStopList']  != 0 ? true : false;
    commentWriteStopList = response ['Comment_WriteStopList'] as String?;
    commentDirectorWriteStopList = response ['CommentDirector_WriteStopList'] as String?;
    rubTheDishes = response['RubTheDishes']  != 0 ? true : false;
    commentRubTheDishes = response ['Comment_RubTheDishes'] as String?;
    commentDirectorRubTHeDishes = response ['CommentDirector_RubTHeDishes'] as String?;
    cleaning = response['Cleaning']  != 0 ? true : false;
    commentCleaning = response ['Comment_Cleaning'] as String?;
    commentDirectorCleaning = response ['CommentDirector_Cleaning'] as String?;

    PhotoCheckAndTakeAlcogol = response['CheckAndTakeAlcogolPhoto'] == null ? null : Api().getPhoto(response['CheckAndTakeAlcogolPhoto']);
    PhotoRubTheDishes = response['RubTheDishesPhoto'] == null ? null : Api().getPhoto(response['RubTheDishesPhoto']);
    PhotoCleaning = response['CleaningPhoto'] == null ? null : Api().getPhoto(response['CleaningPhoto']);

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
                  // autogrouptfuqVzP (Qd88RFd5Sycz9vo7TbtFuq)
                  padding: const EdgeInsets.fromLTRB(26, 31.5, 0, 62),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // frame6qHZ (211:334)
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
                            CommentDirector(valueDirector: commentDirectorOpenCheckout,
                                onChanged: (value){
                              commentDirectorOpenCheckout = value!;
                                },
                            readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Проверить и принять алкоголь",
                                value: checkAndTakeAlcogol),
                            const SizedBox(height: 20,),
                            ShowPhoto(image: PhotoCheckAndTakeAlcogol),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentCheckAndTakeAlcogol),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorCheckAndTakeAlcogol,
                                onChanged: (value){
                              commentDirectorCheckAndTakeAlcogol = value!;
                                },
                            readOnly: readOnly,),
                            ShowCheck(
                                text: "Включить вытяжку и увлажнитель",
                                value: extractorHumidifier),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentExtractorHumidifier),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorExtractorHumidifier, onChanged: (value){
                              commentDirectorExtractorHumidifier = value!;
                            },
                            readOnly: readOnly,),
                            ShowCheck(
                                text: "Написать стоп лист",
                                value: writeStopList),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentWriteStopList),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorWriteStopList,
                                onChanged: (value){
                              commentDirectorWriteStopList = value!;
                                },
                            readOnly: readOnly,),
                            ShowCheck(
                                text: "Натереть посуду",
                                value: rubTheDishes),
                            const SizedBox(height: 20,),
                            ShowPhoto(image: PhotoRubTheDishes),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentRubTheDishes),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorRubTHeDishes,onChanged: (value){
                              commentDirectorRubTHeDishes = value!;
                            },readOnly: readOnly),
                            /// if (widget.formatterdate.weekday == DateTime.sunday)
                            ///
                            ///
                            ///
                            ShowCheck(
                              text: "Уборка",
                              value: cleaning
                            ),
                            ShowPhoto(image: PhotoCleaning),
                            ShowCommentWorker(commentValue: commentCleaning),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorCleaning, onChanged: (value){
                              commentDirectorCleaning = value!;
                            },
                            readOnly: readOnly,),
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