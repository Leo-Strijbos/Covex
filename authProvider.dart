import 'package:covex/models/user.dart';

import 'dbService.dart';
import 'package:covex/models/newUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covex/models/user.dart';

class authProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  Future getUID() async {
    final user = await _auth.currentUser();
    return user.uid;
  }

  Future gettingData() async {
    String uid = await getUID();
    return await userData(uid: uid).getData(uid);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password, String firstName, String lastName, String userName) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await userData(uid: user.uid).updateUserData(firstName, lastName, userName, [], [], [], []);
      await usernameData().addUserName(userName, user.uid);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print("Error: ${error.toString()}");
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}