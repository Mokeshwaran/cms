import 'package:flutter/material.dart';
import 'package:cms/models/myclass.dart';

class MyClassTile extends StatelessWidget {
  final MyClass myclass;
  const MyClassTile({Key? key, required this.myclass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
        child: ListTile(
          title: Text(myclass.name!),
          subtitle: Text('Assigned to ${myclass.mycls}'),
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
