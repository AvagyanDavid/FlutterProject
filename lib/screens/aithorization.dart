import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:test_form/api/api.dart';
import 'package:test_form/main.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Art/Art.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Barman/barman.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Host/host.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Waiter/waiter.dart';
import '../connection/database.dart';
import 'Director.dart';

class Autorization extends StatelessWidget {

  String? login;
  String? password;


  Autorization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FormBuilder(
          child: Column(
            children: [
              const SizedBox(
                width: 100,
                height: 100,
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(47.5, 0, 50.5, 153),
                  width: double.infinity,
                  height: 200,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset("assets/emblem.png"))),
              const SizedBox(
                height: 50,
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(children: [
                  FormBuilderTextField(
                    name: 'Login',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      labelText: "Логин",
                      fillColor: Colors.white,
                    ),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      login = value!;
                    },
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(children: [
                  FormBuilderTextField(
                    name: 'Password',
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      hintText: "Пароль",
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      password = value!;
                    },
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
                width: 100,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 60),
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: const Color(0xff866940),
                  ),
                  onPressed: () async {
                    // db.getConnection().then(
                    //   (conn) {
                    //     conn.query(
                    //         'Select * from Users where Login = ? and Password = ?',
                    //         [login, password]).then((results) {
                    //       if (results.isEmpty) {
                    //         showDialog(
                    //           context: context,
                    //           builder: (context) => AlertDialog(
                    //             title: const Text('Ошибка'),
                    //             content: const Text(
                    //                 'Неверное имя пользователя или пароль'),
                    //             actions: [
                    //               TextButton(
                    //                 child: Text('OK'),
                    //                 onPressed: () =>
                    //                     Navigator.of(context).pop(),
                    //               ),
                    //             ],
                    //           ),
                    //         );
                    //       } else {
                    //         for (var row in results) {
                    //           idUser = row[0];
                    //           Login = row[1];
                    //           Post = row[3];
                    //         }
                    //         print('${idUser} ${Post}');
                    //         switch (Post) {
                    //           case 'Owner':
                    //             // Navigator.push(
                    //             //   context,
                    //             //   MaterialPageRoute(
                    //             //       builder: (context) => Director()),
                    //             // );
                    //           case 'Art':
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => Art()),
                    //             );
                    //           case 'Waiter':
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => Waiter()),
                    //             );
                    //           case 'Barman':
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => Barman()),
                    //             );
                    //           case 'Host':
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => Host()),
                    //             );
                    //         }
                    //       }
                    //     });
                    //   },
                    // );
                    final response = await Api().authorization(
                        login!, password!);
                    if (response == 'Error') {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                              title: Text('Ошибка'),
                              content: Text(
                                  'Неверное имя пользователя или пароль'),
                              actions: [
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                      );
                    } else {
                    final responseUser = await Api().showUser(response);


              switch (responseUser['Post']) {
                case 'Owner':
                  Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) => Director(id: responseUser['idUsers'], login: responseUser['Login'], post: responseUser['Post'],)),
                );
              case 'Art':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Art(id: responseUser['idUsers'], login: responseUser['Login'], post: responseUser['Post'],)),
                );
              case 'Waiter':
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                  builder: (context) => Waiter(id: responseUser['idUsers'], login: responseUser['Login'], post: responseUser['Post'],),
                  ));

              case 'Barman':
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                  builder: (context) => Barman(id: responseUser['idUsers'], login: responseUser['Login'], post: responseUser['Post'],),
                  ));
              case 'Host':
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Host(id: responseUser['idUsers'], login: responseUser['Login'], post: responseUser['Post'],))
                );
           }
          }
                  },
                  child: const Text('Войти'))
            ],
          ),
        ),
      ),
    );
  }
}
