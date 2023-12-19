// import 'package:flutter/material.dart';
// import 'package:test_form/main.dart';
// import 'barman_begin.dart';
// import 'barman_end.dart';
//
//
// class Barman extends StatelessWidget {
//
//   final int id;
//   final String login;
//   final String post;
//
//   Barman({super.key,required this.id, required this.login, required this.post});
//
//   @override
//   Widget build(BuildContext context) {
//     DateTime date = DateTime.now();
//     return Scaffold(
//       body: Container(
//         // frame5Sco (207:23)
//         width: 400,
//         height: double.infinity,
//         child: Column(children: [
//           Container(
//             width: double.infinity,
//             // decoration: const BoxDecoration (
//             /// разделяющая линия приветсвие и филиал (207:6)
//             //   color: Colors.white,
//             // ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   // appbar7Yb (207:165)
//                   margin: const EdgeInsets.fromLTRB(0, 0, 0, 4.5),
//                   padding: const EdgeInsets.fromLTRB(22, 35.93, 0, 53.58),
//                   width: double.infinity,
//                   height: 174,
//                   decoration: const BoxDecoration(
//                     color: Color(0xff000000),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         // group5Pm1 (207:166)
//                         margin: const EdgeInsets.fromLTRB(0, 6.58, 67, 12.74),
//                         width: 173,
//                         height: double.infinity,
//                         child: Container(
//                           // autogroupc5usX6X (Qd8Af2EBZv8YZ9YRmLC5Us)
//                           padding: const EdgeInsets.fromLTRB(0, 0, 0, 7.61),
//                           width: double.infinity,
//                           height: 63.17,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 // qd1 (207:27)
//                                 margin:
//                                 const EdgeInsets.fromLTRB(0, 0, 0, 9.56),
//                                 child: const Text(
//                                   'Привет Бармен',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w400,
//                                     height: 1.3,
//                                     color: Color(0xffffffff),
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 // 6oq (207:28)
//                                 'сегодня ${date.year}-${date.month}-${date.day}',
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   height: 1.3,
//                                   color: Color(0xffffffff),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 100,
//                         height: 150,
//                         child: Align(
//                             alignment: Alignment.topRight,
//                             child: Image.asset("assets/emblem.png")),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               // autogrouptfuqVzP (Qd88RFd5Sycz9vo7TbtFuq)
//               padding: const EdgeInsets.fromLTRB(26, 31.5, 0, 62),
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: Container(
//                       // group167uy (231:53)
//                       // width: double.infinity,
//                       height: 51,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(100, 50),
//                             textStyle: const TextStyle(fontSize: 20),
//                             backgroundColor: Colors.brown[900],
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => barman_begin(idUser: id, now: date,)),
//                             );
//                           },
//                           child: const Text(
//                             'Начало смены',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 30,
//                               height: 1.3,
//                               color: Colors.white,
//                             ),
//                           )),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   // Center(
//                   //   child: Container(
//                   //     // group167uy (231:53)
//                   //     //width: double.infinity,
//                   //     height: 51,
//                   //     child: ElevatedButton(
//                   //         style: ElevatedButton.styleFrom(
//                   //           minimumSize: const Size(100, 50),
//                   //           textStyle: const TextStyle(fontSize: 20),
//                   //           backgroundColor: Colors.brown[900],
//                   //         ),
//                   //         onPressed: () {
//                   //           Navigator.push(
//                   //             context,
//                   //             MaterialPageRoute(
//                   //                 builder: (context) => barman_end(idUser: id, now: date,)),
//                   //           );
//                   //         },
//                   //         child: const Text(
//                   //           'Конец смены',
//                   //           textAlign: TextAlign.center,
//                   //           style: TextStyle(
//                   //             fontSize: 30,
//                   //             height: 1.3,
//                   //             color: Colors.white,
//                   //           ),
//                   //         )),
//                   //   ),
//                   // ),
//                   const SizedBox(height: 40,),
//                   Center(
//                     child: Container(
//                       height: 51,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(100, 50),
//                             textStyle: const TextStyle(fontSize: 20),
//                             backgroundColor: Colors.red[900],
//                           ),
//                           onPressed: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //       builder: (context) => Autorization()),
//                             // );
//                             idUser = 0;
//                             Post = '';
//                             Login = '';
//                           },
//
//                           child: const Text(
//                             'Выйти',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 30,
//                               height: 1.3,
//                               color: Colors.white,
//                             ),
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
