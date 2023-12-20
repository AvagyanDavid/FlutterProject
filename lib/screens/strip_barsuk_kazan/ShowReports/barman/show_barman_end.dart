import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import 'package:test_form/component/checkbox/checkbox.dart';

class ShowBarmanEnd extends StatefulWidget {
  final String formatterdate;
  final int id;
  final String post;
  
  ShowBarmanEnd({required this.formatterdate,required this.id, required this.post});

  @override
  _ShowBarmanEndState createState() => _ShowBarmanEndState();
}

class _ShowBarmanEndState extends State<ShowBarmanEnd> {

  TextEditingController commentDirectorApplication = TextEditingController();
  TextEditingController commentDirectorFillOutReport = TextEditingController();
  TextEditingController commentDirectorCloseShift = TextEditingController();
  TextEditingController commentDirectorCleanlinessWorkplace = TextEditingController();
  TextEditingController commentDirectorWipeDustShelvingEnd = TextEditingController();

  bool readOnly = false;
  bool enabled = true;

  bool alcogol  = false;
  bool nonAlcogol  = false;
  bool tobacco  = false;
  String? commentApplication;
  bool fillOutReport = false;
  String? commentFillOutReport;
  bool closeShift = false;
  String? commentCloseShift;
  bool cleanlinessWorkplace = false;
  String? commentCleanlinessWorkplace;
  bool wipeDustShelvingEnd = false;
  String? commentWipeDustShelvingEnd;
  
  String? photoCleanlinessWorkplace;
  String? photoWipeDustShelvingEnd;

  void getData() async {
    final response = await Api().showBarmanEnd(widget.formatterdate);
    alcogol = response['Alcogol'] != 0 ? true : false;
    nonAlcogol = response['NonAlcogol'] != 0 ? true : false;
    tobacco = response['Tobacco'] != 0 ? true : false;
    commentApplication = response['Comment_Application'] as String?;
    commentDirectorApplication.text = response['CommentDirector_Application'];
    fillOutReport = response['FillOutReport'] != 0 ? true : false;
    commentFillOutReport = response['CommentFillOutReport'] as String?;
    commentDirectorFillOutReport.text = response['CommentDirector_FillOutReport'];
    closeShift = response['CloseShift'] != 0 ? true : false;
    commentCloseShift = response['Comment_CloseShift'] as String?;
    commentDirectorCloseShift.text = response['CommentDirector_CloseShift'];
    wipeDustShelvingEnd = response['WipeDustShelvingEnd'] != 0 ? true : false;
    commentWipeDustShelvingEnd = response['Comment_WipeDustShelvingEnd'] as String?;
    commentDirectorWipeDustShelvingEnd.text = response['CommentDirector_WipeDustShelvingEnd'];
    cleanlinessWorkplace= response['CleanlinessWorkplace'] != 0 ? true : false;
    commentCleanlinessWorkplace = response['Comment_CleanlinessWorkplace'] as String?;
    commentDirectorCleanlinessWorkplace.text = response['CommentDirector_CleanlinessWorkplace'];

    photoWipeDustShelvingEnd = response['WipeDustShelvingEndPhoto'] == null ? null : Api().getPhoto(response['WipeDustShelvingEndPhoto']);
    photoCleanlinessWorkplace = response['CleanlinessWorkplacePhoto'] == null ? null : Api().getPhoto(response['CleanlinessWorkplacePhoto']);
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
                                    'Отчет Бармена',
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
                            const SizedBox(
                              child:  Text(
                                'Составить заявку:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ShowCheck(
                                text: "Алкоголь",
                                value: alcogol),
                            const SizedBox(
                              height: 20,
                            ),
                            ShowCheck(
                                text: "Б/а",
                                value: nonAlcogol),
                            ShowCheck(
                                text: "Табак",
                                value: tobacco),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentApplication),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorApplication,
                              readOnly: readOnly,
                            ),
                            ShowCheck(
                                text: "Заполнить отчет",
                                value: fillOutReport),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentFillOutReport),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorFillOutReport,
                              readOnly: readOnly,
                            ),
                            ShowCheck(
                                text: "Закрыть смену",
                                value: closeShift),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentCloseShift),
                            const SizedBox(height: 20,),
                            CommentDirector(
                                valueDirector: commentDirectorCloseShift,
                                readOnly: readOnly
                            ),
                            const SizedBox(height: 20,),
                            ShowCheck(text: 'Протереть пыль со стеллажа', value: wipeDustShelvingEnd),
                            ShowPhoto(image: photoWipeDustShelvingEnd),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentWipeDustShelvingEnd),
                            CommentDirector(valueDirector: commentDirectorWipeDustShelvingEnd, readOnly: readOnly,),
                            ShowCheck(
                                text: "Навести порядок на рабочем месте",
                                value: cleanlinessWorkplace
                            ),
                            const SizedBox(height: 20,),
                            ShowPhoto(image: photoCleanlinessWorkplace),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentCleanlinessWorkplace),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorCleanlinessWorkplace,
                              readOnly: readOnly,
                            ),
                            if (widget.post == 'Manager')
                              ElevatedButton(
                                onPressed: () {
                                  Api().updateBarmanEnd(commentDirectorApplication.text, commentDirectorFillOutReport.text, commentDirectorCloseShift.text, commentDirectorCleanlinessWorkplace.text, commentDirectorWipeDustShelvingEnd.text, widget.id, widget.formatterdate);
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