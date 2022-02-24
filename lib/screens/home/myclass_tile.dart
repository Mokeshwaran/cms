import 'package:flutter/material.dart';
import 'package:cms/models/myclass.dart';

class MyClassTile extends StatelessWidget {
  //const MyclassTile({ Key? key }) : super(key: key);
  final MyClass myclass;
  MyClassTile({ required this.myclass });

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
  final MyClass users;
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

class ClassesTile extends StatelessWidget {
  //const ClassesTile({ Key? key }) : super(key: key);
  final MyClass classes;
  ClassesTile({ required this.classes });

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
          title: Text(classes.mycls!),
        ),
      ),
    );
  }
}
