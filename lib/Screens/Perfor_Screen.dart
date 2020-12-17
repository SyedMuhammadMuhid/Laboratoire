import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Models/User_Data_Model.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/Services/database.dart';
import 'package:sample_screen/widgets/PerformancesCard.dart';

import 'Profile.dart';

class PerforScreen extends StatefulWidget {
  @override
  _PerforScreenState createState() => _PerforScreenState();
}

class _PerforScreenState extends State<PerforScreen> {
  double TWO_PI = 3.14 * 2;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 2;
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
    builder: (context, snapshot) {
    if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
    UserData userdata = snapshot.data;
    int Day_index= (Timestamp.now().toDate().difference(userdata.Start_date.toDate()).inDays);


    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('UserData').doc(uid_constant).collection('Points').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData)return Container();
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/all_app.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
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
                                'Performances',
                                style: GoogleFonts.heebo(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  NotificationScreen()));
                                    },
                                    child: notification_list.length==0?CircleAvatar(
                                      child: Icon(
                                        Icons.notifications_none,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      backgroundColor: Color(0xffFF999A),
                                      radius: 25,
                                    ):CircleAvatar(
                                      child: Badge(
                                          badgeContent: Text(
                                            notification_list.length.toString(),
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
                                tween: Tween(begin: 0.0, end: snapshot.data.docs[Day_index]["TotalPoints"]/100),
                                duration: Duration(seconds: 4),
                                builder: (context, value, child) {
                                  // percentage to show in Center Text

                                  int percentage = (value * 100).ceil();

                                  return Container(
                                    width: size,
                                    height: size,
                                    child: Stack(
                                      children: [
                                        ImageIcon(
                                          AssetImage('assets/dotted.png'),
                                          color: Colors.white,
                                          size: size,
                                        ),
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
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'POINTS',
                                                    style: GoogleFonts.dMSerifText(
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xffF5FBFC)),
                                                  ),
                                                  Text(
                                                    snapshot.data.docs[Day_index]["TotalPoints"].toString(),
                                                    style: GoogleFonts.dMSerifText(
                                                        fontSize: 30,
                                                        color:
                                                            Color(0xffF5FBFC)),
                                                  ),
                                                  Center(
                                                      child: Text(
                                                          "$percentage",
                                                          style: GoogleFonts.heebo(
                                                              fontSize: 15,
                                                              color: Color(
                                                                  0xffF5FBFC)))),
                                                ],
                                              ),
                                            ),
                                            backgroundColor: Color(0xffFF6766),
                                            radius: (size-30)/2,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),

                              itemCount: performance_list.length,

                              // itemCount: _categories.length,

                              scrollDirection: Axis.vertical,

                              itemBuilder: (BuildContext context, int index) {
                                return PerformancesCard(
                                  data: performance_list[index].data,
                                  logo: performance_list[index].logo,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));});});
  }
}
