import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Screens/Home.dart';
import 'package:sample_screen/Screens/Welcome.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);

    if(user==null) {
      return Welcome();
    }
    else if(user!=null){
      index_nav=0;
      return Home();
    }
  }
}
