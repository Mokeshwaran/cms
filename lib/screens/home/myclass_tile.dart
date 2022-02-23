import 'package:flutter/material.dart';
import 'package:cms/models/myclass.dart';

class MyclassTile extends StatelessWidget {
  //const MyclassTile({ Key? key }) : super(key: key);
  final Myclass myclass;
  MyclassTile({ required this.myclass });

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
  //const UsersTile({ Key? key }) : super(key: key);
  final Myclass users;
  UsersTile({ required this.users });

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
