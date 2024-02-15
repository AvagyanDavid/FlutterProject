import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/checkbox/checkbox.dart';

class ShowCleaningBegin extends StatefulWidget {
  final String formatterdate;
  final String post;

  ShowCleaningBegin({required this.formatterdate, required this.post});

  @override
  _ShowCleaningBeginState createState() => _ShowCleaningBeginState();
}

class _ShowCleaningBeginState extends State<ShowCleaningBegin> {

  TextEditingController commentDirectorCabinet = TextEditingController();
  TextEditingController commentDirectorFirstFloor = TextEditingController();
  TextEditingController commentDirectorToilets = TextEditingController();
  TextEditingController commentDirectorWashStairsSecondFloor = TextEditingController();
  TextEditingController commentDirectorSecondFloor = TextEditingController();
  TextEditingController commentDirectorBar = TextEditingController();
  TextEditingController commentDirectorAlice = TextEditingController();
  TextEditingController commentDirectorTakeAllTrash = TextEditingController();
  TextEditingController commentDirectorStreet = TextEditingController();
  TextEditingController commentDirectorCheckRoomsCobwebs = TextEditingController();
  TextEditingController commentDirectorCheckCleanlinessBathrooms = TextEditingController();

  bool readOnly = false;

  int idWorker = 0;

  bool washFloors = false;
  bool wipeTablesWindowShelves = false;
  String? commentCabinet;
  bool corridor = false;
  bool relax = false;
  bool guestbook = false;
  bool toilet = false;
  bool wipeWindowSills = false;
  bool wipePanelBox = false;
  bool wipePaintings = false;
  bool wipeInteriorDoors = false;
  String? commentFirstFloor;
  bool wipeWalls = false;
  bool cleanSinks = false;
  bool cleanToilets = false;
  bool wipeMirrors = false;
  bool wipeDispensers = false;
  bool fillDispensers = false;
  String? commentToilets;
  bool washStairsSecondFloor = false;
  String? commentWashStairsSecondFloor;
  bool washFloorsSecondFloor = false;
  bool washStage = false;
  bool wipeLargeMirror = false;
  bool vacuum = false;
  bool wipeBaseboardsOnColumn = false;
  bool prepareCrazyRoom = false;
  String? commentSecondFloor;
  bool washFloorsBar = false;
  bool washDishesBar = false;
  String? commentBar;
  bool washFloorsAlice = false;
  bool wipeMirrorsHallway = false;
  bool fillDispensersAlice = false;
  bool wipeBathroomMirror = false;
  bool cleanSinkToilet = false;
  bool wipeReception = false;
  bool wipeTableGuestRoom = false;
  bool vacuumStairs = false;
  String? commentAlice;
  bool takeAllTrash = false;
  String? commentTakeAllTrash;
  bool wipeIronWindowSills = false;
  bool wipeDoorSign = false;
  bool removeCobwebs = false;
  bool emptyTrashCan = false;
  String? commentStreet;
  bool checkRoomsCobwebs = false;
  String? commentCheckRoomsCobwebs;
  String? commentCheckCleanlinessBathrooms1;
  bool checkCleanlinessBathrooms1 = false;
  String? commentCheckCleanlinessBathrooms2;
  bool checkCleanlinessBathrooms2 = false;
  String? commentCheckCleanlinessBathrooms3;
  bool checkCleanlinessBathrooms3 = false;
  String? commentCheckCleanlinessBathrooms4;
  bool checkCleanlinessBathrooms4 = false;
  String? commentCheckCleanlinessBathrooms5;
  bool checkCleanlinessBathrooms5 = false;
  String? commentCheckCleanlinessBathrooms6;
  bool checkCleanlinessBathrooms6 = false;
  String? commentCheckCleanlinessBathrooms7;
  bool checkCleanlinessBathrooms7 = false;
  String? commentCheckCleanlinessBathrooms8;
  bool checkCleanlinessBathrooms8 = false;
  String? commentCheckCleanlinessBathrooms9;
  bool checkCleanlinessBathrooms9 = false;
  String? commentCheckCleanlinessBathrooms10;
  bool checkCleanlinessBathrooms10 = false;
  String? commentCheckCleanlinessBathrooms11;
  bool checkCleanlinessBathrooms11 = false;
  String? commentCheckCleanlinessBathrooms12;
  bool checkCleanlinessBathrooms12 = false;
  String? commentCheckCleanlinessBathrooms13;
  bool checkCleanlinessBathrooms13 = false;
  String? commentCheckCleanlinessBathrooms14;
  bool checkCleanlinessBathrooms14 = false;
  String? commentCheckCleanlinessBathrooms15;
  bool checkCleanlinessBathrooms15 = false;
  String? commentCheckCleanlinessBathrooms16;
  bool checkCleanlinessBathrooms16 = false;

  void getData() async {
    final response = await Api().showCleaningBegin(widget.formatterdate);
    washFloors = response['WashFloors'] != 0 ?  true : false;
    wipeTablesWindowShelves = response['WipeTablesWindowShelves'] != 0 ? true : false;
    commentCabinet = response['Comment_Cabinet'] as String?;
    commentDirectorCabinet.text = response['CommentDirector_Cabinet'] as String;
    corridor = response['Corridor'] != 0 ? true : false;
    relax = response['Relax'] != 0 ? true : false;
    guestbook = response['Guestbook'] != 0 ? true : false;
    toilet = response['Toilet'] != 0 ? true : false;
    wipeWindowSills = response['WipeWindowSills'] != 0 ? true : false;
    wipePanelBox = response['WipePanelBox'] != 0 ? true : false;
    wipePaintings = response['WipePaintings'] != 0 ? true : false;
    wipeInteriorDoors = response['WipeInteriorDoors'] != 0 ? true : false;
    commentFirstFloor = response['Comment_FirstFloor'] as String?;
    commentDirectorFirstFloor.text = response['CommentDirector_FirstFloor'] as String;
    wipeWalls = response['WipeWalls'] != 0 ? true : false;
    cleanSinks = response['CleanSinks'] != 0 ? true : false;
    cleanToilets = response['CleanToilets'] != 0 ? true : false;
    wipeMirrors = response['WipeMirrors'] != 0 ? true : false;
    wipeDispensers = response['WipeDispensers'] != 0 ? true : false;
    fillDispensers = response['FillDispensers'] != 0 ? true : false;
    commentToilets = response['Comment_Toilets'] as String?;
    commentDirectorToilets.text = response['CommentDirector_Toilets'] as String;
    washStairsSecondFloor = response['WashStairsSecondFloor'] != 0 ? true : false;
    commentWashStairsSecondFloor = response['Comment_WashStairsSecondFloor'] as String?;
    commentDirectorWashStairsSecondFloor.text = response['CommentDirector_WashStairsSecondFloor'] as String;
    washFloorsSecondFloor = response['WashFloorsSecondFloor'] != 0 ? true : false;
    washStage = response['WashStage'] != 0 ? true : false;
    wipeLargeMirror = response['WipeLargeMirror'] != 0 ? true : false;
    vacuum = response['Vacuum'] != 0 ? true : false;
    wipeBaseboardsOnColumn = response['WipeBaseboardsOnColumn'] != 0 ? true : false;
    prepareCrazyRoom = response['PrepareCrazyRoom'] != 0 ? true : false;
    commentSecondFloor = response['Comment_SecondFloor'] as String?;
    commentDirectorSecondFloor.text = response['CommentDirector_SecondFloor'] as String;
    washFloorsBar = response['WashFloorsBar'] != 0 ? true : false;
    washDishesBar = response['WashDishesBar'] != 0 ? true : false;
    commentBar = response['Comment_Bar'] as String?;
    commentDirectorBar.text = response['CommentDirector_Bar'] as String;
    washFloorsAlice = response['WashFloorsAlice'] != 0 ? true : false;
    wipeMirrorsHallway = response['WipeMirrorsHallway'] != 0 ? true : false;
    fillDispensersAlice = response['FillDispensersAlice'] != 0 ? true : false;
    wipeBathroomMirror = response['WipeBathroomMirror'] != 0 ? true : false;
    cleanSinkToilet = response['CleanSinkToilet'] != 0 ? true : false;
    wipeReception = response['WipeReception'] != 0 ? true : false;
    wipeTableGuestRoom = response['WipeTableGuestRoom'] != 0 ? true : false;
    vacuumStairs = response['VacuumStairs'] != 0 ? true : false;
    commentAlice = response['Comment_Alice'] as String?;
    commentDirectorAlice.text =  response['CommentDirector_Alice'] as String;
    takeAllTrash = response['TakeAllTrash'] != 0 ? true : false;
    commentTakeAllTrash = response['Comment_TakeAllTrash'] as String?;
    commentDirectorTakeAllTrash.text = response['CommentDirector_TakeAllTrash'] as String;
    wipeIronWindowSills = response['WipeIronWindowSills'] != 0 ? true : false;
    wipeDoorSign = response['WipeDoorSign'] != 0 ? true : false;
    removeCobwebs = response['RemoveCobwebs'] != 0 ? true : false;
    emptyTrashCan = response['EmptyTrashCan'] != 0 ? true : false;
    commentStreet = response['Comment_Street'] as String?;
    commentDirectorStreet.text = response['CommentDirector_Street'] as String;
    checkRoomsCobwebs = response['CheckRoomsCobwebs'] != 0 ? true : false;
    commentCheckRoomsCobwebs = response['Comment_CheckRoomsCobwebs'] as String?;
    commentDirectorCheckRoomsCobwebs.text = response['CommentDirector_CheckRoomsCobwebs'] as String;
    commentCheckCleanlinessBathrooms1 = response['Comment_CheckCleanlinessBathrooms1'] as String?;
    checkCleanlinessBathrooms1 = response['checkCleanlinessBathrooms1'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms2 = response['Comment_CheckCleanlinessBathrooms2'] as String?;
    checkCleanlinessBathrooms2 = response['checkCleanlinessBathrooms2'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms3 = response['Comment_CheckCleanlinessBathrooms3'] as String?;
    checkCleanlinessBathrooms3 = response['checkCleanlinessBathrooms3'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms4 = response['Comment_CheckCleanlinessBathrooms4'] as String?;
    checkCleanlinessBathrooms4 = response['checkCleanlinessBathrooms4'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms5 = response['Comment_CheckCleanlinessBathrooms5'] as String?;
    checkCleanlinessBathrooms5 = response['checkCleanlinessBathrooms5'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms6 = response['Comment_CheckCleanlinessBathrooms6'] as String?;
    checkCleanlinessBathrooms6 = response['checkCleanlinessBathrooms6'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms7 = response['Comment_CheckCleanlinessBathrooms7'] as String?;
    checkCleanlinessBathrooms7 = response['checkCleanlinessBathrooms7'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms8 = response['Comment_CheckCleanlinessBathrooms8'] as String?;
    checkCleanlinessBathrooms8 = response['checkCleanlinessBathrooms8'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms9 = response['Comment_CheckCleanlinessBathrooms9'] as String?;
    checkCleanlinessBathrooms9 = response['checkCleanlinessBathrooms9'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms10 = response['Comment_CheckCleanlinessBathrooms10'] as String?;
    checkCleanlinessBathrooms10 = response['checkCleanlinessBathrooms10'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms11 = response['Comment_CheckCleanlinessBathrooms11'] as String?;
    checkCleanlinessBathrooms11 = response['checkCleanlinessBathrooms11'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms12 = response['Comment_CheckCleanlinessBathrooms12'] as String?;
    checkCleanlinessBathrooms12 = response['checkCleanlinessBathrooms12'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms13 = response['Comment_CheckCleanlinessBathrooms13'] as String?;
    checkCleanlinessBathrooms13 = response['checkCleanlinessBathrooms13'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms14 = response['Comment_CheckCleanlinessBathrooms14'] as String?;
    checkCleanlinessBathrooms14 = response['checkCleanlinessBathrooms14'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms15 = response['Comment_CheckCleanlinessBathrooms15'] as String?;
    checkCleanlinessBathrooms15 = response['checkCleanlinessBathrooms15'] != 0 ? true : false;
    commentCheckCleanlinessBathrooms16 = response['Comment_CheckCleanlinessBathrooms16'] as String?;
    checkCleanlinessBathrooms16 = response['checkCleanlinessBathrooms16'] != 0 ? true : false;
    commentDirectorCheckCleanlinessBathrooms.text = response['CommentDirector_CheckCleanlinessBathrooms'] as String;

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
                              'Отчет Клининга',
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
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Кабинет:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  color: Colors.white,
                ),
              ),
            ),
            ShowCheck(text: "Помыть полы", value: washFloors),
            ShowCheck(text: "Протереть столы, подоконники, полки", value: wipeTablesWindowShelves),
            ShowCommentWorker(commentValue: commentCabinet),
            const SizedBox(height: 20,),
            CommentDirector(
              valueDirector: commentDirectorCabinet,
              readOnly: readOnly,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Первый этаж (помыть полы):',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  color: Colors.white,
                ),
              ),
            ),
            ShowCheck(text: "Коридор", value: corridor),
            ShowCheck(text: "Релакс", value: relax),
            ShowCheck(text: "Гостевая", value: guestbook),
            ShowCheck(text: "Туалет", value: toilet),
            ShowCheck(text: "Протереть подоконники", value: wipeWindowSills),
            ShowCheck(text: "Протереть щитовой короб", value: wipePanelBox),
            ShowCheck(text: "Протереть картины", value: wipePaintings),
            ShowCheck(text: "Протереть межкомнатные двери", value: wipeInteriorDoors),
            ShowCommentWorker(commentValue: commentFirstFloor),
            const SizedBox(height: 20,),
            CommentDirector(
              valueDirector: commentDirectorFirstFloor,
              readOnly: readOnly,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Туалеты:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  color: Colors.white,
                ),
              ),
            ),
            ShowCheck(text: "Протереть стены", value: wipeWalls),
            ShowCheck(text: "Протереть раковины", value: cleanSinks),
            ShowCheck(text: "Почистить унитазы", value: cleanToilets),
            ShowCheck(text: "Протереть зеркала", value: wipeMirrors),
            ShowCheck(text: "Протереть диспенсеры для сухих полотенец и туалетной бумаги", value: wipeDispensers),
            ShowCheck(text: "Заполнить диспенсеры (бумага/полотенца/мыло)", value: fillDispensers),
            ShowCommentWorker(commentValue: commentToilets),
            const SizedBox(height: 20,),
            CommentDirector(valueDirector: commentDirectorToilets, readOnly: readOnly),
            ShowCheck(text: "Помыть лестницу на второй этаж и протереть перила", value: washStairsSecondFloor),
            ShowCommentWorker(commentValue: commentWashStairsSecondFloor),
            const SizedBox(height: 20,),
            CommentDirector(valueDirector: commentDirectorWashStairsSecondFloor, readOnly: readOnly),
            const SizedBox(height: 20,),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Второй этаж:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  color: Colors.white,
                ),
              ),
            ),
            ShowCheck(text: "Помыть полы", value: washFloorsSecondFloor),
            ShowCheck(text: "Помыть сцену", value: washStage),
            ShowCheck(text: "Протереть большое зеркало", value: wipeLargeMirror),
            ShowCheck(text: "Пропылесосить", value: vacuum),
            ShowCheck(text: "Протереть плинтуса на каждой колонне", value: wipeBaseboardsOnColumn),
            ShowCheck(text: "Подготовить комнату крейзи ( постельное/полотенца, протереть подоконник, почистить душевую, заполнить диспенсеры, очистить ведерко для мусора)", value: prepareCrazyRoom),
            ShowCommentWorker(commentValue: commentSecondFloor),
            CommentDirector(valueDirector: commentDirectorSecondFloor, readOnly: readOnly),
            const SizedBox(height: 20,),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Бар:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  color: Colors.white,
                ),
              ),
            ),
            ShowCheck(text: "Помыть полы", value: washFloorsBar),
            ShowCheck(text: "Помыть посуду", value: washDishesBar),
            ShowCommentWorker(commentValue: commentBar),
            CommentDirector(valueDirector: commentDirectorBar, readOnly: readOnly),
            const SizedBox(height: 20,),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Алиса:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  color: Colors.white,
                ),
              ),
            ),
            ShowCheck(text: "Помыть полы", value: washFloorsAlice),
            ShowCheck(text: "Протереть зеркала в коридоре", value: wipeMirrorsHallway),
            ShowCheck(text: "Заполнить диспенсеры (бумага/полотенца/мыло)", value: fillDispensersAlice),
            ShowCheck(text: "Протереть зеркало в с/у", value: wipeBathroomMirror),
            ShowCheck(text: "Почистить раковину и унитаз", value: cleanSinkToilet),
            ShowCheck(text: "Протереть Ресепшен", value: wipeReception),
            ShowCheck(text: "Протереть стол в гостевой", value: wipeTableGuestRoom),
            ShowCheck(text: "Пропылесосить лестницу", value: vacuumStairs),
            ShowCommentWorker(commentValue: commentAlice),
            CommentDirector(valueDirector: commentDirectorAlice, readOnly: readOnly),
            const SizedBox(height: 20,),
            ShowCheck(text: "Вынести весь мусор", value: takeAllTrash),
            ShowCommentWorker(commentValue: commentTakeAllTrash),
            CommentDirector(valueDirector: commentDirectorTakeAllTrash, readOnly: readOnly),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Улица:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  color: Colors.white,
                ),
              ),
            ),
            ShowCheck(text: "Протереть железные подоконники", value: wipeIronWindowSills),
            ShowCheck(text: "Протереть дверь и табличку", value: wipeDoorSign),
            ShowCheck(text: "Убрать паутину", value: removeCobwebs),
            ShowCheck(text: "Очистить урну", value: emptyTrashCan),
            ShowCommentWorker(commentValue: commentStreet),
            CommentDirector(valueDirector: commentDirectorStreet, readOnly: readOnly),
            const SizedBox(
              height: 20,
            ),
            ShowCheck(text: "Проверить все помещения на наличие паутины/убрать", value: checkRoomsCobwebs),
            ShowCommentWorker(commentValue: commentCheckRoomsCobwebs),
            CommentDirector(valueDirector: commentDirectorCheckRoomsCobwebs, readOnly: readOnly),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'В течение смены проверять чистоту сунузлов каждые 30 минут',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: ShowCommentWorker(
                    commentValue: commentCheckCleanlinessBathrooms1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ShowCheck(text: '', value: checkCleanlinessBathrooms1)
                    ),
              ],
            ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ShowCommentWorker(
                        commentValue: commentCheckCleanlinessBathrooms2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ShowCheck(text: '', value: checkCleanlinessBathrooms2)
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ShowCommentWorker(
                        commentValue: commentCheckCleanlinessBathrooms3,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ShowCheck(text: '', value: checkCleanlinessBathrooms3)
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ShowCommentWorker(
                        commentValue: commentCheckCleanlinessBathrooms4,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ShowCheck(text: '', value: checkCleanlinessBathrooms4)
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ShowCommentWorker(
                        commentValue: commentCheckCleanlinessBathrooms5,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ShowCheck(text: '', value: checkCleanlinessBathrooms5)
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ShowCommentWorker(
                        commentValue: commentCheckCleanlinessBathrooms6,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ShowCheck(text: '', value: checkCleanlinessBathrooms6)
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ShowCommentWorker(
                        commentValue: commentCheckCleanlinessBathrooms7,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ShowCheck(text: '', value: checkCleanlinessBathrooms7)
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ShowCommentWorker(
                        commentValue: commentCheckCleanlinessBathrooms8,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ShowCheck(text: '', value: checkCleanlinessBathrooms8)
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ShowCommentWorker(
                        commentValue: commentCheckCleanlinessBathrooms9,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ShowCheck(text: '', value: checkCleanlinessBathrooms9)
                    ),
                  ],
                ),
                const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: ShowCommentWorker(
                  commentValue: commentCheckCleanlinessBathrooms10,
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowCheck(text: '', value: checkCleanlinessBathrooms10)
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: ShowCommentWorker(
                  commentValue: commentCheckCleanlinessBathrooms11,
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowCheck(text: '', value: checkCleanlinessBathrooms11)
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: ShowCommentWorker(
                  commentValue: commentCheckCleanlinessBathrooms12,
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowCheck(text: '', value: checkCleanlinessBathrooms12)
                  ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: ShowCommentWorker(
                  commentValue: commentCheckCleanlinessBathrooms13,
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowCheck(text: '', value: checkCleanlinessBathrooms13)
                  ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: ShowCommentWorker(
                  commentValue: commentCheckCleanlinessBathrooms14,
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowCheck(text: '', value: checkCleanlinessBathrooms14)
                  ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: ShowCommentWorker(
                  commentValue: commentCheckCleanlinessBathrooms15,
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowCheck(text: '', value: checkCleanlinessBathrooms15)
                  ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: ShowCommentWorker(
                  commentValue: commentCheckCleanlinessBathrooms16,
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowCheck(text: '', value: checkCleanlinessBathrooms16)
                  ),
            ],
          ),
            CommentDirector(valueDirector: commentDirectorCheckCleanlinessBathrooms, readOnly: readOnly),
            if (widget.post == 'Manager')
              Column(
                children: [
                  const SizedBox(height: 20,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Api().updateCleaningBegin(commentDirectorCabinet.text, commentDirectorFirstFloor.text, commentDirectorToilets.text,
                            commentDirectorWashStairsSecondFloor.text, commentDirectorSecondFloor.text, commentDirectorBar.text,
                            commentDirectorAlice.text, commentDirectorTakeAllTrash.text, commentDirectorStreet.text,
                            commentDirectorCheckRoomsCobwebs.text, commentDirectorCheckCleanlinessBathrooms.text, idWorker, widget.formatterdate);
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
              ]
    ),
    ),
    ),
        ),
      ]
    ),
    );
  }
}
