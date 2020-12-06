import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Models/User_Data_Model.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/Screens/Profile.dart';
import 'package:sample_screen/Services/database.dart';
import 'package:sample_screen/widgets/ImageCard.dart';

class StatScreen extends StatefulWidget {
  @override
  _StatScreenState createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  double TWO_PI = 3.14 * 2;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);


    double size = MediaQuery.of(context).size.width/2;
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
    builder: (context, snapshot) {
      if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
    UserData userdata=snapshot.data;
      int progress =(100/userdata.Total_duration).toInt()+1;

    int Day_index= (Timestamp.now().toDate().difference(userdata.Start_date.toDate()).inDays);


    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/all_app.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ProfileScreen()));
                            },
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 55,
                            )),
                      ),
                      Text(
                        'Evolution',
                        style: GoogleFonts.heebo(
                            color: Colors.white, fontSize: 30),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      NotificationScreen()));
                            },
                            child: CircleAvatar(
                              child: Badge(
                                  badgeContent: Text(
                                    '2',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  child: Icon(
                                    Icons.notifications_none,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                              backgroundColor: Color(0xffFF999A),
                              radius: 25,
                            )),
                      )
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TweenAnimationBuilder(
                        tween: Tween(begin: 0.0, end:  ((100/userdata.Total_duration)*(Day_index+1))/100),
                        duration: Duration(seconds: 4),
                        builder: (context, value, child) {
                          // percentage to show in Center Text

                          int percentage = (value * 100).ceil();

                          return Container(
                            width: size,
                            height: size,
                            child: Stack(
                              children: [
                                ImageIcon(AssetImage('assets/dotted.png'),color: Colors.white,size: size,),

                                ShaderMask(
                                  shaderCallback: (rect) {
                                    return SweepGradient(
                                        startAngle: 0.0,
                                        endAngle: TWO_PI,
                                        stops: [
                                          value,
                                          value
                                        ], // value from Tween Animation Builder

                                        // 0.0 , 0.5 , 0.5 , 1.0

                                        center: Alignment.center,
                                        colors: [
                                          Colors.yellow,
                                          Colors.transparent
                                        ]).createShader(rect);
                                  },
                                  child: Container(
                                    width: size,
                                    height: size,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.yellow),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: size - 18,
                                    height: size - 18,
                                    decoration: BoxDecoration(
                                        color: Color(0xffA3D5D9),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Center(
                                  child: CircleAvatar(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '   JOURS\n RESTANTS',
                                            style: GoogleFonts.heebo(
                                                fontSize: 18,
                                                color: Color(0xffF5FBFC)),
                                          ),
                                          Text(
                                            userdata.Total_duration.toString(),
                                            style: GoogleFonts.heebo(
                                                fontSize: 30,
                                                color: Color(0xffF5FBFC)),
                                          ),
                                          Center(
                                              child: Text("$percentage" + " %",
                                                  style: GoogleFonts.heebo(
                                                      fontSize: 15,
                                                      color:
                                                          Color(0xffF5FBFC)))),
                                        ],
                                      ),
                                    ),
                                    backgroundColor: Color(0xffFF6766),
                                    radius: 79,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/mountains.png',
                              height: 200,
                              width: 400,
                            ),
                            Positioned(
                                top: 100 - progress.toDouble(),
                                left: 0 + (progress * 3.4),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 33.3,
                                      child: Image.asset('assets/flag.png'),
                                    ),
                                    Text(
                                      progress.toString() + " %",
                                      style:
                                          GoogleFonts.heebo(color: Colors.red),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ta Progression\n     en photos",
                      style:
                          GoogleFonts.heebo(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Une fois par mois, prend une photo\nde ton sourier afin de voir l'evolution.",
                        style: GoogleFonts.heebo(
                            fontSize: 20, color: Colors.white))
                  ],
                ),
              ],
            ),
          ),
        )));});
  }
}
