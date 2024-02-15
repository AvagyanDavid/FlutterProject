import 'package:test_form/api/api.dart';
import 'package:flutter/material.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import '../../../../component/checkbox/checkbox.dart';

class ShowHostEnd extends StatefulWidget {
  final String formatterdate;
  final String post;
  ShowHostEnd({required this.formatterdate,required this.post});

  @override
  _ShowHostEndState createState() => _ShowHostEndState();
}

class _ShowHostEndState extends State<ShowHostEnd> {

  TextEditingController commentDirectorChargerRadioTerminalTelephone = TextEditingController();
  TextEditingController commentDirectorWorkplace = TextEditingController();

  bool readOnly = false;
  bool enabled = true;

  int idWorker = 0;

  bool chargerRadioTerminalTelephone = false;
  String? commentChargerRadioTerminalTelephone;
  bool cleanWorkplace = false;
  String? commentWorkplace;

  String? photo;

  void getData() async{
    final response = await Api().showHostEnd(widget.formatterdate);
    debugPrint(response.toString());
    chargerRadioTerminalTelephone = response['ChargerRadioTerminalTelephone'] != 0 ? true : false;
    commentChargerRadioTerminalTelephone = response['Comment_ChargerRadioTerminalTelephone'] as String?;
    commentDirectorChargerRadioTerminalTelephone.text = response['CommentDirector_ChargerRadioTerminalTelephone'] as String;
    cleanWorkplace = response['CleanWorkplace'] != 0 ? true : false;
    commentWorkplace = response['Comment_Workplace'] as String?;
    commentDirectorWorkplace.text = response['CommentDirector_Workplace'];
    idWorker = response['idUsers'];

    photo = response['WorkplacePhoto'] == null ? null : Api().getPhoto(response['WorkplacePhoto']);

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
                                        'Отчет Хоста',
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
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset("assets/emblem.png")),
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
                                text: "Поставить на зарядку рацию, терминал, телефон",
                                value: chargerRadioTerminalTelephone),
                            ShowCommentWorker(commentValue: commentChargerRadioTerminalTelephone,),
                            const SizedBox(height: 20),
                            CommentDirector(
                              valueDirector: commentDirectorChargerRadioTerminalTelephone,
                              readOnly: readOnly,
                            ),
                            const SizedBox(height: 20,),
                            ShowCheck(
                                text: "Навести порядок на рабочем месте",
                                value: cleanWorkplace),
                            const SizedBox(height: 20,),
                            ShowPhoto(image: photo),
                            const SizedBox(height: 20,),
                            ShowCommentWorker(commentValue: commentWorkplace),
                            const SizedBox(height: 20,),
                            CommentDirector(
                              valueDirector: commentDirectorWorkplace,
                              readOnly: readOnly,
                            ),
                            if (widget.post == 'Manager')
                              Column(
                                children: [
                                  const SizedBox(height: 20,),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Api().updateHostEnd(commentDirectorChargerRadioTerminalTelephone.text, commentDirectorWorkplace.text, idWorker, widget.formatterdate);
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green[800]
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
                                    child: ElevatedButton(onPressed: (){
                                      Navigator.pop(context);
                                    },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green[800]
                                        ),
                                        child: const Text('Выйти')
                            ),
                                  ),
                                ],
                              )
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
    );
  }
}