import 'package:flutter/material.dart';
import 'package:my_app/Page/searchFriends.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:timezone/timezone.dart' as tz;
//import 'package:timezone/data/latest.dart' as tzData;

class User{
  String name;
  int accNumber;
  String password;
  List<User> users = <User>[];

  User({required this.name, required this.accNumber, required this.password});

  void visit(User user) {
    for (var item in users) {
      if(item == user) {
        return item.getPlanet();
      }
    }
  }

  void getPlanet() {}

  // final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Future<void> setup() async {
  //   // #1
  //   const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
  //   const iosSetting = IOSInitializationSettings();
  //
  //   // #2
  //   const initSettings =
  //   InitializationSettings(android: androidSetting, iOS: iosSetting);
  //
  //   // #3
  //   await _localNotificationsPlugin.initialize(initSettings).then((_) {
  //     debugPrint('setupPlugin: setup success');
  //   }).catchError((Object error) {
  //     debugPrint('Error: $error');
  //   });
  // }

  void sendMessage() {
//     tzData.initializeTimeZones();
//
//     final iosDetail = IOSNotificationDetails();
//
//     final noticeDetail = NotificationDetails(
//       iOS: iosDetail,
//       android: androidDetail,
//     );
//
// // #3
//     final id = 0;
//
// // #4
//     await _localNotificationsPlugin.zonedSchedule(
//       id,
//
//       noticeDetail,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//       androidAllowWhileIdle: true,
//     );
  }

  void message(User user) {
    for (var item in users) {
      if(item == user) {
        return item.sendMessage();
      }
    }
  }
}

class PushNotificationMessage {
  final String title;
  final String body;
  PushNotificationMessage({
    required this.title,
    required this.body,
  });
}