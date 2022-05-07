import 'package:animations/animations.dart';
import 'package:cms/models/myclass.dart';
import 'package:cms/screens/home/userHelp.dart';
import 'package:cms/services/auth.dart';
import 'package:cms/services/dbase.dart';
import 'package:cms/screens/home/class_list.dart';
import 'package:cms/shared/button_list.dart';
import 'package:cms/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MyClass>?>.value(
        initialData: null,
        value: DbaseService(uid: null).classes,
        child: Scaffold(
          backgroundColor: Colors.blue[800],
          appBar: AppBar(
            title: Text('CAMS', style: TextStyle(color: Colors.yellow[50])),
            backgroundColor: Colors.orange[400],
            elevation: 0.0,
            actions: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.logout_rounded),
                label: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 17.0),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.blue[600],
                ),
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.blue[100],
                          title: Text(
                            "Logging Out",
                            style: TextStyle(
                                color: Colors.blue.shade500, fontSize: 17.0),
                          ),
                          content: Text(
                            "Are you sure you want to logout?",
                            style: TextStyle(
                                color: Colors.blue.shade500, fontSize: 17.0),
                          ),
                          actions: [
                            ElevatedButton(
                              style: textstyles_delete,
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17.0),
                              ),
                              onPressed: () async {
                                await _auth.signOut();
                                Navigator.pop(context);
                              },
                            ),
                            ElevatedButton(
                              style: textstyles_cancel,
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17.0),
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
              )
            ],
          ),
          body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
            child: Column(
              children: const <Widget>[
                SizedBox(height: 5.0),
                ButtonList(),
                Expanded(child: MyClassList()),
              ],
            ),
          ),
          floatingActionButton: OpenContainer(
              transitionDuration: const Duration(milliseconds: 400),
              closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              closedColor: Colors.orange.shade500,
              closedBuilder: (BuildContext c, VoidCallback action) =>
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.help_rounded,
                      color: Colors.white,
                      size: 35.0,
                    ),
                  ),
              openBuilder: (BuildContext c, VoidCallback action) =>
                  const Help(),
              tappable: true),
        ));
  }
}
