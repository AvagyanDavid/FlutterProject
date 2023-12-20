import 'package:test_form/api/api.dart';
import 'package:flutter/material.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import '../../../../component/checkbox/checkbox.dart';

class ShowHostEnd extends StatefulWidget {
  final String formatterdate;
  final int id;
  final String post;
  ShowHostEnd({required this.formatterdate,required this.id,required this.post});

  @override
  _ShowHostEndState createState() => _ShowHostEndState();
}

class _ShowHostEndState extends State<ShowHostEnd> {

  TextEditingController commentDirectorChargerRadioTerminalTelephone = TextEditingController();
  TextEditingController commentDirectorWorkplace = TextEditingController();

  bool readOnly = false;
  bool enabled = true;

  bool chargerRadioTerminalTelephone = false;
  String? commentChargerRadioTerminalTelephone;
  bool cleanWorkplace = false;
  String? commentWorkplace;

  String? photo;

  void getData() async{
    final response = await Api().showHostEnd(widget.formatterdate);
    chargerRadioTerminalTelephone = response['ChargerRadioTerminalTelephone'] != 0 ? true : false;
    commentChargerRadioTerminalTelephone = response['Comment_ChargerRadioTerminalTelephone'] as String?;
    commentDirectorChargerRadioTerminalTelephone.text = response['CommentDirector_ChargerRadioTerminalTelephone'];
    cleanWorkplace = response['CleanWorkplace'] != 0 ? true : false;
    commentWorkplace = response['Comment_Workplace'] as String?;
    commentDirectorWorkplace.text = response['CommentDirector_Workplace'];

    photo = response['WorkplacePhoto'] == null ? null : Api().getPhoto(response['WorkplacePhoto']);
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
                                    'Отчет Хостеса',
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
                              ElevatedButton(
                                onPressed: () {
                                  Api().updateHostEnd(commentDirectorChargerRadioTerminalTelephone.text, commentDirectorWorkplace.text, widget.id, widget.formatterdate);
                                },
                                child: const Text('Отправить комментарии'),
                              )
                            else
                              ElevatedButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: const Text('Выйти')
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
      ),
    );
  }
}