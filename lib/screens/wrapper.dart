import 'package:cms/models/MyUser.dart';
import 'package:cms/screens/authenticate/authenticate.dart';
import 'package:cms/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user3 = Provider.of<MyUser?>(context);
    //print(user3);

    // return either Home or Authenticate widget
    if (user3 == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
