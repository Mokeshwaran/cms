// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms/screens/home/classes_page.dart';
import 'package:cms/screens/home/settings_form.dart';
import 'package:cms/screens/home/users_page.dart';
import 'package:cms/services/auth.dart';
import 'package:cms/shared/loading.dart';
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
                      style: TextStyle(
                          color: Colors.green.shade50, fontSize: 17.0),
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ClassesPage()));
                    },
                    style: textstyles,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Users',
                      style: TextStyle(
                          color: Colors.green.shade50, fontSize: 17.0),
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UsersPage()));
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
  final email = FirebaseAuth.instance.currentUser!.email;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String? currentUserName;
  String? password;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('classes')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      currentUserName = snapshot['name'];
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
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: const SettingsForm(),
            );
          });
    }

    void errorMessage() {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                content: Text(
                    'Incorrect Password, kindly check before entering',
                    style: TextStyle(color: Colors.white)),
                alignment: Alignment.center,
                backgroundColor: Color(0xffAF0606),
              ));
    }

    void progressIndicator() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Row(
                  children: [
                    const LoadingDelete(),
                    SizedBox(width: 20.0),
                    Text('Deleting user',
                        style: TextStyle(color: Colors.blue.shade100)),
                  ],
                ),
                alignment: Alignment.center,
                backgroundColor: Colors.blue.shade800,
              ));
    }

    void _deleteUserForm() {
      TextEditingController passwordController = TextEditingController();
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Enter Password To Delete The User',
                    style: TextStyle(color: Colors.blue.shade500)),
                insetPadding: const EdgeInsets.all(10.0),
                backgroundColor: Colors.blue.shade100,
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                          autofocus: true,
                          controller: passwordController,
                          style: TextStyle(color: Colors.blue[100]),
                          cursorColor: Colors.blue[100],
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.blue.shade100,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontSize: 15.0, color: Colors.blue.shade100),
                            fillColor: Colors.blue[600],
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue.shade400, width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orange.shade400, width: 1.0),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          }),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        child: const Text(
                          'DELETE USER',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => progressIndicator());
                            dynamic result2 = await _auth.deleteUser(
                                email!, passwordController.text);
                            print(result2);
                            if (result2 == null) {
                              setState(
                                () => errorMessage(),
                              );
                            } else {
                              collection.doc(user).delete().then((value) => '');
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'User $currentUserName deleted successfully')));
                              passwordController.clear();
                              FirebaseAuth.instance.signOut();
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                          }
                        },
                        style: textstyles_delete,
                      ),
                    ],
                  ),
                ),
              ));
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
                      style: TextStyle(color: Colors.green.shade50, fontSize: 17.0),
                    ),
                    onPressed: () => _modifyUsername(),
                    style: textstyles,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.red.shade50, fontSize: 17.0),
                    ),
                    onPressed: () async {
                      _deleteUserForm();
                      if (user == null) {
                        Navigator.pop(context);
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
