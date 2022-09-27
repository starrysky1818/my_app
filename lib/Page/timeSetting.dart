import 'package:flutter/material.dart';
import 'package:my_app/Page/setting.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'dart:async';

class MyTimeSetting extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => MySetting()),
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
            height: screenWidth * 0.35,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('images/time_setting.png'),
              ),
            ),
          ),
          Container(
              child: MyClockPage(
              )
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(10,39,59,1),
    );
  }
}

class MyClockPage extends StatefulWidget {
  @override
  State<MyClockPage> createState() => _MyClockPageState();
}

class _MyClockPageState extends State<MyClockPage> {

  // creating text ediiting controller to take hour
  // and minute as input
  TextEditingController hourController1 = TextEditingController();
  TextEditingController minuteController2 = TextEditingController();
  TextEditingController hourController3 = TextEditingController();
  TextEditingController minuteController4 = TextEditingController();
  int value1 = 0;
  int value2 = 0;
  int value3 = 0;
  int value4 = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              // start sleep container
              Container(
                width: screenWidth,
                height: screenWidth * 0.3,
                margin: const EdgeInsets.all(10),
                padding: new EdgeInsets.fromLTRB(20, 10.0, 20.0, 10.0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(20,47,67,1),
                    border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                child: Column(children: <Widget>[
                  SizedBox(height: 5),
                  Container(
                    child: Text(
                      'Start Sleep',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                      ),
                    ),

                  SizedBox(height:15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(11)),
                        child: Center(
                          child: TextField(
                            onChanged: (hour1) {
                              value1 = int.parse(hour1);
                            },
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30),
                            textAlign: TextAlign.center,
                            controller: hourController1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        ':',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 45,
                        width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(11)),
                        child: Center(
                          child: TextField(
                            onChanged: (min2) {
                              value2 = int.parse(min2);
                            },
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,),
                            textAlign: TextAlign.center,
                            controller: minuteController2,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(height: 10),

              // Wake up container
              Container(
                width: screenWidth,
                height: screenWidth * 0.3,
                margin: const EdgeInsets.all(10),
                padding: new EdgeInsets.fromLTRB(20, 10.0, 20.0, 10.0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(20,47,67,1),
                    border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                child: Column(children: <Widget>[
                  SizedBox(height: 5),
                  Container(
                    child: Text(
                      'Wake Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height:15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(11)),
                        child: Center(
                          child: TextField(
                            onChanged: (hour3) {
                              value3 = int.parse(hour3);
                            },
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30),
                            textAlign: TextAlign.center,
                            controller: hourController3,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        ':',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 45,
                        width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(11)),
                        child: Center(
                          child: TextField(
                            onChanged: (min4) {
                              value4 = int.parse(min4);
                            },
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,),
                            textAlign: TextAlign.center,
                            controller: minuteController4,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(height: 13),
              Container(
              child: TextButton(
                onPressed: () {
                  FlutterAlarmClock.createAlarm(value1, value2);
                  FlutterAlarmClock.createAlarm(value3, value4);
                },
                child: Text(
                  "Confirm",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white60,
                ),
                ),
              ),

          )
            ],
          ),
    );
  }
}
