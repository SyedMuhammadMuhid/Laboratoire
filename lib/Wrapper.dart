import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Screens/Home.dart';
import 'package:sample_screen/Screens/Start_Screen.dart';
import 'package:sample_screen/Screens/Welcome.dart';
import 'package:sample_screen/Services/Auth_Services.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final googleUser = Provider.of<GoogleSignInAccount>(context);
    if(user!=null){
      uid_constant=user.uid;}
return FutureBuilder(
  future: user==null?_dummycaller():_asyncawaitfun(),
  builder: (context,snapshot){
    if(snapshot.connectionState== ConnectionState.done){
    if(user==null? true:SnapShot_warpper.docs.length!=0){
    return user == null && googleUser == null ? Welcome() : Home();
    }
    else{
      return StartScreen();
    }

    }
    else{
      return Center(child: CircularProgressIndicator());
    }
    });
}
}

Future _asyncawaitfun()async{

  SnapShot_warpper= await FirebaseFirestore.instance
      .collection('UserData')
      .doc(uid_constant).collection('Points').get();
  return SnapShot_warpper;
}
Future _dummycaller()async{

  final snap=await FirebaseFirestore.instance
      .collection('UserData').get();
  return snap;
}
