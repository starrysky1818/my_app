//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/Page/Profile/accountPage.dart';
import 'package:my_app/Page/friendPage.dart';
import 'package:my_app/Page/homePage.dart';
import 'package:my_app/Page/summaryPage.dart';
import 'package:my_app/Page/setting.dart';


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
      ..add(MyHomePage())
      ..add(MySetting())
      ..add(MyFriends())
      ..add(MySummary())
      ..add(MyAccount());

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
              Icons.settings,
            ),
      label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.graphic_eq,
            ),
            label: 'Summary',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_accounts,
            ),
            label: 'My',
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