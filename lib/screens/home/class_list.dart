import 'package:cms/models/myclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassList extends StatefulWidget {
  const ClassList({Key? key}) : super(key: key);

  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  @override
  Widget build(BuildContext context) {

    final classes = Provider.of<List<Myclass?>?>(context);
        classes?.forEach((myclass) {
        print(myclass!.mycls);
        print(myclass.name);
      });
    

    return Container();
  }
}
