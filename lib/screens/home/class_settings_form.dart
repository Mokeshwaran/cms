import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms/shared/decorations.dart';
import 'package:cms/shared/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClassSettingsForm extends StatefulWidget {
  const ClassSettingsForm({Key? key}) : super(key: key);

  @override
  State<ClassSettingsForm> createState() => _ClassSettingsFormState();
}

class _ClassSettingsFormState extends State<ClassSettingsForm> {
  final _formKey = GlobalKey<FormState>();
  String id = FirebaseFirestore.instance.collection('myclasses').doc().id;
  String? _currentClass;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              "Add a Class",
              style: TextStyle(fontSize: 18.0, color: Colors.blue[600]),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              initialValue: '',
              //controller: _fieldText, // you can't use initial value and controller simultaneously.
              style: TextStyle(color: Colors.blue[200]),
              cursorColor: Colors.blue[100],
              decoration: textInputDecoration,
              validator: (value) =>
                  value!.isEmpty ? 'Please Enter A Classname' : null,
              onChanged: (value) => setState(() => _currentClass = value),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
                style: textstyles_main,
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  FirebaseFirestore.instance
                      .collection("myclasses")
                      .doc(id)
                      .set(
                    {
                      'classID': id,
                      'myclass': _currentClass,
                    },
                  );
                  Navigator.pop(context);
                }
                //_fieldText.clear();
                )
          ],
        ));
  }
}

class ClassSettingsFormModify extends StatefulWidget {
  String id;
  ClassSettingsFormModify({Key? key, required this.id}) : super(key: key);

  @override
  State<ClassSettingsFormModify> createState() =>
      _ClassSettingsFormModifyState();
}

class _ClassSettingsFormModifyState extends State<ClassSettingsFormModify> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String? _modifiedClass;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              "Modify the Class",
              style: TextStyle(fontSize: 18.0, color: Colors.blue[600]),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              initialValue: _modifiedClass,
              //controller: _fieldText, // you can't use initial value and controller simultaneously.
              style: TextStyle(color: Colors.blue[200]),
              cursorColor: Colors.blue[100],
              decoration: textInputDecoration,
              validator: (value) =>
                  value!.isEmpty ? 'Please Enter A Classname' : null,
              onChanged: (value) => setState(() => _modifiedClass = value),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
                style: textstyles_main,
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("myclasses")
                      .doc(widget.id)
                      .update(
                    {
                      'classID': widget.id,
                      'myclass': _modifiedClass,
                    },
                  );
                  print('');
                  Navigator.pop(context);
                }
                //_fieldText.clear();
                ),
            SizedBox(height: 150.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: textstyles,
                  child: Text(
                    "Assign me to this Class",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    final User? user = auth.currentUser;
                    final uid = user?.uid;
                    // await FirebaseFirestore.instance
                    //     .collection('classes')
                    //     .doc(uid)
                    //     .update({
                    //       'myclass': 
                    //       });
                  }
                  //_fieldText.clear();
                  ),
            ),
          ],
        ));
  }
}
