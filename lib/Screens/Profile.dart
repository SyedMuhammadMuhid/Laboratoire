import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Screens/Home.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/background_image_app.png"), fit: BoxFit.cover)),
    child: SafeArea(
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(onTap:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder:
                              (BuildContext context) =>Home()));
                },child: Icon(Icons.arrow_back, color: Colors.lightBlue[50],size: 55,)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(child: Icon(Icons.notifications_none, color: Colors.lightBlue[50],size: 35,),backgroundColor: Colors.pink[200],radius: 25,),
              )
            ]),
      ],),
    )

    ));
  }
}
