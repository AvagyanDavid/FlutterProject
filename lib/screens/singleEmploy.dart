import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleEmploy extends StatelessWidget {
  String post;
  String login;
  String password;
  String branch;
  int id;

  SimpleEmploy({required this.id, required this.post, required this.login, required this.password, required this.branch});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
            height: 170,
            decoration: const BoxDecoration(
              color: Color(0xff000000),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 10, 12.74),
                width: 173,
                height: double.infinity,
                // color: Colors.green,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Привет Клининг',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                      color: Color(0xffffffff),
                    ),
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
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  const Text('Стрип Барсук Казань'),
                ]),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Align(alignment: Alignment.topRight, child: Image.asset("assets/emblem.png")),
              ),
            ]),
          ),
        ),
        const SizedBox(height: 40,),
        Center(
          child: Column(
            children: [
              Text(
                post,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  height: 1.2999999523,
                  color: Color(0xffffffff),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Логин',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            color: Color(0xffffffff),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Пароль',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ]
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        login,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          color: Color(0xffffffff),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        password,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          color: Color(0xffffffff),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('Уволить')),
                  ElevatedButton(onPressed: () {}, child: const Text('История отчетов')),
                ],
              ),
              const SizedBox(height: 40,),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100,50),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () { Navigator.pop(context); },
                      child: const Text('Назад',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.3,
                            color: Colors.white,
                          )
                      ),
                    ),
                  )
            ]),
          ),
      ]),
    );
  }
}
