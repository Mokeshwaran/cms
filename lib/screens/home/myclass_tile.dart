import 'package:flutter/material.dart';
import 'package:cms/models/myclass.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../services/notif_api.dart';

class MyClassTile extends StatefulWidget {
  final MyClass myclass;
  const MyClassTile({Key? key, required this.myclass}) : super(key: key);

  @override
  State<MyClassTile> createState() => _MyClassTileState();
}

class _MyClassTileState extends State<MyClassTile> {
  void initState() {
    super.initState();
    _requestPermissions();
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.myclass.mycls == 'Idle') {
      setState(() {
        flutterLocalNotificationsPlugin.cancel(0);
      });
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
        child: ListTile(
          title: Text(widget.myclass.name!),
          subtitle: Text('Assigned to ${widget.myclass.mycls}'),
        ),
      ),
    );
  }
}

class UsersTile extends StatelessWidget {
  final MyClass users;
  const UsersTile({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
        child: ListTile(
          title: Text(users.name!),
        ),
      ),
    );
  }
}
