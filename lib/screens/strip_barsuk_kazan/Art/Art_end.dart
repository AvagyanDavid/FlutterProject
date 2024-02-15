import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/component/Forms.dart';
import '../../../component/checkbox/bloc/checkbox_bloc.dart';
import '../../../component/checkbox/checkbox.dart';
import '../../../component/photo/bloc/photo_bloc.dart';
import '../../../component/photo/photo.dart';

class Art_end extends StatefulWidget {
  int idUser;
  DateTime now;

  Art_end({super.key, required this.idUser, required this.now});

  @override
  State<Art_end> createState() => _Art_endState();
}

class _Art_endState extends State<Art_end> {
  TextEditingController commentReportCompleteArt = TextEditingController();
  TextEditingController commentReportCompleteMarket = TextEditingController();
  TextEditingController commentSendReportChat = TextEditingController();
  TextEditingController commentOrderDressingRoom = TextEditingController();

  bool readOnly = false;
  bool enabled = true;

  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();

  String? orderDressingRoomPhotoPath = null;

  String commentDirectorReportCompletedArt = '';
  String commentDirectorReportCompleteMarket = '';
  String commentDirectorSendReportChat = '';
  String commentDirectorOrderDressingRoom = '';

  bool reportCompletedArt = false;
  bool reportCompleteMarket = false;
  bool art = false;
  bool bar = false;
  bool market = false;
  bool hostes = false;
  bool orderDressingRoom = false;
  int id = 0;
  String? currentPathPhoto;

  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final results = await Api().checkReportArtEnd(date);
    if (results != null) {
      final response = await Api().showArtEnd(date);
      readOnly = true;
      enabled = false;
      id = response['idArtManagerEnd'];
      reportCompletedArt = response['ReportCompletedArt'] != 0 ? true : false;
      commentReportCompleteArt.text = response['Comment_ReportCompleteArt'];
      commentDirectorReportCompletedArt = response['CommentDirector_ReportCompletedArt'];
      reportCompleteMarket = response['ReportCompleteMarket'] != 0 ? true : false;
      commentReportCompleteMarket.text = response['Comment_ReportCompleteMarket'];
      commentDirectorReportCompleteMarket = response['CommentDirector_ReportCompleteMarket'];
      art = response['Art'] != 0 ? true : false;
      bar = response['Bar'] != 0 ? true : false;
      market = response['Market'] != 0 ? true : false;
      hostes = response['Hostes'] != 0 ? true : false;
      commentSendReportChat.text = response['Comment_SendReportChat'];
      commentDirectorSendReportChat = response['CommentDirector_SendReportChat'];
      orderDressingRoom = response['OrderDressingRoom'] != 0 ? true : false;
      commentOrderDressingRoom.text = response['Comment_OrderDressingRoom'];
      commentDirectorOrderDressingRoom = response['CommentDirector_OrderDressingRoom'];

      orderDressingRoomPhotoPath = response['OrderDressingRoomPhoto'] == null ? null : Api().getPhoto(response['OrderDressingRoomPhoto']);
      currentPathPhoto = response['OrderDressingRoomPhoto'];

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
      body: Column(children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
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
                                  'Привет Арт',
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
            ],
          ),
        ),
        const SizedBox(
          child: Text(
            'Конец смены',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              height: 1.2999999523,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 31.5, 0, 0),
              margin: const EdgeInsets.fromLTRB(14, 0, 19, 56),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(builder: (context, state) {
                      if (enabled == false) {
                        return ShowCheck(text: 'Заполнить отчет арта', value: reportCompletedArt);
                      } else {
                        return NewCheck(
                          text: 'Заполнить отчет арта',
                          value: state.checkboxStates['reportCompletedArt'] ?? false,
                          checkboxBloc: checkboxBloc,
                          checkboxId: 'reportCompletedArt',
                          enabled: enabled,
                        );
                      }
                    }),
                  ),
                  CommentWorker(
                    commentValue: commentReportCompleteArt,
                    readOnly: readOnly,
                  ),
                  ShowCommentDirector(valueDirector: commentDirectorReportCompletedArt,),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(builder: (context, state) {
                      if (enabled == false) {
                        return ShowCheck(text: 'Заполнить отчет маркетолога', value: reportCompleteMarket);
                      } else {
                        return NewCheck(
                          text: 'Заполнить отчет маркетолога',
                          value: state.checkboxStates['reportCompleteMarket'] ?? false,
                          checkboxBloc: checkboxBloc,
                          checkboxId: 'reportCompleteMarket',
                          enabled: enabled,
                        );
                      }
                    }),
                  ),
                  CommentWorker(
                    commentValue: commentReportCompleteMarket,
                    readOnly: readOnly,
                  ),
                  ShowCommentDirector(
                    valueDirector: commentDirectorReportCompleteMarket,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    child: Text(
                      'Скинуть все отчеты в чат:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(
                      builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(text: 'Арт', value: art);
                        } else {
                          return NewCheck(
                            text: 'Арт',
                            value: state.checkboxStates['art'] ?? false,
                            checkboxBloc: checkboxBloc,
                            checkboxId: 'art',
                            enabled: enabled,
                          );
                        }
                      },
                    ),
                  ),
                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(
                      builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(text: 'Бар', value: bar);
                        } else {
                          return NewCheck(
                            text: 'Бар',
                            value: state.checkboxStates['bar'] ?? false,
                            checkboxBloc: checkboxBloc,
                            checkboxId: 'bar',
                            enabled: enabled,
                          );
                        }
                      },
                    ),
                  ),
                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(
                      builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(text: 'Маркетолог', value: market);
                        } else {
                          return NewCheck(
                            text: 'Маркетолог',
                            value: state.checkboxStates['market'] ?? false,
                            checkboxBloc: checkboxBloc,
                            checkboxId: 'market',
                            enabled: enabled,
                          );
                        }
                      },
                    ),
                  ),
                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(
                      builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(text: 'хостес', value: hostes);
                        } else {
                          return NewCheck(
                            text: 'хостес',
                            value: state.checkboxStates['hostes'] ?? false,
                            checkboxBloc: checkboxBloc,
                            checkboxId: 'hostes',
                            enabled: enabled,
                          );
                        }
                      },
                    ),
                  ),
                  CommentWorker(
                    commentValue: commentSendReportChat,
                    readOnly: readOnly,
                  ),
                  ShowCommentDirector(
                    valueDirector: commentDirectorSendReportChat,
                  ),
                  BlocProvider<CheckboxBloc>(
                    create: (context) => checkboxBloc,
                    child: BlocBuilder<CheckboxBloc, CheckboxState>(
                      builder: (context, state) {
                        if (enabled == false) {
                          return ShowCheck(text: 'Проверить порядок в гримерке', value: orderDressingRoom);
                        } else {
                          return NewCheck(
                            text: 'Проверить порядок в гримерке',
                            value: state.checkboxStates['orderDressingRoom'] ?? false,
                            checkboxBloc: checkboxBloc,
                            checkboxId: 'orderDressingRoom',
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
                        if (enabled == false) {
                          return ShowPhoto(image: orderDressingRoomPhotoPath);
                        } else {
                          return NewPhoto(
                            photoBloc: photoBloc,
                            photoId: 'orderDressingRoomPhoto',
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommentWorker(
                    commentValue: commentOrderDressingRoom,
                    readOnly: readOnly,
                  ),
                  ShowCommentDirector(
                    valueDirector: commentDirectorOrderDressingRoom,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Column(
                    children: [
                      if (enabled == true)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 50),
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Colors.green[800],
                          ),
                          onPressed: () {
                            final photostate = photoBloc.state;
                            final orderDressingRoomPhoto = photostate.photoStates['orderDressingRoomPhoto'];
                            if (orderDressingRoomPhoto != null) {
                              orderDressingRoomPhotoPath = orderDressingRoomPhoto.path;
                            }

                            DateTime now = DateTime.now();
                            String date = '${now.year}-${now.month}-${now.day}';
                            String time = '${now.hour}:${now.minute}:${now.second}';

                            final state = checkboxBloc.state;
                            reportCompletedArt = state.checkboxStates['reportCompletedArt'] ?? false;
                            reportCompleteMarket = state.checkboxStates['reportCompleteMarket'] ?? false;
                            art = state.checkboxStates['art'] ?? false;
                            bar = state.checkboxStates['bar'] ?? false;
                            market = state.checkboxStates['market'] ?? false;
                            hostes = state.checkboxStates['hostes'] ?? false;
                            orderDressingRoom = state.checkboxStates['orderDressingRoom'] ?? false;

                            Api().artEnd(
                                date,
                                time,
                                reportCompletedArt,
                                commentReportCompleteArt.text,
                                commentDirectorReportCompletedArt,
                                reportCompleteMarket,
                                commentReportCompleteMarket.text,
                                commentDirectorReportCompleteMarket,
                                art,
                                bar,
                                market,
                                hostes,
                                commentSendReportChat.text,
                                commentDirectorSendReportChat,
                                orderDressingRoom,
                                orderDressingRoomPhotoPath,
                                commentOrderDressingRoom.text,
                                commentDirectorOrderDressingRoom,
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
                        )
                      else
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[800],
                            ),
                            child: const Text('На главный экран'))
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
