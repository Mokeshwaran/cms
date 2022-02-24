import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms/screens/home/settings_form.dart';
import 'package:cms/screens/home/users_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'text_styles.dart';

class ButtonList extends StatelessWidget {
  const ButtonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Classes',
                      style: TextStyle(color: Colors.green.shade50),
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ClassesPage()));
                    },
                    style: textstyles,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Users',
                      style: TextStyle(color: Colors.green.shade50),
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => UsersPage()));
                    },
                    style: textstyles,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonList2 extends StatefulWidget {
  const ButtonList2({Key? key}) : super(key: key);

  @override
  State<ButtonList2> createState() => _ButtonList2State();
}

class _ButtonList2State extends State<ButtonList2> {
  final collection = FirebaseFirestore.instance.collection('classes');
  final String? user = FirebaseAuth.instance.currentUser?.uid;
  String? currentUserName;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('classes')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      currentUserName = snapshot['name'];
      print(currentUserName);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Show Modify Bottom Sheet
    void _modifyUsername() {
      showModalBottomSheet(
          backgroundColor: Colors.blue[100],
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Modify',
                      style: TextStyle(color: Colors.green.shade50),
                    ),
                    onPressed: () => _modifyUsername(),
                    style: textstyles,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.red.shade50),
                    ),
                    onPressed: () async {
                      if (user != null) {
                        collection.doc(user).delete().then((value) => '');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'User $currentUserName deleted successfully')));
                      } else {
                        print('');
                      }
                      await FirebaseAuth.instance.currentUser?.delete();
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                    style: textstyles_delete,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonList3 extends StatefulWidget {
  const ButtonList3({Key? key}) : super(key: key);

  @override
  State<ButtonList3> createState() => _ButtonList3State();
}

class _ButtonList3State extends State<ButtonList3> {
  final collection = FirebaseFirestore.instance.collection('classes');
  final String? user = FirebaseAuth.instance.currentUser?.uid;
  String? currentClassName;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('classes')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      currentClassName = snapshot['myclass'];
      print(currentClassName);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Show Modify Bottom Sheet
    void _modifyClassname() {
      showModalBottomSheet(
          backgroundColor: Colors.blue[100],
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: ClassSettingsForm(),
            );
          });
    }

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Modify',
                      style: TextStyle(color: Colors.green.shade50),
                    ),
                    onPressed: () => _modifyClassname(),
                    style: textstyles,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.red.shade50),
                    ),
                    onPressed: () async {
                      if (user != null) {
                        collection.doc(user).delete().then((value) => '');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'User $currentClassName deleted successfully')));
                      } else {
                        print('');
                      }
                    },
                    style: textstyles_delete,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

