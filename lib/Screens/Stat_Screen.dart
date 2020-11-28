import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/Screens/Profile.dart';
import 'package:sample_screen/widgets/ImageCard.dart';


class StatScreen extends StatefulWidget {
  @override
  _StatScreenState createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  double size=210;
  double TWO_PI=3.14*2;
  double progress=53;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/all_app.png"), fit: BoxFit.cover)),
    child: SafeArea(
    child: Scaffold(
      backgroundColor: Colors.transparent,
body: SingleChildScrollView(
  child:   Column(
  
    children: [
  
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
  
              },child: Icon(Icons.menu, color:Color(0xffF5FBFC),size: 55,)),
  
            ),
  
            Text('Evoluion', style: GoogleFonts.heebo(fontSize: 30, color:Colors.white),),
  
            Padding(
  
              padding: const EdgeInsets.all(10.0),
  
              child: GestureDetector(onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder:
                            (BuildContext context) => NotificationScreen()));
              },child: CircleAvatar(child: Icon(Icons.notifications_none, color: Colors.white,size: 35,),backgroundColor: Colors.pink[200],radius: 25,)),
  
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
  
                            color:  Color(0xffA3D5D9), shape: BoxShape.circle),
  
                      ),
  
                    ),
  
                    Center(child:  CircleAvatar(child: Padding(
  
                      padding: const EdgeInsets.all(15.0),
  
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
  
                        children: [Text('   JOURS\n RESTANTS', style: GoogleFonts.heebo(fontSize: 18, color:Color(0xffF5FBFC)),), Text('217',style: GoogleFonts.heebo(fontSize: 30,color:Color(0xffF5FBFC)),),Center(
  
                          child: Text(
  
                              "$percentage"+" %",
  
                              style: GoogleFonts.heebo(fontSize: 15, color: Color(0xffF5FBFC))
  
                          )),],),
  
                    ),backgroundColor: Colors.pink[200],radius: 79,),)
  
                  ],
  
                ),
  
              );
  
            }),
  
      ],),
  
      Container(
  
        child: Row(mainAxisAlignment:MainAxisAlignment.center,
  
          children: [
  
          Container(child:Stack(children: [
  
            Image.asset('assets/mountains.png', height: 200,width: 400,),
  
            Positioned(top: 100-progress,left: 0+(progress*3.4),
  
                child: Stack(
  
                  children: [
  
                    Container(height:100, width:33.3, child:Image.asset('assets/flag.png'),),
  
                    Text(progress.toString()+" %", style: GoogleFonts.heebo(color: Colors.red),)
  
                  ],
  
                ))
  
          ],)
  
            ,)
  
        ],),
  
      ),
  
  
  
      Row(mainAxisAlignment: MainAxisAlignment.center,
  
      children: [
  
        Text("Ta Progression\n     en photos", style: GoogleFonts.heebo(fontSize: 40, color: Colors.white),),
  
      ],),
  
      Row(mainAxisAlignment: MainAxisAlignment.center,
  
      children: [
  
        Text("Une fois par mois, prend une photo\nde ton sourier afin de voir l'evolution.",style: GoogleFonts.heebo(fontSize: 20, color: Colors.white))
  
      ],),


  
    ],
  
  ),
),
    )));
  }
}
