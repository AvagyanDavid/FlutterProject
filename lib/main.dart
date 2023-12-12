import 'package:flutter/material.dart';
import 'package:test_form/screens/aithorization.dart';

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
    home: Autorization(),
    );
  }
}