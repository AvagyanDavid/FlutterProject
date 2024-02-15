import 'package:flutter/material.dart';
import 'package:test_form/screens/Director.dart';
import 'package:test_form/screens/aithorization.dart';
import 'package:test_form/screens/employees.dart';
import 'package:test_form/screens/singleEmploy.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Barman/barman.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Cleaning/cleaning.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Host/host.dart';

var idUser = 0;
var Login = '';
var Post = '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    ),
        home:
            /// CleaningBegin эталон для шапки приложения
        // Director(id: 3, login: 'Boss', post: 'Owner',)
        // Employees(id:3)
        // SimpleEmploy(post: 'Barman', login: 'Barman', password: 'Barman', branch: 'Стрип Барсук Казань',)
      // Cleaning(id: 5,login: 'Clean',post: 'Cleaning'),
      Autorization(),
    );
  }
}