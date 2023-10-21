import 'package:flutter/material.dart';
import 'package:test_form/screens/aithorization.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Barman/barman.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Host/host.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Waiter/waiter.dart';
import 'package:test_form/screens/strip_barsuk_kazan/Art/Art_begin.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
              return MaterialApp(
    theme: ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    ),
    home:
    Art_begin(),
    // Autorization()
    // host(),
    // barman(),
    // waiter(),
    );
  }
}


