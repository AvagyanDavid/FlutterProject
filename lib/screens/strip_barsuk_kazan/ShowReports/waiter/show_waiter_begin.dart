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
  TextEditingController commentDirectorTableArrangment = TextEditingController();
  TextEditingController commentDirectorWipeTheTables = TextEditingController();
  TextEditingController commentDirectorInspectionOfTheHall = TextEditingController();
  TextEditingController commentDirectorArrangeOttomans = TextEditingController();
  TextEditingController commentDirectorPutEverithingOnTheTables = TextEditingController();
  TextEditingController commentDirectorWipeMenu = TextEditingController();
  TextEditingController commentDirectorCleanWineCabinet = TextEditingController();
  TextEditingController commentDirectorFillTheNapkinHolder = TextEditingController();
  TextEditingController commentDirectorGarbageEmpty = TextEditingController();
  TextEditingController commentDirectorPassDishesKitchen = TextEditingController();
  TextEditingController commentDirectorRequestStartAndStopList = TextEditingController();
  TextEditingController commentDirectorCleanHumidor = TextEditingController();

  bool readOnly = false;

  int idWorker = 0;

  bool tableArrangement = false;
  String? commentTableArrangment;
  bool wipeTheTables = false;
  String? commentWipeTheTables;
  bool inspectionOfTheHall = false;
  String? commentInspectionOfTheHall;
  bool arrangeOttomans = false;
  String? commentArrangeOttomans;
  bool putEverythingOnTheTables = false;
  String? commentPutEverithingOnTheTables;
  bool wipeMenu = false;
  String? commentWipeMenu;
  bool cleanWineCabinet = false;
  String? commentCleanWineCabinet;
  bool fillTheNapkinHolder = false;
  String? commentFillTheNapkinHolder;
  bool garbageEmpty = false;
  String? commentGarbageEmpty;
  bool passDishesKitchen = false;
  String? commentPassDishesKitchen;
  bool requestStartAndStopList = false;
  String? commentRequestStartAndStopList;
  bool cleanHumidor = false;
  String? commentCleanHumidor;

  String? photoTableArrangement;
  String? photoWipeTheTables;
  String? photoInspectionOfTheHall;
  String? photoArrangeOttomans;
  String? photoPutEverythingOnTheTables;
  String? photoWipeMenu;

  void getData() async {
    final response = await Api().showWaiterBegin(widget.formatterdate);
    tableArrangement = response['TableArrangement'] != 0 ? true : false;
    commentTableArrangment = response['Comment_TableArrangment'] as String?;
    commentDirectorTableArrangment.text = response['CommentDirector_TableArrangment'] as String;
    wipeTheTables = response['WipeTheTables'] != 0 ? true : false;
    commentWipeTheTables = response['Comment_WipeTheTables'] as String?;
    commentDirectorWipeTheTables.text = response['CommentDirector_WipeTheTables'] as String;
    inspectionOfTheHall = response['InspectionOfTheHall'] != 0 ? true : false;
    commentInspectionOfTheHall = response['Comment_InspectionOfTheHall'] as String?;
    commentDirectorInspectionOfTheHall.text = response['CommentDirector_InspectionOfTheHall'] as String;
    arrangeOttomans = response['ArrangeOttomans'] != 0 ? true : false;
    commentArrangeOttomans = response['Comment_ArrangeOttomans'] as String?;
    commentDirectorArrangeOttomans.text = response['CommentDirector_ArrangeOttomans'] as String;
    putEverythingOnTheTables = response['PutEverythingOnTheTables'] != 0 ? true : false;
    commentPutEverithingOnTheTables = response['Comment_PutEverithingOnTheTables'] as String?;
    commentDirectorPutEverithingOnTheTables.text = response['CommentDirector_PutEverithingOnTheTables'] as String;
    wipeMenu = response['WipeMenu'] != 0 ? true : false;
    commentWipeMenu = response['Comment_WipeMenu'] as String?;
    commentDirectorWipeMenu.text = response['CommentDirector_WipeMenu'] as String;
    cleanWineCabinet = response['CleanWineCabinet'] != 0 ? true : false;
    commentCleanWineCabinet = response['Comment_CleanWineCabinet'] as String?;
    commentDirectorCleanWineCabinet.text = response['CommentDirector_CleanWineCabinet'] as String;
    fillTheNapkinHolder = response['FillTheNapkinHolder'] != 0 ? true : false;
    commentFillTheNapkinHolder = response['Comment_FillTheNapkinHolder'] as String?;
    commentDirectorFillTheNapkinHolder.text = response['CommentDirector_FillTheNapkinHolder'] as String;
    garbageEmpty = response['GarbageEmpty'] != 0 ? true : false;
    commentGarbageEmpty = response['Comment_GarbageEmpty'] as String?;
    commentDirectorGarbageEmpty.text = response['CommentDirector_GarbageEmpty'] as String;
    passDishesKitchen = response['PassDishesKitchen'] != 0 ? true : false;
    commentPassDishesKitchen = response['Comment_PassDishesKitchen'] as String?;
    commentDirectorPassDishesKitchen.text = response['CommentDirector_PassDishesKitchen'] as String;
    requestStartAndStopList = response['RequestStartAndStopList'] != 0 ? true : false;
    commentRequestStartAndStopList = response['Comment_RequestStartAndStopList'] as String?;
    commentDirectorRequestStartAndStopList.text = response['CommentDirector_RequestStartAndStopList'] as String;
    cleanHumidor = response['CleanHumidor'] != 0 ? true : false;
    commentCleanHumidor = response['Comment_CleanHumidor'] as String?;
    commentDirectorCleanHumidor.text = response['CommentDirector_CleanHumidor'] as String;

    idWorker = response['Users_idUsers'];

    photoTableArrangement = response['TableArrangementPhoto'] == null ? null : Api().getPhoto(response['TableArrangementPhoto']);
    photoWipeTheTables = response['WipeTheTablesPhoto'] == null ? null : Api().getPhoto(response['WipeTheTablesPhoto']);
    photoInspectionOfTheHall = response['InspectionOfTheHallPhoto'] == null ? null : Api().getPhoto(response['InspectionOfTheHallPhoto']);
    photoArrangeOttomans = response['ArrangeOttomansPhoto'] == null ? null : Api().getPhoto(response['ArrangeOttomansPhoto']);
    photoPutEverythingOnTheTables = response['PutEverythingOnTheTablesPhoto'] == null ? null : Api().getPhoto(response['PutEverythingOnTheTablesPhoto']);
    photoWipeMenu = response['WipeMenuPhoto'] == null ? null : Api().getPhoto(response['WipeMenuPhoto']);

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
    if (widget.post == "Owner") {
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
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCheck(text: "Расставить столы на равном расстоянии от диванов", value: tableArrangement),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowPhoto(image: photoTableArrangement),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCommentWorker(
                      commentValue: commentTableArrangment,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorTableArrangment,
                      readOnly: readOnly,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCheck(text: "Протереть столы во всех местах", value: wipeTheTables),
                    ShowPhoto(image: photoWipeTheTables),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCommentWorker(
                      commentValue: commentWipeTheTables,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorWipeTheTables,
                      readOnly: readOnly,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCheck(text: "Осмотреть зал на предмет мелкого мусора. При необходимость убрать", value: inspectionOfTheHall),
                    ShowPhoto(image: photoInspectionOfTheHall),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCommentWorker(commentValue: commentInspectionOfTheHall),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorInspectionOfTheHall,
                      readOnly: readOnly,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCheck(text: "Расставить ровно все пуфики", value: arrangeOttomans),
                    ShowPhoto(image: photoArrangeOttomans),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCommentWorker(commentValue: commentArrangeOttomans),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorArrangeOttomans,
                      readOnly: readOnly,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCheck(
                        text: "Выставить все ровно на столах: салфетницы справа от кнопки, свечи слева от кнопки и крейзи меню слева от свечи",
                        value: putEverythingOnTheTables),
                    ShowPhoto(image: photoPutEverythingOnTheTables),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCommentWorker(
                      commentValue: commentPutEverithingOnTheTables,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorPutEverithingOnTheTables,
                      readOnly: readOnly,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCheck(text: "Протереть все крейзи меню и меню бара", value: wipeMenu),
                    ShowCommentWorker(
                      commentValue: commentWipeMenu,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorWipeMenu,
                      readOnly: readOnly,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCheck(text: "Протереть винный шкаф", value: cleanWineCabinet),
                    ShowCommentWorker(
                      commentValue: commentCleanWineCabinet,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorCleanWineCabinet,
                      readOnly: readOnly,
                    ),
                    const SizedBox(height: 20,),
                    ShowCheck(text: "Заполнить все салфетницы", value: fillTheNapkinHolder),
                    ShowCommentWorker(
                      commentValue: commentFillTheNapkinHolder,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorFillTheNapkinHolder,
                      readOnly: readOnly,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCheck(text: "Ведерко для муссора должно быть пустым", value: garbageEmpty),
                    ShowCommentWorker(
                      commentValue: commentGarbageEmpty,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorGarbageEmpty,
                      readOnly: readOnly,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCheck(text: "Передать посуду на кухню", value: passDishesKitchen),
                    ShowCommentWorker(
                      commentValue: commentPassDishesKitchen,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorPassDishesKitchen,
                      readOnly: readOnly,
                    ),
                    const SizedBox(height: 20,),
                    ShowCheck(text: "Запросить стоп-лист и старт-лист по кухне и бару", value: requestStartAndStopList),
                    ShowCommentWorker(
                      commentValue: commentRequestStartAndStopList,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorRequestStartAndStopList,
                      readOnly: readOnly,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowCheck(text: "Протереть хьюмидор и поднять в нем влажность", value: cleanHumidor),
                    ShowCommentWorker(
                      commentValue: commentCleanHumidor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommentDirector(
                      valueDirector: commentDirectorCleanHumidor,
                      readOnly: readOnly,
                    ),
                    if (widget.post == 'Manager')
                      Column(
                        children: [
                          const SizedBox(height: 20,),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Api().updateWaiterBegin(
                                    commentDirectorTableArrangment.text,
                                    commentDirectorWipeTheTables.text,
                                    commentDirectorInspectionOfTheHall.text,
                                    commentDirectorArrangeOttomans.text,
                                    commentDirectorPutEverithingOnTheTables.text,
                                    commentDirectorWipeMenu.text,
                                    commentDirectorCleanWineCabinet.text,
                                    commentDirectorFillTheNapkinHolder.text,
                                    commentDirectorGarbageEmpty.text,
                                    commentDirectorPassDishesKitchen.text,
                                    commentDirectorRequestStartAndStopList.text,
                                    commentDirectorCleanHumidor.text,
                                    idWorker,
                                    widget.formatterdate);
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
                                  backgroundColor: Colors.green[800],
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
        ],
      ),
    );
  }
}
