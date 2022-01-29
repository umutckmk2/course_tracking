import 'package:course_tracking/models/course_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

import '../main.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationCntrl {
  AndroidNotificationDetails androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'your other channel id',
    'your other channel name',
    channelDescription: 'your other channel description',
    importance: Importance.max,
    priority: Priority.high,
  );

  IOSNotificationDetails iOSPlatformChannelSpecifics = const IOSNotificationDetails();
  Future<String> _localtimeZone() async {
    tz.initializeTimeZones();

    return await FlutterNativeTimezone.getLocalTimezone();
  }

  addNotitfication(CourseModel courseModel) async {
    _localtimeZone().then((value) async {
      NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
      print(courseModel.id!);
      print("courseModel.id!");
      print(courseModel.startingDate);
      print(value);
      await flutterLocalNotificationsPlugin.zonedSchedule(
        int.tryParse(courseModel.id!)!,
        "${courseModel.courseTitle} Dersi Başladı",
        "Hello ",
        tz.TZDateTime.from(courseModel.startingDate!, tz.getLocation(value)).subtract(Duration(days: 7)),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
    });
  }
}
