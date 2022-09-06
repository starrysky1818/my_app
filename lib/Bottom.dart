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
        backgroundColor: const Color.fromRGBO(41, 41, 61,1),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
         label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.brightness_3,
            ),
      label: 'Summary',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
label: 'Notice',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Friends',
          ),
        ],
        currentIndex: _currentIndex,
        // type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white70,
        unselectedItemColor: _BottomNavigationColor,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}