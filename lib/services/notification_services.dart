import 'package:course_tracking/pages/course/course_model.dart';
import 'package:course_tracking/utilities/platform_channel_spesifics.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../main.dart';
import '../utilities/platform_channel_spesifics.dart';

class CourseNotificationService {
  Future<String> _localtimeZone() async {
    tz.initializeTimeZones();

    return await FlutterNativeTimezone.getLocalTimezone();
  }

  Future addNotitfication(CourseModel courseModel) async {
    _localtimeZone().then((value) async {
      NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
      await flutterLocalNotificationsPlugin.zonedSchedule(
        courseModel.id,
        "${courseModel.courseTitle} Dersi Başladı",
        "Hello ",
        tz.TZDateTime.from(courseModel.startingTime, tz.getLocation(value)),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
    });
  }
}
