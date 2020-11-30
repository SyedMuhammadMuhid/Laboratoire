import 'package:flutter/material.dart';
import 'package:sample_screen/Screens/Start_Screen.dart';
import 'package:sample_screen/Screens/Welcome.dart';
import 'package:sample_screen/Wrapper.dart';

import 'Screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Wrapper()//Home()
    );
  }
}
