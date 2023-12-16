import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import 'package:test_form/main.dart';
import '../../../component/photo/bloc/photo_bloc.dart';
import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';

class Host_end extends StatefulWidget {
  final int idUser;
  final DateTime now;
  
  Host_end({super.key, required this.idUser, required this.now});

  @override
  State<Host_end> createState() => _Host_endState();
}

class _Host_endState extends State<Host_end> {
  bool readOnly = false;
  bool enabled = true;

  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();

  String? cleanlinessWorkplaceHostPath = null;
  String? commentChargerRadioTerminalTelephone;
  String? commentWorkplace;
  String? commentDirectorChargerRadioTerminalTelephone;
  String? commentDirectorWorkplace;
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
      commentChargerRadioTerminalTelephone = response['Comment_ChargerRadioTerminalTelephone'] as String?;
      commentDirectorChargerRadioTerminalTelephone = response['CommentDirector_ChargerRadioTerminalTelephone'] as String?;
      cleanWorkplace = response['CleanWorkplace'] != 0 ? true : false;
      commentWorkplace = response['Comment_Workplace'] as String?;
      commentDirectorWorkplace = response['CommentDirector_Workplace'] as String?;
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
      body: SizedBox(
        width: 400,
        height: double.infinity,
        child: Column(children: [
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
                                  'Привет Хостес',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                    color: Color(0xffffffff),
                                  ),
                                ),
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
                              commentValue:
                                  commentChargerRadioTerminalTelephone,
                            onChanged: (value) {
                                commentChargerRadioTerminalTelephone = value!;
                                },
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
                                return NewPhoto(
                                  photoBloc: photoBloc,
                                  photoId: 'cleanlinessWorkplaceHostPhoto',
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommentWorker(
                              commentValue: commentWorkplace,onChanged: (value) {
                            commentWorkplace = value!;
                                },
                            readOnly: readOnly,
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          ShowCommentDirector(valueDirector: commentDirectorWorkplace,),
                        ],
                      ),
                    ),
                    Center(
                      child: enabled == true ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 50),
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () async{
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

                            Api().hostEnd(date,time,chargerRadioTerminalTelephone,commentChargerRadioTerminalTelephone,commentDirectorChargerRadioTerminalTelephone,cleanWorkplace,cleanlinessWorkplaceHostPath,commentWorkplace,commentDirectorWorkplace,idUser);

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
                        ) : const SizedBox(height: 0,),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}