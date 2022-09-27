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
            height: screenWidth * 0.42,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('images/time_setting.png'),
              ),
            ),
          ),
          Container(
              width: screenWidth,
              height: screenWidth * 0.4,
              margin: const EdgeInsets.all(10),
              padding: new EdgeInsets.fromLTRB(20, 10.0, 20.0, 10.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(20,47,67,1),
                  border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                  borderRadius: BorderRadius.all(Radius.circular(100))
              ),
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
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: TextField(
                      controller: hourController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: TextField(
                      controller: minuteController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Create alarm',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  int hour;
                  int minutes;
                  hour = int.parse(hourController.text);
                  minutes = int.parse(minuteController.text);

                  // creating alarm after converting hour
                  // and minute into integer
                  FlutterAlarmClock.createAlarm(hour, minutes);
                },
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // show alarm
            //     FlutterAlarmClock.showAlarms();
            //   },
            //   child: const Text(
            //     'Show Alarms',
            //     style: TextStyle(fontSize: 20.0),
            //   ),
            // ),
          ]));
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int value1 = 0;
//     int value2 = 0;
//     return Center(
//             child: Column(children: <Widget>[
//               Container(
//                 margin: const EdgeInsets.all(25),
//                   child: Row (
//                         children: <Widget>[
//                           SizedBox(width: 5),
//                       TextField(
//                         obscureText: true,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'hi',
//                           ),
//                           // clipBehavior: Clip.none,
//                           cursorColor: Colors.cyan,
//                           onChanged: (value) {
//                             value1 = int.parse(value);
//                             print("The value entered is : $value");
//                           }
//                           ),
//                           SizedBox(width: 5),
//
//                        TextField(
//                               onChanged: (value) {
//                                 value2 = int.parse(value);
//                                 print("The value entered is : $value");
//                               }
//                          ),
//                           SizedBox(width: 5),
//                     ]),
//                 ),
//               Container(
//                 margin: const EdgeInsets.all(25),
//                 child: TextButton(
//                   child: const Text(
//                     'Show alarms',
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                   onPressed: () {
//                     FlutterAlarmClock.showAlarms();
//                   },
//                 ),
//               ),
//             ]
//             )
//       );
//   }
// }