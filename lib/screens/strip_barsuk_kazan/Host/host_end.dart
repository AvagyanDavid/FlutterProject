import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import 'package:test_form/component/photo/bloc/photo_bloc.dart';
import 'package:test_form/component/checkbox/bloc/checkbox_bloc.dart';
import 'package:test_form/component/checkbox/checkbox.dart';

class Host_end extends StatefulWidget {
  final int idUser;
  final DateTime now;

  Host_end({super.key, required this.idUser, required this.now});

  @override
  State<Host_end> createState() => _Host_endState();
}

class _Host_endState extends State<Host_end> {

  TextEditingController commentChargerRadioTerminalTelephone = TextEditingController();
  TextEditingController commentWorkplace = TextEditingController();

  bool readOnly = false;
  bool enabled = true;

  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();

  String? cleanlinessWorkplaceHostPath = null;

  String commentDirectorChargerRadioTerminalTelephone = '';
  String commentDirectorWorkplace = '';

  String? cleanlinessWorkplaceHostPhoto;
  bool chargerRadioTerminalTelephone = false;
  bool cleanWorkplace = false;

  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final results = await Api().checkReportHostEnd(date);
    if (results != null) {
      readOnly = true;
      enabled = false;
      final response = await Api().showHostEnd(date);
      chargerRadioTerminalTelephone = response['ChargerRadioTerminalTelephone'] != 0 ? true : false;
      commentChargerRadioTerminalTelephone.text = response['Comment_ChargerRadioTerminalTelephone'];
      commentDirectorChargerRadioTerminalTelephone = response['CommentDirector_ChargerRadioTerminalTelephone'];
      cleanWorkplace = response['CleanWorkplace'] != 0 ? true : false;
      commentWorkplace.text = response['Comment_Workplace'];
      commentDirectorWorkplace = response['CommentDirector_Workplace'];

      cleanlinessWorkplaceHostPhoto = response['WorkplacePhoto'] == null ? null : Api().getPhoto(response['WorkplacePhoto']);
      setState(() {});
    }
  }

  @override
  void initState() {
    getStatusReport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                                    'Привет Хост',
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
                              'сегодня ${widget.now.day}-${widget.now.month}-${widget.now.year}',
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
                        height: 100,
                        child: Align(alignment: Alignment.topRight, child: Image.asset("assets/emblem.png")),
                      ),
                    ],
                  ),
                ),
            ),
          const SizedBox(
            child: Text(
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
                padding: const EdgeInsets.fromLTRB(0, 31.5, 0, 62),
                margin: const EdgeInsets.fromLTRB(14, 0, 19, 56),
                width: double.infinity,
                child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                if(enabled == false){
                                  return ShowCheck(
                                      text: 'Поставить на зарядку рацию, терминал, телефон',
                                      value: chargerRadioTerminalTelephone);
                                }
                                return NewCheck(
                                  text: "Поставить на зарядку рацию, терминал, телефон",
                                  value: state.checkboxStates['chargeRadioTerminalTelephone'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'chargeRadioTerminalTelephone',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommentWorker(
                            commentValue: commentChargerRadioTerminalTelephone,
                            readOnly: readOnly,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ShowCommentDirector(valueDirector: commentDirectorChargerRadioTerminalTelephone,),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                if(enabled == false){
                                  return ShowCheck(
                                      text: 'Навести порядок на рабочем месте',
                                      value: cleanWorkplace);
                                } else {
                                  return NewCheck(
                                    text: "Навести порядок на рабочем месте",
                                    value: state.checkboxStates['cleanlinessWorkplaceHost'] ?? false,
                                    checkboxBloc: checkboxBloc,
                                    checkboxId: 'cleanlinessWorkplaceHost',
                                    enabled: enabled,
                                  );
                                }
                              },
                            ),
                          ),
                          BlocProvider<PhotoBloc>(
                            create: (context) => photoBloc,
                            child: BlocBuilder<PhotoBloc, PhotoState>(
                              builder: (context, state) {
                                if(enabled == false){
                                  return ShowPhoto(image: cleanlinessWorkplaceHostPhoto);
                                } else {
                                  return NewPhoto(
                                    photoBloc: photoBloc,
                                    photoId: 'cleanlinessWorkplaceHostPhoto',
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommentWorker(
                            commentValue: commentWorkplace,
                            readOnly: readOnly,
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          ShowCommentDirector(valueDirector: commentDirectorWorkplace,),
                          const SizedBox(height: 20,),
                          Center(
                              child: enabled == true ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 50),
                                  textStyle: const TextStyle(fontSize: 20),
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {
                                  final photostate = photoBloc.state;
                                  final cleanlinessWorkplaceHostPhoto = photostate.photoStates['cleanlinessWorkplaceHostPhoto'];
                                  if(cleanlinessWorkplaceHostPhoto != null) {
                                    cleanlinessWorkplaceHostPath = cleanlinessWorkplaceHostPhoto.path;
                                  }
                                  DateTime now = DateTime.now();
                                  String date = '${now.year}-${now.month}-${now.day}';
                                  String time = '${now.hour}:${now.minute}:${now.second}';

                                  final state = checkboxBloc.state;
                                  chargerRadioTerminalTelephone = state.checkboxStates['chargeRadioTerminalTelephone'] ?? false;
                                  cleanWorkplace = state.checkboxStates['cleanlinessWorkplaceHost'] ?? false;

                                  Api().hostEnd(
                                      date,
                                      time,
                                      chargerRadioTerminalTelephone,
                                      commentChargerRadioTerminalTelephone.text,
                                      commentDirectorChargerRadioTerminalTelephone,
                                      cleanWorkplace,
                                      cleanlinessWorkplaceHostPath,
                                      commentWorkplace.text,
                                      commentDirectorWorkplace,
                                      widget.idUser);

                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Отправить отчет',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.3,
                                    color: Colors.white,
                                  ),
                                ),
                              ) : ElevatedButton(onPressed: (){
                                Navigator.pop(context);
                              },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[800],
                                  ),
                                  child: const Text('На главный экран'))
                          ),
                        ],
                      ),
                    ),
                ),
              ),
        ]),
    );
  }
}