import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Services/Auth_Services.dart';
import 'package:sample_screen/Wrapper.dart';

import 'Screens/Home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServices().user,
      child: StreamProvider<GoogleSignInAccount>.value(
    value: AuthServices().googleUser,
      child:MaterialApp(
          debugShowCheckedModeBanner: false,
          home:Wrapper(),//Home()
      ),
    ));
  }
}
