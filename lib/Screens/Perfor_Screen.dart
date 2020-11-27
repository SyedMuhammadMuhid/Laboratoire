import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/widgets/PerformancesCard.dart';

import 'Profile.dart';
class PerforScreen extends StatefulWidget {
  @override
  _PerforScreenState createState() => _PerforScreenState();
}

class _PerforScreenState extends State<PerforScreen> {
  double size=210;
  double TWO_PI=3.14*2;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/background_image_app.png"), fit: BoxFit.cover)),
    child: SafeArea(
    child: Scaffold(
    backgroundColor: Colors.transparent,
    body: SingleChildScrollView(

child: Column(children: [
  Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        Padding(

          padding: const EdgeInsets.all(10.0),

          child: GestureDetector(onTap:(){

            Navigator.of(context).push(

                MaterialPageRoute(

                    builder:

                        (BuildContext context) =>ProfileScreen()));

          },child: Icon(Icons.menu, color: Colors.lightBlue[50],size: 55,)),

        ),

        Text('Performances', style: GoogleFonts.heebo(fontSize: 30, color: Color(0xff5fc9ed)),),

        Padding(

          padding: const EdgeInsets.all(10.0),

          child: GestureDetector(onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder:
                        (BuildContext context) => NotificationScreen()));
          },child: CircleAvatar(child: Icon(Icons.notifications_none, color: Colors.lightBlue[50],size: 35,),backgroundColor: Colors.pink[200],radius: 25,)),

        )

      ]),
  Row(mainAxisAlignment: MainAxisAlignment.center

    ,children: [

      TweenAnimationBuilder(

          tween: Tween(begin: 0.0, end: 0.53),

          duration: Duration(seconds: 4),

          builder: (context, value, child) {

            // percentage to show in Center Text

            int percentage = (value * 100).ceil();

            return Container(

              width: size,

              height: size,

              child: Stack(

                children: [

                  ShaderMask(

                    shaderCallback: (rect) {

                      return SweepGradient(

                          startAngle: 0.0,

                          endAngle: TWO_PI,

                          stops: [value, value], // value from Tween Animation Builder

                          // 0.0 , 0.5 , 0.5 , 1.0

                          center: Alignment.center,

                          colors: [Colors.yellow, Colors.transparent])

                          .createShader(rect);

                    },

                    child: Container(

                      width: size,

                      height: size,

                      decoration: BoxDecoration(

                          shape: BoxShape.circle, color: Colors.yellow),

                    ),

                  ),

                  Center(

                    child: Container(

                      width: size - 18,

                      height: size - 18,

                      decoration: BoxDecoration(

                          color:  Color(0xffb8edff), shape: BoxShape.circle),

                    ),

                  ),

                  Center(child:  CircleAvatar(child: Padding(

                    padding: const EdgeInsets.all(15.0),

                    child: Column(mainAxisAlignment: MainAxisAlignment.center,

                      children: [Text('POINTS', style: GoogleFonts.heebo(fontSize: 18, color: Colors.lightBlue[50]),), Text('53',style: GoogleFonts.heebo(fontSize: 30,color: Colors.lightBlue[50]),),Center(

                          child: Text(

                              "$percentage"+" %",

                              style: GoogleFonts.heebo(fontSize: 15, color: Colors.lightBlue[50])

                          )),],),

                  ),backgroundColor: Colors.pink[200],radius: 79,),)

                ],

              ),

            );

          }),

    ],),
  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 600,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(

        physics: BouncingScrollPhysics(),
        itemCount: performance_list.length,
        // itemCount: _categories.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index){
          return PerformancesCard(data: performance_list[index].data,logo: performance_list[index].logo,);
        },
      ),
    ),
  ),

],),

    ))));
  }
}
