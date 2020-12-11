import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Services/database.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential facebookUser;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // auth change user stream

  Stream<User> get user {
    return auth.authStateChanges();
  }

  Stream<GoogleSignInAccount> get googleUser {
    return googleSignIn.onCurrentUserChanged;
  }

  //sign in with facebook
  final fbLogin = FacebookLogin();

  //FacebookLogin _facebookLogin=new FacebookLogin();
  Future<UserCredential> signInFB() async {
    final FacebookLoginResult result =
        await fbLogin.logIn(["email", 'public_profile']);
    final String token = result.accessToken.token;
//    final response = await http.get(
//        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
//
    AuthCredential credential = FacebookAuthProvider.credential(token);
//
    facebookUser = await auth.signInWithCredential(credential);
    //  final profile = jsonDecode(graphResponse.body);
    print('sucesssss');
    print(facebookUser.user.uid);

    return facebookUser;
  }

  Future FBLogout() async {
    await fbLogin.logOut();

    print('logged out');
  }

  // sign in with google

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final authResult = await auth.signInWithCredential(credential);
    final User user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = await auth.currentUser;
    //assert(user.uid == currentUser.uid);
    var id = await currentUser.uid;
    print('signInWithGoogle succeeded:');
    print(id);
    uid_constant = id;

    return user;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }

  //sign in with email and password

  Future SignInWithEmailPass(String email, String pass) async {
    try {
      UserCredential result =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      User user = result.user;
      uid_constant =  user.uid;

      final snapShot = await FirebaseFirestore.instance
          .collection('UserData')
          .doc(uid_constant).collection('Points').get();
      if(snapShot.docs.length!=0){
        return 1;
      }
      else if(snapShot.docs.length==0) {
        return null;
      }
      else{
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future SignUpWithEmailPass(
      String Email, String Pass, String F_Name, String L_Name) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: Email, password: Pass);
      User user = result.user;
      // setting a constant variable as the uid at the sign up stage
      uid_constant =  user.uid;
      //create an instance of the user data in the database
      final snapShot = await FirebaseFirestore.instance
          .collection('UserData')
          .doc(uid_constant)
          .get();
      if(snapShot.exists){
        return 0;
      }
      else {
        DatabaseService(uid: user.uid).UpdateUserData(
            F_Name,
            L_Name,
            ' ',
            ' ',
            'Choisissez un appareil',
            ' ',
            ' ',
            ' ',
            'Groupe sanguin',
            'Choisissez la fréquence',
            0,
            ' ',
            'https://firebasestorage.googleapis.com/v0/b/laboratoire-bellomo.appspot.com/o/propic.png?alt=media&token=d854a8bd-baf0-4082-84d4-4e3f8b7b423c');
        return user;
      }
    } catch (e) {
      return null;
    }
  }

  Future Sign_Out() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      return await auth.signOut();
    } catch (e) {
      return null;
    }
  }

  //sign up with email and password

  //sign out

}
