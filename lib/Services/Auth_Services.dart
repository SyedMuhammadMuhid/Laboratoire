import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Services/database.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

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
  final facebookSignIn = FacebookLogin();
  //FacebookLogin _facebookLogin=new FacebookLogin();
  Future signInFB() async {
//    var result =
//    await fbLogin.logInWithReadPermissions(['email', 'public_profile']);
    //final FacebookLoginResult result = await fbLogin.logIn(["email",'public_profile']);

    final FacebookLoginResult result = await fbLogin.logIn(["email",'public_profile']);
    final String token = result.accessToken.token;
    final response = await       http.get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
    final profile = jsonDecode(response.body);


//      AuthCredential credential =
//      FacebookAuthProvider.credential(myToken.token);
//
//      var user = await FirebaseAuth.instance.signInWithCredential(credential);
    //  final profile = jsonDecode(graphResponse.body);
      print('sucesssss');
      print(profile);
    }

  Future<Null> login() async {
    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }



  void _showMessage(String message) {
  print(message);
  }


Future  FBLogout()async{
  await fbLogin.logOut();
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
    var id= await currentUser.uid;
    print('signInWithGoogle succeeded:');
    print(id);
    uid_constant = id;
//    await DatabaseService(uid:id).UpdateUserData(
//        ' ',
//        ' ',
//        ' ',
//        ' ',
//        'Choose a Device',
//        ' ',
//        ' ',
//        ' ',
//        'Blood Type',
//        'Choose Frequency',
//        0,
//        ' ',
//        'https://firebasestorage.googleapis.com/v0/b/laboratoire-bellomo.appspot.com/o/propic.png?alt=media&token=d854a8bd-baf0-4082-84d4-4e3f8b7b423c');

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
      uid_constant = await user.uid;
      return user;
    } catch (e) {
      return null;
    }
  }

  Future SignUpWithEmailPass(
      String Email, String Pass, String F_Name, String L_Name) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
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
          0,
          ' ',
          'https://firebasestorage.googleapis.com/v0/b/laboratoire-bellomo.appspot.com/o/propic.png?alt=media&token=d854a8bd-baf0-4082-84d4-4e3f8b7b423c');
      return user;
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
