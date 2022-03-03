import 'package:cms/models/MyUser.dart';
import 'package:cms/services/dbase.dart';
import 'package:cms/shared/decorations.dart';
import 'package:cms/shared/loading.dart';
import 'package:cms/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  //final _fieldText = TextEditingController();
  late String? _currentName;
  late String? _currentClass;

  @override
  Widget build(BuildContext context) {
    final user3 = Provider.of<MyUser?>(context);

    return StreamBuilder<UserData?>(
        stream: DbaseService(uid: user3?.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Modify Your Name",
                      style: TextStyle(fontSize: 18.0, color: Colors.blue[600]),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData!.name,
                      //controller: _fieldText, // you can't use initial value and controller simultaneously.
                      style: TextStyle(color: Colors.blue[200]),
                      cursorColor: Colors.blue[100],
                      decoration: textInputDecoration,
                      validator: (value) =>
                          value!.isEmpty ? 'Please Enter Your Name' : null,
                      onChanged: (value) =>
                          setState(() => _currentName = value),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      style: textstyles_main,
                      child: Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await DbaseService(uid: user3?.uid).updateUserData(
                            _currentClass = "0",
                            _currentName ?? userData.name,
                          );
                          Navigator.pop(context);
                        }
                        //_fieldText.clear();
                      },
                    )
                  ],
                )
              );
          } else {
            return Loading();
          }
        }
      );
  }
}
