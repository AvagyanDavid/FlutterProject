import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import '../../../../component/checkbox/checkbox.dart';

class ShowWaiterBegin extends StatefulWidget {
  final String formatterdate;
  final String post;
  ShowWaiterBegin({required this.formatterdate, required this.post});
  @override
  _ShowWaiterBeginState createState() => _ShowWaiterBeginState();
}

class _ShowWaiterBeginState extends State<ShowWaiterBegin> {

  TextEditingController commentWorkerSendMessageController = TextEditingController();

  bool readOnly = false;

  bool tableArrangement = false;
  String? commentTableArrangment;
  String? commentDirectorTableArrangment;
  bool wipeTheTables = false;
  String? commentWipeTheTables;
  String? commentDirectorWipeTheTables;
  bool  inspectionOfTheHall = false;
  String? commentInspectionOfTheHall;
  String? commentDirectorInspectionOfTheHall;
  bool arrangeOttomans = false;
  String? commentArrangeOttomans;
  String? commentDirectorArrangeOttomans;
  bool putEverythingOnTheTables = false;
  String? commentPutEverithingOnTheTables;
  String? commentDirectorPutEverithingOnTheTables;
  bool wipeMenu = false;
  String? commentWipeMenu;
  String? commentDirectorWipeMenu;
  bool cleanWineCabinet = false;
  String? commentCleanWineCabinet;
  String? commentDirectorCleanWineCabinet;
  bool fillTheNapkinHolder = false;
  String? commentFillTheNapkinHolder;
  String? commentDirectorFillTheNapkinHolder;
  bool garbageEmpty = false;
  String? commentGarbageEmpty;
  String? commentDirectorGarbageEmpty;
  bool passDishesKitchen = false;
  String? commentPassDishesKitchen;
  String? commentDirectorPassDishesKitchen;
  bool requestStartAndStopList = false;
  String? commentRequestStartAndStopList;
  String? commentDirectorRequestStartAndStopList;
  bool cleanHumidor = false;
  String? commentCleanHumidor;
  String? commentDirectorCleanHumidor;

  String? PhotoTableArrangement;
  String? PhotoWipeTheTables;
  String? PhotoInspectionOfTheHall;
  String? PhotoArrangeOttomans;
  String? PhotoPutEverythingOnTheTables;
  String? PhotoWipeMenu;

  void getData() async{
    final response = await Api().showWaiterBegin(widget.formatterdate);
    tableArrangement = response['TableArrangement'] != 0 ? true : false;
    commentTableArrangment = response['Comment_TableArrangment'] as String?;
    commentDirectorTableArrangment = response['CommentDirector_TableArrangment'] as String?;
    wipeTheTables = response['WipeTheTables'] != 0 ? true : false;
    commentWipeTheTables = response['Comment_WipeTheTables'] as String?;
    commentDirectorWipeTheTables = response['CommentDirector_WipeTheTables'] as String?;
    inspectionOfTheHall = response['InspectionOfTheHall'] != 0 ? true : false;
    commentInspectionOfTheHall = response['Comment_InspectionOfTheHall'] as String?;
    commentDirectorInspectionOfTheHall = response['CommentDirector_InspectionOfTheHall'] as String?;
    arrangeOttomans = response['ArrangeOttomans'] != 0 ? true : false;
    commentArrangeOttomans = response['Comment_ArrangeOttomans'] as String?;
    commentDirectorArrangeOttomans = response['CommentDirector_ArrangeOttomans'] as String?;
    putEverythingOnTheTables = response['PutEverythingOnTheTables'] != 0 ? true : false;
    commentPutEverithingOnTheTables = response['Comment_PutEverithingOnTheTables'] as String?;
    commentDirectorPutEverithingOnTheTables = response['CommentDirector_PutEverithingOnTheTables'] as String?;
    wipeMenu = response['WipeMenu'] != 0 ? true : false;
    commentWipeMenu = response['Comment_WipeMenu'] as String?;
    commentDirectorWipeMenu = response['CommentDirector_WipeMenu'] as String?;
    cleanWineCabinet = response ['CleanWineCabinet'] != 0 ? true : false;
    commentCleanWineCabinet = response['Comment_CleanWineCabinet'] as String?;
    commentDirectorCleanWineCabinet = response['CommentDirector_CleanWineCabinet'] as String?;
    fillTheNapkinHolder = response ['FillTheNapkinHolder'] != 0 ? true : false;
    commentFillTheNapkinHolder = response['Comment_FillTheNapkinHolder'] as String?;
    commentDirectorFillTheNapkinHolder = response['CommentDirector_FillTheNapkinHolder'] as String?;
    garbageEmpty = response ['GarbageEmpty'] != 0 ? true : false;
    commentGarbageEmpty = response['Comment_GarbageEmpty'] as String?;
    commentDirectorGarbageEmpty = response['CommentDirector_GarbageEmpty'] as String?;
    passDishesKitchen = response ['PassDishesKitchen'] != 0 ? true : false;
    commentPassDishesKitchen = response['Comment_PassDishesKitchen'] as String?;
    commentDirectorPassDishesKitchen = response['CommentDirector_PassDishesKitchen'] as String?;
    requestStartAndStopList = response['RequestStartAndStopList'] != 0 ? true : false;
    commentRequestStartAndStopList = response['Comment_RequestStartAndStopList'] as String?;
    commentDirectorRequestStartAndStopList = response['CommentDirector_RequestStartAndStopList'] as String?;
    cleanHumidor = response['CleanHumidor'] != 0 ? true : false;
    commentCleanHumidor = response['Comment_CleanHumidor'] as String?;
    commentDirectorCleanHumidor = response['CommentDirector_CleanHumidor'] as String?;

    PhotoTableArrangement = response['TableArrangementPhoto'] == null ? null : Api().getPhoto(response['TableArrangementPhoto']);
    PhotoWipeTheTables = response['WipeTheTablesPhoto'] == null ? null : Api().getPhoto(response['WipeTheTablesPhoto']);
    PhotoInspectionOfTheHall = response['InspectionOfTheHallPhoto'] == null ? null : Api().getPhoto(response['InspectionOfTheHallPhoto']);
    PhotoArrangeOttomans = response['ArrangeOttomansPhoto'] == null ? null : Api().getPhoto(response['ArrangeOttomansPhoto']);
    PhotoPutEverythingOnTheTables = response['PutEverythingOnTheTablesPhoto'] == null ? null : Api().getPhoto(response['PutEverythingOnTheTablesPhoto']);
    PhotoWipeMenu = response['WipeMenuPhoto'] == null ? null : Api().getPhoto(response['WipeMenuPhoto']);

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
                'Смена:',
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
                          /// verticalDirection: VerticalDirection.down,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Порядок в зале:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Расставить столы на равном расстоянии от диванов",
                                value: tableArrangement),
                            const SizedBox(height: 20,),
                            ShowPhoto(image: PhotoTableArrangement),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentTableArrangment,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorTableArrangment,onChanged: (value){
                              commentDirectorTableArrangment = value!;
                            }, readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Протереть столы во всех местах",
                                value: wipeTheTables),
                            const SizedBox(height: 20,),
                            ShowPhoto(image: PhotoWipeTheTables),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentWipeTheTables,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorWipeTheTables,onChanged: (value){
                              commentDirectorWipeTheTables = value!;
                            }, readOnly: readOnly,
                            ),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Осмотреть зал на предмет мелкого мусора. При необходимость убрать",
                                value: inspectionOfTheHall),
                            const SizedBox(height: 20,),
                            ShowPhoto(image: PhotoInspectionOfTheHall),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentInspectionOfTheHall),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorInspectionOfTheHall, onChanged: (value){
                              commentDirectorInspectionOfTheHall = value!;
                            },readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Расставить ровно все пуфики",
                                value: arrangeOttomans),
                            const SizedBox(height: 20,),
                            ShowPhoto(image: PhotoArrangeOttomans),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentArrangeOttomans),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorArrangeOttomans,onChanged: (value){
                              commentDirectorArrangeOttomans = value!;
                            },readOnly: readOnly,
                            ),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Выставить все ровно на столах: салфетницы справа от кнопки, свечи слева от кнопки и крейзи меню слева от свечи",
                                value: putEverythingOnTheTables),
                            const SizedBox(height: 20,),
                            ShowPhoto(image: PhotoPutEverythingOnTheTables),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentPutEverithingOnTheTables,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorPutEverithingOnTheTables,onChanged: (value){
                              commentDirectorPutEverithingOnTheTables = value!;
                            },readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Протереть все крейзи меню и меню бара",
                                value: wipeMenu),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentWipeMenu,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorWipeMenu,onChanged: (value){
                              commentDirectorWipeMenu = value!;
                            },readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Протереть винный шкаф",
                                value: cleanWineCabinet),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentCleanWineCabinet,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorCleanWineCabinet,
                              onChanged: (value){
                                commentDirectorCleanWineCabinet = value!;
                              }, readOnly: readOnly,
                            ),
                            ShowCheck(
                                text: "Заполнить все салфетницы",
                                value: fillTheNapkinHolder),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentFillTheNapkinHolder,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorFillTheNapkinHolder,onChanged: (value){
                              commentDirectorFillTheNapkinHolder = value!;
                            },readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Ведерко для муссора должно быть пустым",
                                value: garbageEmpty),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentGarbageEmpty,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorGarbageEmpty,onChanged: (value){
                              commentDirectorGarbageEmpty = value!;
                            },readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Передать посуду на кухню",
                                value: passDishesKitchen),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentPassDishesKitchen,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorPassDishesKitchen,onChanged: (value){
                              commentDirectorPassDishesKitchen = value!;
                            },readOnly: readOnly,),
                            ShowCheck(
                                text: "Запросить стоп-лист и старт-лист по кухне и бару",
                                value: requestStartAndStopList),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentRequestStartAndStopList,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorRequestStartAndStopList,onChanged: (value){
                              commentDirectorRequestStartAndStopList = value!;
                            },readOnly: readOnly,),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Протереть хьюмидор и поднять в нем влажность",
                                value: cleanHumidor),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentCleanHumidor,),
                            const SizedBox(height: 20,),
                            CommentDirector(valueDirector: commentDirectorCleanHumidor,onChanged: (value){
                              commentDirectorCleanHumidor = value!;
                            },readOnly: readOnly,),
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