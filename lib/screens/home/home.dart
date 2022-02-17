import 'package:cms/models/myclass.dart';
import 'package:cms/services/auth.dart';
import 'package:cms/services/dbase.dart';
import 'package:cms/screens/home/class_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Myclass?>?>.value(
        initialData: null,
        value: DbaseService(uid: '').classes,
        child: Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          title: Text('Class Management System', style: TextStyle(color: Colors.yellow[50])),
          backgroundColor: Colors.orange[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.logout_rounded),
              label: Text('Logout'),
              style: TextButton.styleFrom(
                primary: Colors.blue[600],
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: ClassList(),
      ),
    );
  }
}
