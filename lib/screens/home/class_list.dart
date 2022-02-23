import 'package:cms/models/myclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myclass_tile.dart';

//myclasslist
class MyclassList extends StatefulWidget {
  @override
  _MyclassListState createState() => _MyclassListState();
}

class _MyclassListState extends State<MyclassList> {
  @override
  Widget build(BuildContext context) {
    
    final classes = Provider.of<List<Myclass>?>(context) ?? [];

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: classes.length,
      itemBuilder: (context, index) {
          return MyclassTile(myclass: classes[index]);
      },
    );
  }
}

//userslist
class UsersList extends StatefulWidget {
  const UsersList({ Key? key }) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<Myclass>?>(context) ?? [];

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