import 'package:flutter/material.dart';
import 'package:my_app/Page/brightness.dart';
import 'package:my_app/Bottom.dart';
import 'package:my_app/Page/notifications.dart';

class MySetting extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
                );
              },
              child: new Container(
                width: screenWidth,
                padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                color: Color.fromRGBO(10,39,59,1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                        Icons.chevron_left,
                        color: Colors.white
                    ),
                  ],
                ),
              )
          ),
          Container(
            width: screenWidth,
            height: screenWidth * 0.42,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('images/setting1.png'),
              ),
            ),
          ),
          GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Container(
                width: screenWidth,
                margin: const EdgeInsets.all(10),
                padding: new EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 13.0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(20,47,67,1),
                    border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       new Text(
                         "Sleep Time Setting",
                         style: TextStyle(fontSize: 20, color: Colors.white),
                       ),
                       Icon(
                         Icons.chevron_right,
                         color: Colors.white,
                       ),
                    ],
                ),
              )
          ),
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyNotification()),
                );
              },
              child: new Container(
                width: screenWidth,
                margin: const EdgeInsets.all(10),
                padding: new EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 13.0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(20,47,67,1),
                    border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text(
                      "Notifications",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
          ),
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBrightness()),
                );
              },
              child: new Container(
                width: screenWidth,
                margin: const EdgeInsets.all(10),
                padding: new EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 13.0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(20,47,67,1),
                    border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text(
                      "Screen Display Adjustment",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
          ),
          GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child: new Container(
                width: screenWidth,
                margin: const EdgeInsets.all(10),
                padding: new EdgeInsets.fromLTRB(20.0, 13, 20.0, 13),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(20,47,67,1),
                    border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text(
                      "App Management",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(10,39,59,1),
    );
  }
}