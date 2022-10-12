
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

/// Notification
class Notification {
  final FlutterLocalNotificationsPlugin np = FlutterLocalNotificationsPlugin();
  var isInit = false;
  void init()  {
    if (isInit) return;
    isInit = true;

    var android = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var ios = const DarwinInitializationSettings();

    np.initialize(InitializationSettings(android: android, iOS: ios));
  }

  Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
   print("timeZoneName ${timeZoneName}");
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  void send(String title, String body,String timeStr) {
    init();
    var androidDetails = const AndroidNotificationDetails(
        'id describe',
        'name describe',
        importance: Importance.max,
        priority: Priority.high
    );
    var iosDetails = const DarwinNotificationDetails();
    var details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails
    );
    np.zonedSchedule(DateTime.now().millisecondsSinceEpoch >> 10, title, body, _nextInstanceOfAM(timeStr), details, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime, androidAllowWhileIdle: true);
  }

}

tz.TZDateTime _nextInstanceOfAM(String time) {
  List<String> times = time.split(":");
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
  tz.TZDateTime(tz.local, now.year, now.month, now.day, int.parse(times[0]),int.parse(times[1]));
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  print(" scheduledDate ${scheduledDate}");

  return scheduledDate;
}

var notification = Notification();

