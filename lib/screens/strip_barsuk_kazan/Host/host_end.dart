import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import 'package:test_form/component/photo/photo.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Host/host.dart';

import '../../../component/photo/bloc/photo_bloc.dart';
import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';

class host_end extends StatelessWidget {
  host_end({Key? key});

  bool readOnly = false;
  bool enabled = true;

  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();

  String? cleanlinessWorkplaceHostPath = null;

  String commentChargeRadioTerminalTelephone = '';
  String commentCleanlinessWorkplaceHost = '';

  String? commentDirectorChargeRadioTerminalTelephone;
  String? commentDirectorCleanlinessWorkplaceHost;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = '${now.year}-${now.month}-${now.day}';
    final response = Api().showHostEnd(date);
    if (response != null){
      readOnly = true;
      enabled = false;
    }
    return Scaffold(
      body: SizedBox(
        // frame5Sco (207:23)
        width: 400,
        height: double.infinity,
        child: Column(children: [
          Container(
            width: double.infinity,
            // decoration: const BoxDecoration (
            /// разделяющая линия приветсвие и филиал (207:6)
            //   color: Colors.white,
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // appbar7Yb (207:165)
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
                                'сегодня $date',
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
            // BD1 (231:55)
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
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text:
                                      "Поставить на зарядку рацию, терминал, телефон",
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
                                  commentChargeRadioTerminalTelephone,
                            onChanged: (value) {
                                commentChargeRadioTerminalTelephone = value!;
                                },
                            readOnly: readOnly,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ShowCommentDirector(valueDirector: commentDirectorChargeRadioTerminalTelephone,),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            // BlocBuilder(builder: builder)
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: "Навести порядок на рабочем месте",
                                  value: state.checkboxStates['cleanlinessWorkplaceHost'] ?? false,
                                  checkboxBloc:checkboxBloc,
                                  checkboxId: 'cleanlinessWorkplaceHost',
                                  enabled: enabled,
                                );
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
                              commentValue: commentCleanlinessWorkplaceHost,onChanged: (value) {
                                commentCleanlinessWorkplaceHost = value!;
                                },
                            readOnly: readOnly,
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          ShowCommentDirector(valueDirector: commentDirectorCleanlinessWorkplaceHost,),
                        ],
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
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
                            final chargeRadioTerminalTelephone = state.checkboxStates['chargeRadioTerminalTelephone'] ?? false;
                            final cleanlinessWorkplaceHost = state.checkboxStates['cleanlinessWorkplaceHost'] ?? false;

                            Api().hostEnd(date,time,chargeRadioTerminalTelephone,commentChargeRadioTerminalTelephone,commentDirectorChargeRadioTerminalTelephone,cleanlinessWorkplaceHost,cleanlinessWorkplaceHostPath,commentCleanlinessWorkplaceHost,commentDirectorCleanlinessWorkplaceHost,1);

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
                        ),
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
