import 'package:flutter/material.dart';
import 'package:my_app/Page/setting.dart';

class TopNavigationWidget extends StatefulWidget {
  _TopNavigationWidgetState createState() => _TopNavigationWidgetState();
}

class _TopNavigationWidgetState extends State<TopNavigationWidget> {
  final _TopNavigationColor = Colors.white;

  int _currentIndex = 0;
  List<Widget> list = [];

  @override
  void initState() {
    list
      .add(MySetting());
    //..add(EmailScreen())
    //..add(PageScreen())
    //..add(AirplayScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.chevron_left),
              color: _TopNavigationColor,
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
            },
        ),
      ),
    );
  }
}