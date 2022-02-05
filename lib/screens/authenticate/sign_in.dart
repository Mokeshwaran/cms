import 'package:cms/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  //const SignIn({Key? key, void Function() toggleView}) : super(key: key);

  final Function switchPage;
  SignIn({required this.switchPage});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0.0,
        title: Text('Please Sign In', style: TextStyle(color:Colors.yellow[100]),),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.app_registration_rounded),
            label: Text('Register'),
            textColor: Colors.blue[600],
            onPressed: () {
              widget.switchPage();
            }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                style: TextStyle(color: Colors.blue[100]),
                cursorColor: Colors.blue[100],
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline_rounded, color: Colors.blue.shade100,),
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.blue.shade100),
                  fillColor: Colors.blue[600],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade400, width: 1.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange.shade400, width: 1.0),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                    setState(() => email = val);
                  }
                ),
              SizedBox(height: 20.0),
              TextFormField(
                style: TextStyle(color: Colors.blue[100]),
                cursorColor: Colors.blue[100],
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.blue.shade100,),
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.blue.shade100),
                  fillColor: Colors.blue[600],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade400, width: 1.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange.shade400, width: 1.0),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                obscureText: true,
                validator: (val) => val!.length < 8 ? 'Enter password with more than 8 characters' : null,
                onChanged: (val) {
                    setState(() => password = val);
                  }
                ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.orange.shade50),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result2 = await _auth.signInEmailPword(email, password);
                    if(result2 == null){
                      setState(() => error = 'Could not sign in, please check username/password');
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange.shade400),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5),
                      side: BorderSide(
                      color: Colors.orange.shade400,
                      width: 2.0,
                      ),
                    ),
                  ),
                )
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
