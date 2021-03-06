// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:cms/services/auth.dart';
import 'package:cms/shared/loading.dart';
import 'package:cms/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  //const Register({Key? key, void Function() toggleView}) : super(key: key);

  final Function switchPage;
  Register({required this.switchPage});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.blue[800],
            appBar: AppBar(
              backgroundColor: Colors.orange[400],
              elevation: 0.0,
              title: Text(
                'Register User',
                style: TextStyle(color: Colors.orange[50]),
              ),
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton.icon(
                    icon: const Icon(Icons.login_rounded),
                    label:
                        const Text('Sign In', style: TextStyle(fontSize: 17.0)),
                    textColor: Colors.blue[600],
                    onPressed: () {
                      widget.switchPage();
                    })
              ],
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'Class Management System',
                        style: TextStyle(
                            color: Colors.blue[100],
                            fontSize: 25,
                            fontFamily: 'Nunito'),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                        style: TextStyle(color: Colors.blue[100]),
                        cursorColor: Colors.blue[100],
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline_rounded,
                            color: Colors.blue.shade100,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              fontSize: 17.0, color: Colors.blue.shade100),
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
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an email' : null,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                              new RegExp(r"\s\b|\b\s"))
                        ],
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    const SizedBox(height: 20.0),
                    TextFormField(
                        style: TextStyle(color: Colors.blue[100]),
                        cursorColor: Colors.blue[100],
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.blue.shade100,
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontSize: 17.0, color: Colors.blue.shade100),
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
                        validator: (val) => val!.length < 8
                            ? 'Password must be more than 8 characters'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.orange.shade50, fontSize: 17.0),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            dynamic result2 = await _auth
                                .registrationEmailPword(email, password);
                            if (result2 == null) {
                              setState(() {
                                error = 'Please enter a valid email';
                                loading = false;
                              });
                            }
                          }
                        },
                        style: textstyles_main,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
