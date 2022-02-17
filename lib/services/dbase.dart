// ignore_for_file: dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms/models/myclass.dart';

class DbaseService {
  final String? uid;
  DbaseService({this.uid});

  // collection reference
  final CollectionReference classCluster =
      FirebaseFirestore.instance.collection('classes');

  Future updateUserData(String mycls, String name) async {
    return await classCluster.doc(uid).set({
      'myclass': mycls,
      'name': name,
    });
  }

  // class list from snapshot
  List<Myclass> _myclassList(QuerySnapshot querySnapshot) {

      return querySnapshot.docs.map((docs) {
        return Myclass(
          mycls: docs.get('myclass') ?? '0',
          name: docs.get('name') ?? ''
        );
      }).toList();
    
  }

  // get class stream
  Stream<List<Myclass>> get classes {
    // 'classes' can be whatever you want
    return classCluster.snapshots().map(_myclassList);
  }
}
