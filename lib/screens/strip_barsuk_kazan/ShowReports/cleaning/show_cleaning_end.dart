import 'package:flutter/material.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/checkbox/checkbox.dart';

class ShowCleaningEnd extends StatefulWidget {
  final String formatterdate;
  final String post;

  ShowCleaningEnd({required this.formatterdate, required this.post});

  @override
  _ShowCleaningEndState createState() => _ShowCleaningEndState();
}

class _ShowCleaningEndState extends State<ShowCleaningEnd> {

  TextEditingController commentDirectorEmptyTrashCansAllBathrooms = TextEditingController();
  TextEditingController commentDirectorEmptyTrashCanStreet = TextEditingController();
  TextEditingController commentDirectorWashFloorsAllRooms = TextEditingController();
  TextEditingController commentDirectorTakeTrashStorageRoom = TextEditingController();
  TextEditingController commentDirectorCountNumberCleanTowels = TextEditingController();

  bool readOnly = false;
  int idWorker = 0;

  bool emptyTrashCansAllBathrooms = false;
  String? commentEmptyTrashCansAllBathrooms;
  bool emptyTrashCanStreet = false;
  String? commentEmptyTrashCanStreet;
  bool washFloorsAllRooms = false;
  String? commentWashFloorsAllRooms;
  bool takeTrashStorageRoom = false;
  String? commentTakeTrashStorageRoom;
  bool countNumberCleanTowels = false;
  String? commentCountNumberCleanTowels;

  void getData() async {
    final response = await Api().showCleaningEnd(widget.formatterdate);
    emptyTrashCansAllBathrooms = response['EmptyTrashCansAllBathrooms'] != 0 ? true : false;
    commentEmptyTrashCansAllBathrooms = response['Comment_EmptyTrashCansAllBathrooms'] as String?;
    commentDirectorEmptyTrashCansAllBathrooms.text = response['CommentDirector_EmptyTrashCansAllBathrooms'] as String;
    emptyTrashCanStreet = response['EmptyTrashCanStreet'] != 0 ? true : false;
    commentEmptyTrashCanStreet = response['Comment_EmptyTrashCanStreet'] as String?;
    commentDirectorEmptyTrashCanStreet.text = response['CommentDirector_EmptyTrashCanStreet'] as String;
    washFloorsAllRooms = response['WashFloorsAllRooms'] != 0 ? true : false;
    commentWashFloorsAllRooms = response['Comment_WashFloorsAllRooms'] as String?;
    commentDirectorWashFloorsAllRooms.text = response['CommentDirector_WashFloorsAllRooms'] as String;
    takeTrashStorageRoom = response['TakeTrashStorageRoom'] != 0 ? true : false;
    commentTakeTrashStorageRoom = response['Comment_TakeTrashStorageRoom'] as String?;
    commentDirectorTakeTrashStorageRoom.text = response['CommentDirector_TakeTrashStorageRoom'] as String;
    countNumberCleanTowels = response['CountNumberCleanTowels'] != 0 ? true : false;
    commentCountNumberCleanTowels = response['Comment_CountNumberCleanTowels'] as String?;
    commentDirectorCountNumberCleanTowels.text = response['CommentDirector_CountNumberCleanTowels'] as String;

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
      margin: const EdgeInsets.fromLTRB(14, 0, 19, 56),
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowCheck(text: "Очистить урны во всех санузлах", value: emptyTrashCansAllBathrooms),
            ShowCommentWorker(commentValue: commentEmptyTrashCansAllBathrooms),
            CommentDirector(valueDirector: commentDirectorEmptyTrashCansAllBathrooms, readOnly: readOnly),
            ShowCheck(text: "Очистить урну на улице", value: emptyTrashCanStreet),
            ShowCommentWorker(commentValue: commentEmptyTrashCanStreet),
            CommentDirector(valueDirector: commentDirectorEmptyTrashCanStreet, readOnly: readOnly),
            const SizedBox(height: 20,),
            ShowCheck(text: "Помыть полы во всех помещениях", value: washFloorsAllRooms),
            ShowCommentWorker(commentValue: commentWashFloorsAllRooms),
            CommentDirector(valueDirector: commentDirectorWashFloorsAllRooms, readOnly: readOnly),
            const SizedBox(height: 20,),
            ShowCheck(text: "Вынести мусор из кладовой", value: takeTrashStorageRoom),
            ShowCommentWorker(commentValue: commentTakeTrashStorageRoom),
            CommentDirector(valueDirector: commentDirectorTakeTrashStorageRoom, readOnly: readOnly),
            const SizedBox(height: 20,),
            ShowCheck(text: "Посчитать количество чистых полотенец и передать администратору", value: countNumberCleanTowels),
            ShowCommentWorker(commentValue: commentCountNumberCleanTowels),
            CommentDirector(valueDirector: commentDirectorCountNumberCleanTowels, readOnly: readOnly),
            const SizedBox(height: 20,),
            if (widget.post == 'Manager')
              Column(
                children: [
                  const SizedBox(height: 20,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Api().updateCleaningEnd(commentDirectorEmptyTrashCansAllBathrooms.text, commentDirectorEmptyTrashCanStreet.text, commentDirectorWashFloorsAllRooms.text, commentDirectorTakeTrashStorageRoom.text, commentDirectorCountNumberCleanTowels.text,
                            idWorker, widget.formatterdate);
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
                      child: const Text('Выйти'),
                    ),
                  ),
                ],
              )
      ]),
    ),
    ),
      ),
      ]
    ),
    );
  }
}
