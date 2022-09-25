import 'package:flutter/material.dart';
import 'package:my_app/Bottom.dart';
import 'package:my_app/top.dart';
import 'package:my_app/Page/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginHomePage(),

    );
  }
}

