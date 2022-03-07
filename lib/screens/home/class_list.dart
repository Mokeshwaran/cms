import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms/models/myclass.dart';
import 'package:cms/screens/home/class_settings_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myclass_tile.dart';

//myclasslist
class MyClassList extends StatefulWidget {
  const MyClassList({Key? key}) : super(key: key);

  @override
  _MyClassListState createState() => _MyClassListState();
}

class _MyClassListState extends State<MyClassList> {
  @override
  Widget build(BuildContext context) {
    final classes = Provider.of<List<MyClass>?>(context) ?? [];

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: classes.length,
      itemBuilder: (context, index) {
        return MyClassTile(myclass: classes[index]);
      },
    );
  }
}

//userslist
class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<MyClass>?>(context) ?? [];

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UsersTile(users: users[index]);
      },
    );
  }
}

class ClassesList extends StatefulWidget {
  const ClassesList({Key? key}) : super(key: key);

  @override
  _ClassesListState createState() => _ClassesListState();
}

class _ClassesListState extends State<ClassesList> {
  String? classId;

  Widget buildList(QuerySnapshot? snapshot) {
    void _modifyClassName(id) {
      showModalBottomSheet(
          backgroundColor: Colors.blue[100],
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: ClassSettingsFormModify(id: id),
            );
          });
    }

    return ListView.builder(
      itemCount: snapshot?.docs.length,
      itemBuilder: (context, index) {
        final doc = snapshot?.docs[index];
        String id = doc!.id;
        return InkWell(
          key: Key(id),
          onTap: () {
            _modifyClassName(id);
          },
          child: Dismissible(
            key: Key(id),
            background: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                color: Colors.red.shade500,
                child: Center(
                  child: RichText(
                    text: const TextSpan(
                      text: 'Deleted',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                ),
              ),
            ),
            onDismissed: (direction) {
              FirebaseFirestore.instance.collection('myclasses').doc(doc.id).delete();
            },
            child: Card(
              margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
              child: ListTile(
                title: Text(doc['myclass']),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('myclasses').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const LinearProgressIndicator();
          return Expanded(child: buildList(snapshot.data));
        });
  }
}
