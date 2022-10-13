import 'package:flutter/material.dart';
import 'body.dart';
import 'package:my_app/Bottom.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(10),
          padding: new EdgeInsets.fromLTRB(20, 40.0, 20.0, 40.0),
          child:Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationWidget()),
                    );
                  },
                  child: Container(
                    width: screenWidth,
                    padding: const EdgeInsets.fromLTRB(0, 0, 20.0, 40.0),
                    color: const Color.fromRGBO(10, 39, 59, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.chevron_left, color: Colors.white),
                      ],
                    ),
                  )
              ),
              Body()
            ],
          ),
      ),
      backgroundColor: const Color.fromRGBO(10,39,59,1),
    );
  }
}