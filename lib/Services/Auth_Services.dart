import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Services/database.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // auth change user stream

  Stream<User> get user {
    return _auth.authStateChanges();
  }
  //sign in with email and password

  Future SignInWithEmailPass(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User user = result.user;
      uid_constant = await user.uid;
      return user;
    } catch (e) {
      return null;
    }
  }

  Future SignUpWithEmailPass(
      String Email, String Pass, String F_Name, String L_Name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: Email, password: Pass);
      User user = result.user;
      // setting a constant variable as the uid at the sign up stage
      uid_constant = user.uid;
      //create an instance of the user data in the database
      DatabaseService(uid: user.uid).UpdateUserData(
          F_Name,
          L_Name,
          ' ',
          ' ',
          'Choose a Device',
          ' ',
          ' ',
          ' ',
          'Blood Type',
          'Choose Frequency',
          ' ',
          ' ',
          'https://firebasestorage.googleapis.com/v0/b/laboratoire-bellomo.appspot.com/o/propic.png?alt=media&token=d854a8bd-baf0-4082-84d4-4e3f8b7b423c');
      return user;
    } catch (e) {
      return null;
    }
  }

  Future Sign_Out() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  //sign up with email and password

  //sign out

}
