import 'package:bus_booking/features/bus_booking/data/datasources/database.dart';
import 'package:bus_booking/features/bus_booking/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create local User
  User _getUserFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user strea
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_getUserFromFirebaseUser);
  }

  //login email and password
  Future loginEmail(
    String email, String password,
  ) async {
    try {
     AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _getUserFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  //register email and password
  Future createAccount(
    String email, 
    String password,
    String name,
    String address,
    String contact
  ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
      await DatabaseService(uid: result.user.uid).updateUserData(name, address, contact);
      return _getUserFromFirebaseUser(result.user);
    } catch (e) {
      if(e is PlatformException) {
        if(e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
         
        }
      }
      print(e.toString());
      return null;
    }
  }

  //logout
  Future signout() async {
    try {
      return await _auth.signOut();
    }

    catch(e) {
      print(e.toString());
      return null;
    }
  }
}