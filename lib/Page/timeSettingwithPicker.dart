import 'package:flutter/material.dart';
import 'package:my_app/Page/setting.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'dart:async';
import 'package:get_storage/get_storage.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:my_app/Page/reward/reward_manager.dart' as reward;


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
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                color: const Color.fromRGBO(10,39,59,1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
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
                image: AssetImage('images/alarm_setting.jpg'),
              ),
            ),
          ),
          MyClockPage(
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

  TimeOfDay startTime = TimeOfDay.now();
  late TimeOfDay pickedStartTime;
  int startHour = 0;
  int startMinute = 0;

  TimeOfDay endTime = TimeOfDay.now();
  late TimeOfDay pickedEndTime;
  int endHour = 0;
  int endMinute = 0;
  final flag = GetStorage();

  Future<Null> selectTime1(BuildContext context) async {
    pickedStartTime = (await showTimePicker(
      context: context,
      initialTime: startTime,
    ))!;
    setState(() {
      startTime = pickedStartTime;
      startHour = startTime.hour;
      startMinute = startTime.minute;
      print(pickedStartTime);
    });
  }

  Future<Null> selectTime2(BuildContext context) async {
    pickedEndTime = (await showTimePicker(
      context: context,
      initialTime: endTime,
    ))!;
    setState(() {
      endTime = pickedEndTime;
      endHour = endTime.hour;
      endMinute = endTime.minute;
      print(pickedEndTime);
    });
  }

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
            height: screenWidth * 0.32,
            margin: const EdgeInsets.all(10),
            padding: new EdgeInsets.fromLTRB(20, 10.0, 20.0, 10.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(20,47,67,1),
                border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            child: Column(children: <Widget>[
              Container(
                child: ElevatedButton.icon(
                  onPressed: () {
                      selectTime1(context);
                      },
                  icon: Icon(Icons.timer),  //icon data for elevated button
                  label: Text("Select Sleep Time"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white12,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
          ),
          SizedBox(height: 5),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(11)),
                  child: Text(
                      '$startHour',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30),
                      textAlign: TextAlign.center,
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
                  child: Text(
                    '$startMinute',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
          ),


          // wake up container
          Container(
            width: screenWidth,
            height: screenWidth * 0.32,
            margin: const EdgeInsets.all(10),
            padding: new EdgeInsets.fromLTRB(20, 10.0, 20.0, 10.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(20,47,67,1),
                border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            child: Column(children: <Widget>[
              Container(
                child: ElevatedButton.icon(
                  onPressed: () {
                    selectTime2(context);
                    endHour = endTime.hour;
                    endMinute = endTime.minute;
                  },
                  icon: Icon(Icons.timer),  //icon data for elevated button
                  label: Text("Select Wake Up Time"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white12,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),

              SizedBox(height: 5),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(11)),
                      child: Text(
                        '$endHour',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30),
                        textAlign: TextAlign.center,
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
                      child: Text(
                        '$endMinute',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
               ]),

    ),


              SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  if (flag.read('brightness')) {
                    ScreenBrightness().setScreenBrightness(0.1);
                  }
                  FlutterAlarmClock.createAlarm(startHour, startMinute);
                  reward.RewardManager.instance().addRewardIntegral(10);
                  FlutterAlarmClock.createAlarm(endHour, endMinute);
                  reward.RewardManager.instance().addRewardIntegral(10);
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white60,
                  ),
                ),
              ),
                  ],
                ),
              );

  }
}