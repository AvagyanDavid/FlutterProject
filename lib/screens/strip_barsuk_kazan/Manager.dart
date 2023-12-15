import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/main.dart';
import 'package:test_form/screens/aithorization.dart';
import 'package:test_form/screens/registration.dart';
import 'package:intl/intl.dart';
import 'package:test_form/screens/strip_barsuk_kazan/ShowReports/art/show_art_begin.dart';
import 'package:test_form/screens/strip_barsuk_kazan/ShowReports/art/show_art_end.dart';
import 'package:test_form/screens/strip_barsuk_kazan/ShowReports/barman/show_barman_begin.dart';
import 'package:test_form/screens/strip_barsuk_kazan/ShowReports/barman/show_barman_end.dart';
import 'package:test_form/screens/strip_barsuk_kazan/ShowReports/host/show_host_begin.dart';
import 'package:test_form/screens/strip_barsuk_kazan/ShowReports/host/show_host_end.dart';
import 'package:test_form/screens/strip_barsuk_kazan/ShowReports/waiter/show_waiter_begin.dart';
import 'package:test_form/screens/strip_barsuk_kazan/ShowReports/waiter/show_waiter_end.dart';

class Manager extends StatefulWidget {
  final int id;
  final String login;
  final String post;

  Manager({super.key, required this.id, required this.login, required this.post});

  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {

  String LoginArtBegin = '';
  String LoginArtEnd = '';
  String LoginBarmanBegin = '';
  String LoginBarmanEnd = '';
  String LoginWaiterBegin = '';
  String LoginWaiterEnd = '';
  String LoginHostBegin = '';
  String LoginHostEnd = '';

  DateTime now = DateTime.now();

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = '';
  String formatteddate = '';

  String? responseHostBegin;
  String? responseHostEnd;
  String? responseWaiterBegin;
  String? responseWaiterEnd;
  String? responseBarmanBegin;
  String? responseBarmanEnd;
  String? responseArtBegin;
  String? responseArtEnd;

  @override
  Widget build(BuildContext context) {
    String date = '${now.year}-${now.month}-${now.day}';
    print(widget.post);
    return Scaffold(
      body: SizedBox(
        width: 400,
        height: double.infinity,
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.fromLTRB(22, 35.93, 0, 53.58),
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0xff000000),
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 6.58, 10, 12.74),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Привет Управленец',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                              color: Color(0xffffffff),
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Registration(),
                        ),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image.asset("assets/emblem.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TableCalendar(
                              firstDay: DateTime(2010, 10, 16),
                              lastDay: DateTime(2050, 3, 14),
                              focusedDay: now,
                              selectedDayPredicate: (day) {
                                return isSameDay(day, now);
                              },
                              rowHeight: 50,
                              daysOfWeekHeight: 10,
                              headerStyle:
                                  const HeaderStyle(formatButtonVisible: false),
                              onDaySelected: (selectedDay, focusedDay) async {
                                formattedDate =
                                    formatter.format(selectedDay.toLocal());

                                debugPrint(formattedDate.toString());
                                responseHostBegin = await Api()
                                    .checkReportHostBegin(formattedDate);
                                responseHostEnd = await Api()
                                    .checkReportHostEnd(formattedDate);
                                responseWaiterBegin = await Api()
                                    .checkReportWaiterBegin(formattedDate);
                                responseWaiterEnd = await Api()
                                    .checkReportWaiterEnd(formattedDate);
                                responseBarmanBegin = await Api()
                                    .checkReportBarmanBegin(formattedDate);
                                responseBarmanEnd = await Api()
                                    .checkReportBarmanEnd(formattedDate);
                                responseArtBegin = await Api()
                                    .checkReportArtBegin(formattedDate);
                                responseArtEnd = await Api()
                                    .checkReportArtEnd(formattedDate);

                                debugPrint(
                                    'response HostEnd = ${responseHostEnd.toString()}');
                                debugPrint(responseHostBegin.toString());
                                setState(() {
                                  now = selectedDay;
                                });
                              }),
                          Text(
                            responseArtBegin != null
                                ? responseArtBegin.toString()
                                : 'логин Арта',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              height: 5,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: (responseArtBegin != null)
                                        ? Colors.green[900]
                                        : Colors.red[900],
                                  ),
                                  onPressed: () {
                                    if (responseArtBegin != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowArtBegin(
                                                  formatterdate: formattedDate,
                                                  post: widget.post,
                                                )),
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: const Text('Начало смены')),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: (responseArtEnd != null)
                                        ? Colors.green[900]
                                        : Colors.red[900],
                                  ),
                                  onPressed: () {
                                    if (responseArtEnd != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowArtEnd(
                                                  formatterdate: formattedDate,
                                                  post: widget.post,
                                                )),
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: const Text('Конец смены'))
                            ],
                          ),
                          Text(
                            responseBarmanBegin != null
                                ? responseBarmanBegin.toString()
                                : 'логин Бармена',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              height: 5,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: (responseBarmanBegin != null)
                                      ? Colors.green[900]
                                      : Colors.red[900],
                                ),
                                onPressed: () {
                                  if (responseBarmanBegin != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ShowBarmanBegin(
                                                formatterdate: formattedDate,
                                            post: widget.post,
                                              )),
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: const Text('Начало смены'),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: (responseBarmanEnd == null)
                                        ? Colors.red[900]
                                        : Colors.green[900],
                                  ),
                                  onPressed: () {
                                    if (responseBarmanEnd != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowBarmanEnd(
                                                  formatterdate: formattedDate,
                                              post: widget.post,
                                                )),
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: const Text('Конец смены'))
                            ],
                          ),
                          Text(
                            responseWaiterBegin != null
                                ? responseWaiterBegin.toString()
                                : 'логин Официанта',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              height: 5,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        (responseWaiterBegin != null)
                                            ? Colors.green[900]
                                            : Colors.red[900],
                                  ),
                                  onPressed: () {
                                    if (responseWaiterBegin != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ShowWaiterBegin(
                                                  formatterdate: formattedDate,
                                                  post:widget.post,
                                                )),
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: const Text('Начало смены')),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: (responseWaiterEnd != null)
                                        ? Colors.green[900]
                                        : Colors.red[900],
                                  ),
                                  onPressed: () {
                                    if (responseWaiterEnd != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowWaiterEnd(
                                                  formatterdate: formattedDate,
                                                  post: widget.post,
                                                )),
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: const Text('Конец смены'))
                            ],
                          ),
                          Text(
                            responseHostBegin != null
                                ? responseHostBegin!
                                : 'логин Хоста',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              height: 5,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: (responseHostBegin != null)
                                        ? Colors.green[900]
                                        : Colors.red[900],
                                  ),
                                  onPressed: () {
                                    if (responseHostBegin != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowHostBegin(
                                                  formatterdate: formattedDate,
                                                  id: idUser,
                                                  post: widget.post,
                                                )),
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: const Text('Начало смены')),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: (responseHostEnd != null)
                                        ? Colors.green[900]
                                        : Colors.red[900],
                                  ),
                                  onPressed: () {
                                    if (responseHostEnd != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowHostEnd(
                                                  formatterdate: formattedDate,
                                                  id: idUser,
                                                  post: widget.post,
                                                )),
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: const Text('Конец смены'))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 51,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 50),
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Autorization()),
                              );
                              idUser = 0;
                              Post = '';
                              Login = '';
                            },
                            child: const Text(
                              'Выйти',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                height: 1.3,
                                color: Colors.white,
                              ),
                            )),
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
