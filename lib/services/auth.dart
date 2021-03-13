import 'package:firebase_auth/firebase_auth.dart';
import '../model/AppUse.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUse _userFromFirabase(User user) {
    return user != null ? AppUse(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword
        (email: email, password: password);
      User userFirebase = result.user;
      return _userFromFirabase(userFirebase);

    } catch(e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword
        (email: email, password: password);
      User userFirebase = result.user;
      return _userFromFirabase(userFirebase);

    } catch(e) {
      print(e.toString());
    }
  }
  
  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch(e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
    }
  }
}