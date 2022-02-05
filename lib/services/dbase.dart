import 'package:cloud_firestore/cloud_firestore.dart';

class DbaseService {

  // collection reference
  final CollectionReference classCollection = FirebaseFirestore.instance.collection('classes');

}