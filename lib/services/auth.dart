import 'package:cms/models/MyUser.dart';
import 'package:cms/services/dbase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create user object based on FirebaseUser
  MyUser? _userfromFirebase(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_userfromFirebase);
  }

  // sign in email password
  Future signInEmailPword(String email, String password) async {
    try {
      UserCredential result1 = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user1 = result1.user;
      return _userfromFirebase(user1);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // reg with email password
  Future registrationEmailPword(String email, String password) async {
    try {
      UserCredential result1 = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user1 = result1.user;

      // create a new document for the user with the uid
      await DbaseService(uid: user1!.uid).updateUserData('1', 'user');
      return _userfromFirebase(user1);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
