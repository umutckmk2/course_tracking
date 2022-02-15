

 import 'package:flutter_local_notifications/flutter_local_notifications.dart';

AndroidNotificationDetails androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'your other channel id',
    'your other channel name',
    channelDescription: 'your other channel description',
    importance: Importance.max,
    priority: Priority.high,
  );

  IOSNotificationDetails iOSPlatformChannelSpecifics = const IOSNotificationDetails();