import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Loading/loading.dart';
import 'package:sample_screen/Screens/Signup_Screen.dart';
import 'package:sample_screen/Screens/Start_Screen.dart';
import 'package:sample_screen/Screens/Welcome.dart';
import 'package:sample_screen/Services/Auth_Services.dart';
import 'package:sample_screen/Services/database.dart';
import 'package:sample_screen/Wrapper.dart';

class Subscribe extends StatelessWidget {
  AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    //_authServices.signOutGoogle();
    double height = MediaQuery.of(context).size.height / 40;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5FBFC),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                SizedBox(
                  height: height * 2,
                ),
                Text(
                  'First time?',
                  style: GoogleFonts.heebo(
                      color: Color(0xff41B4C7),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '      Subscribe via your Facebook \n account or your Instagram account',
                  style: GoogleFonts.heebo(
                    color: Color(0xff41B4C7),
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 2,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0))),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("assets/insta.png"),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Instagram',
                            style: GoogleFonts.heebo(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height,
                ),
                InkWell(
                  onTap: ()async{
                    //await _authServices.signInFB();
                    await _authServices.login();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0))),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/facebook.png'),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('Facebook',
                              style: GoogleFonts.heebo(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height,
                ),
                InkWell(
                  onTap: () async {
                    final user = await _authServices.signInWithGoogle();
                    print(user.email);
                    if (user == null) {
                      print('error loging in');
                    } else if (user != null) {
                      uid_constant = await user.uid;
                      final DocumentSnapshot resultQuery =
                          await FirebaseFirestore.instance
                              .collection('UserData')
                              .doc(uid_constant)
                              .get();
                      if (resultQuery == null) {
                        await DatabaseService(uid: uid_constant).UpdateUserData(
                            ' ',
                            ' ',
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

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => StartScreen()));
                      }

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => LoadingScreen()));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0))),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage("assets/google.png"),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('Google',
                              style: GoogleFonts.heebo(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0))),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("assets/apple_logo.png"),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Apple',
                            style: GoogleFonts.heebo(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 3,
                ),
                Container(
                    width: 80,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Color(0xff41B4C7),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)))),
                SizedBox(
                  height: height * 3,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => RegisterPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff41B4C7),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0))),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Email Registration',
                              style: GoogleFonts.heebo(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Welcome()));
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.arrow_back,
                            size: 40,
                            color: Colors.white,
                          ),
                          backgroundColor: Color(0xff41B4C7),
                          radius: 40,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
