import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cms/models/MyUser.dart';
import 'package:cms/models/myclass.dart';

class DbaseService {
  final String? uid;
  DbaseService({this.uid});

  // collection reference
  final CollectionReference classCluster =
      FirebaseFirestore.instance.collection('classes');

  Future updateUserData(String? mycls, String? name) async {
    return await classCluster.doc(uid).set({
      'myclass': mycls,
      'name': name,
    });
  }

  // class list from snapshot
  List<MyClass> _myclassList(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((docs) {
      return MyClass(
          mycls: docs.get('myclass') ?? '', name: docs.get('name') ?? '');
    }).toList();
  }

  UserData _userDataSnap(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.get('name') ?? '',
    );
  }

  // get class stream
  Stream<List<MyClass>> get classes {
    // 'classes' can be whatever you want
    return classCluster.snapshots().map(_myclassList);
  }

  Stream<UserData> get userData {
    return classCluster.doc(uid).snapshots().map(_userDataSnap);
  }

  Future deleteuser() {
    return classCluster.doc(uid).delete();
  }
}
