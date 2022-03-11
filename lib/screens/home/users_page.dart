import 'package:cms/models/myclass.dart';
import 'package:cms/services/dbase.dart';
import 'package:cms/shared/button_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'class_list.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MyClass>?>.value(
      initialData: null,
      value: DbaseService(uid: null).classes,
      child: Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          backgroundColor: Colors.orange[400],
          title: const Text("Users"),
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
          child: Column(
            children: const <Widget>[
              SizedBox(height: 4.0),
              ButtonList2(),
              Expanded(child: UsersList()),
            ],
          ),
        ),
      ),
    );
  }
}
