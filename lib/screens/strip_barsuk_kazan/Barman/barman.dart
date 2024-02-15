import 'package:flutter/material.dart';
import 'package:test_form/main.dart';
import 'package:test_form/screens/aithorization.dart';
import 'barman_begin.dart';
import 'barman_end.dart';


class Barman extends StatelessWidget {

  final int id;
  final String login;
  final String post;

  Barman({super.key,required this.id, required this.login, required this.post});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Scaffold(
      body: Column(
        children: [
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
                                        'Привет Бармен',
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
                                  'сегодня ${date.day}-${date.month}-${date.year}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                const Divider(color: Colors.white,thickness: 1,),
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
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.fromLTRB(26, 31.5, 0, 62),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 51,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 50),
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Colors.brown[900],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => barman_begin(idUser: id, now: date,)),
                              );
                            },
                            child: const Text(
                              'Начало смены',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                height: 1.3,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        height: 51,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 50),
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Colors.brown[900],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => barman_end(idUser: id, now: date,)),
                              );
                            },
                            child: const Text(
                              'Конец смены',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                height: 1.3,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Center(
                      child: SizedBox(
                        height: 51,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 50),
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Colors.red[900],
                            ),
                            onPressed: () {
                              Navigator.push(
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
          ]
      ),
    );
  }
}
