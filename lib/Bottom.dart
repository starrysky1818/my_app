import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/Page/homePage.dart';
//import 'package:flutter_application_1/pages/email_screen.dart';
//import 'package:flutter_application_1/pages/home_screen.dart';
//import 'package:flutter_application_1/pages/pages_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;

  int _currentIndex = 0;
  List<Widget> list = [];

  @override
  void initState() {
    list
      ..add(MyHomePage());
      //..add(EmailScreen())
      //..add(PageScreen())
      //..add(AirplayScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _BottomNavigationColor,
            ),
            label: 'person',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _BottomNavigationColor,
            ),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: _BottomNavigationColor,
            ),
            label: 'Summary',
          ),
        ],
        currentIndex: _currentIndex,
        // type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}