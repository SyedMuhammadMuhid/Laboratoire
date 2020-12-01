import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AuthServices{

  final FirebaseAuth _auth= FirebaseAuth.instance;




  // auth change user stream

  Stream <User> get user{
    return _auth.authStateChanges();
  }
  //sign in with email and password

Future SignInWithEmailPass(String email, String pass)async{

  try{

    UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: pass);
    User user=result.user;
    return user;

  }catch(e){
    return null;
  }

}
  Future SignUpWithEmailPass(String Email, String Pass, String F_name, String L_name)async
  {
    try{
      UserCredential result= await _auth.createUserWithEmailAndPassword(email: Email, password: Pass);
      User user= result.user;
      return user;

    }catch(e){
      return null;
    }
  }

  Future Sign_Out() async{

    try{
      return await _auth.signOut();
    }catch(e){
      return null;
    }
  }

  //sign up with email and password

  //sign out


}