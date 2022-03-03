import 'package:flutter/material.dart';
import 'package:cms/models/myclass.dart';

class MyClassTile extends StatelessWidget {
  final MyClass myclass;
  const MyClassTile({ Key? key, required this.myclass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25.0,
          ),
          title: Text(myclass.name!),
          subtitle: Text('Assigned ${myclass.mycls} class'),
        ),
      ),
    );
  }
}

class UsersTile extends StatelessWidget {
  final MyClass users;
  const UsersTile({ Key? key, required this.users }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25.0,
          ),
          title: Text(users.name!),
        ),
      ),
    );
  }
}
