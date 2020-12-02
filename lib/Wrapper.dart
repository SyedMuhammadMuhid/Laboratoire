import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Screens/Home.dart';
import 'package:sample_screen/Screens/Profile.dart';
import 'package:sample_screen/Screens/Welcome.dart';


class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);

    return user==null?Welcome():Home();
  }
}

