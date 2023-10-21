// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
//
// import '../connection/database.dart';
// // import 'package:raised_buttons/raised_buttons.dart';
//
// class Autorization extends StatelessWidget {
//   // const Autorization({
//   //   super.key,
//   //   required GlobalKey<FormBuilderState> formKey,
//   // }) : _formKey = formKey;
//
//   String? login;
//   String? password;
//  // final _login = GlobalKey<FormBuilderState>(debugLabel: login);
//  // final _password = GlobalKey<FormBuilderState>(debugLabel: password);
//
//
//   var db = Mysql();
//
//   Autorization({Key? key}) : super(key: key);
//
//   // final GlobalKey<FormBuilderState> _formKey;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: FormBuilder(
//           child: Column(
//             children: [
//               const SizedBox(
//                 width: 100,
//                 height: 100,
//               ),
//               Container(
//                   // group45yR (207:22)
//                   margin: const EdgeInsets.fromLTRB(47.5, 0, 50.5, 153),
//                   width: double.infinity,
//                   height: 200,
//                   child: Align(
//                       alignment: Alignment.topCenter,
//                       child: Image.asset("assets/emblem.png"))),
//               const SizedBox(
//                 height: 50,
//                 width: 100,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                 child: Column(children: [
//                   FormBuilderTextField(
//                     key: _login,
//                     name: 'Login',
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10.0))),
//                       hintText: "Логин",
//                       fillColor: Colors.white,
//                     ),
//                     textInputAction: TextInputAction.next,
//                     // textAlign: TextAlign.center,
//                   ),
//                 ]),
//               ),
//               const SizedBox(
//                 height: 20,
//                 width: 100,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                 child: Column(children: [
//                   FormBuilderTextField(
//                     key: _password,
//                     name: 'Password',
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10.0))),
//                       hintText: "Пароль",
//                       fillColor: Colors.white,
//                     ),
//                     // textAlign: TextAlign.center,
//                   ),
//                 ]),
//               ),
//               const SizedBox(
//                 height: 20,
//                 width: 100,
//               ),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(300, 60),
//                     textStyle: const TextStyle(fontSize: 20),
//                     backgroundColor: const Color(0xff866940),
//                   ),
//                   onPressed: () {
//                     db.getConnection().then((conn) {
//                       conn.query(
//                           'INSERT INTO Users (Login,Password,Post) VALUES (?,?,?)',
//                           [_login, _password, 'Хост']).then((results) {
//                         print('${results}');
//                       });
//                     });
//                     print(_login);
//                     print(_password);
//                   },
//                   child: const Text('Войти'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
