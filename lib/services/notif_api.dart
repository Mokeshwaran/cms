import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

late final BehaviorSubject<ReceivedNotification>
    didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

late final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

String? selectedNotificationPayload;
