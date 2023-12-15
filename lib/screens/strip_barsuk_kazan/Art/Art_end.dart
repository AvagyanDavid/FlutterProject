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
  bool readOnly = false;
  bool enabled = true;

  void getStatusReport() async {
    String date = '${widget.now.year}-${widget.now.month}-${widget.now.day}';
    final response = await Api().checkReportArtEnd(date);
    if (response != null) {
      readOnly = true;
      enabled = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    getStatusReport();
    super.initState();
  }

  CheckboxBloc checkboxBloc = CheckboxBloc();
  PhotoBloc photoBloc = PhotoBloc();
  String? commentReportCompletedArt;
  String? commentReportCompleteMarket;
  String? commentSendReportChat;
  String? commentOrderDressingRoom;
  String? orderDressingRoomPhotoPath = null;
  String? orderDressingRoomPhotoName = null;
  String? commentDirectorReportCompletedArt;
  String? commentDirectorReportCompleteMarket;
  String? commentDirectorSendReportChat;
  String? commentDirectorOrderDressingRoom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                  // margin: const EdgeInsets.fromLTRB(0, 0, 0, 4.5),
                  padding: const EdgeInsets.fromLTRB(22, 35.93, 0, 53.58),
                  // width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xff000000),
                  ),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // group5Pm1 (207:166)
                        margin: const EdgeInsets.fromLTRB(0, 6.58, 67, 12.74),
                        width: 173,
                        height: double.infinity,
                        child: Container(
                          // autogroupc5usX6X (Qd8Af2EBZv8YZ9YRmLC5Us)
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 7.61),
                          width: double.infinity,
                          height: 63.17,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Container(
                                    // qd1 (207:27)
                                    // margin: const EdgeInsets.fromLTRB(0, 0, 0, 9.56),
                                    width: 200,
                                    child: const Text(
                                      'Привет АртМенеджер',
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
                                // 6oq (207:28)
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
                      Container(
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
          Container(
            // BD1 (231:55)
            // margin: const EdgeInsets.fromLTRB(0, 0, 120, 0),
            child: const Text(
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
                // autogrouptfuqVzP (Qd88RFd5Sycz9vo7TbtFuq)
                padding: const EdgeInsets.fromLTRB(0, 31.5, 0, 0),
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
                                  text: 'Заполнить отчет арта',
                                  value: state.checkboxStates['reportCompletedArt'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'reportCompletedArt',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentReportCompletedArt,
                            onChanged: (value) {
                              commentReportCompletedArt = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorReportCompletedArt,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Заполнить отчет маркетолога',
                                  value: state.checkboxStates['reportCompleteMarket'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'reportCompleteMarket',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentReportCompleteMarket,
                            onChanged: (value) {
                              commentReportCompleteMarket = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorReportCompleteMarket,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            // ANK (211:310)
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
                                return NewCheck(
                                  text: 'Арт',
                                  value: state.checkboxStates['art'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'art',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Бар',
                                  value: state.checkboxStates['bar'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'bar',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Маркетологи',
                                  value: state.checkboxStates['market'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'market',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'хостес',
                                  value: state.checkboxStates['hostes'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'hostes',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          CommentWorker(
                            commentValue: commentSendReportChat,
                            onChanged: (value) {
                              commentSendReportChat = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorSendReportChat,
                          ),
                          BlocProvider<CheckboxBloc>(
                            create: (context) => checkboxBloc,
                            child: BlocBuilder<CheckboxBloc, CheckboxState>(
                              builder: (context, state) {
                                return NewCheck(
                                  text: 'Проверить порядок в гримерке',
                                  value: state.checkboxStates['orderDressingRoom'] ?? false,
                                  checkboxBloc: checkboxBloc,
                                  checkboxId: 'orderDressingRoom',
                                  enabled: enabled,
                                );
                              },
                            ),
                          ),
                          BlocProvider<PhotoBloc>(
                            create: (context) => photoBloc,
                            // BlocBuilder(builder: builder)
                            child: BlocBuilder<PhotoBloc, PhotoState>(
                              builder: (context, state) {
                                return NewPhoto(
                                  photoBloc: photoBloc,
                                  photoId: 'orderDressingRoomPhoto',
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommentWorker(
                            commentValue: commentOrderDressingRoom,
                            onChanged: (value) {
                              commentOrderDressingRoom = value!;
                            },
                            readOnly: readOnly,
                          ),
                          ShowCommentDirector(
                            valueDirector: commentDirectorOrderDressingRoom,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: enabled == true
                                ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 50),
                                textStyle: const TextStyle(fontSize: 20),
                                backgroundColor: Colors.green,
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
                                final reportCompletedArt = state.checkboxStates['reportCompletedArt'] ?? false;
                                final reportCompleteMarket = state.checkboxStates['reportCompleteMarket'] ?? false;
                                final art = state.checkboxStates['art'] ?? false;
                                final bar = state.checkboxStates['bar'] ?? false;
                                final market = state.checkboxStates['market'] ?? false;
                                final hostes = state.checkboxStates['hostes'] ?? false;
                                final orderDressingRoom = state.checkboxStates['orderDressingRoom'] ?? false;

                                Api().artEnd(
                                    date,
                                    time,
                                    reportCompletedArt,
                                    commentReportCompletedArt,
                                    commentDirectorReportCompletedArt,
                                    reportCompleteMarket,
                                    commentReportCompleteMarket,
                                    commentDirectorReportCompleteMarket,
                                    art,
                                    bar,
                                    market,
                                    hostes,
                                    commentSendReportChat,
                                    commentDirectorSendReportChat,
                                    orderDressingRoom,
                                    orderDressingRoomPhotoPath,
                                    commentOrderDressingRoom,
                                    commentDirectorOrderDressingRoom,
                                    3);

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
                                : const SizedBox(height: 0,)
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
    );
  }
}
