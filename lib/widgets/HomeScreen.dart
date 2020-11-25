
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/widgets/FaireCard.dart';
 class HomeScreen extends StatefulWidget {
   @override
   _HomeScreenState createState() => _HomeScreenState();
 }

 class _HomeScreenState extends State<HomeScreen> {
   @override
   Widget build(BuildContext context) {
double size=170;
double TWO_PI=3.14*2;



     return MaterialApp(
       title: 'Welcome to Flutter',
       home: Container(
         decoration: BoxDecoration(
             image: DecorationImage(
                 image: AssetImage("assets/image_back.PNG"), fit: BoxFit.cover)),
         child: SafeArea(
           child: Scaffold(
             backgroundColor: Colors.transparent,
             body: SingleChildScrollView(
               child: Stack( children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Icon(Icons.menu, color: Colors.lightBlue[50],size: 55,),
                       ),
                         Text('Actions', style: GoogleFonts.heebo(color: Colors.lightBlue[50], fontSize: 20),),
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: CircleAvatar(child: Icon(Icons.notifications_none, color: Colors.lightBlue[50],size: 35,),backgroundColor: Colors.pink[200],radius: 25,),
                         )
                     ]),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        SizedBox(width: 10,),
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
                                               child: Column(children: [Text('POINTS', style: GoogleFonts.heebo(fontSize: 18, color: Colors.lightBlue[50]),), Text('52',style: GoogleFonts.heebo(fontSize: 30,color: Colors.lightBlue[50]),),Center(
                                                   child: Text(
                                                     "$percentage"+" %",
                                                     style: GoogleFonts.heebo(fontSize: 11, color: Colors.lightBlue[50])
                                                   ))],),
                                             ),backgroundColor: Colors.pink[200],radius: 59,),)
                                   ],
                                 ),
                               );
                             }),

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
                                       child: Column(children: [Text('JOURS', style: GoogleFonts.heebo(fontSize: 18, color: Colors.lightBlue[50]),), Text('217',style: GoogleFonts.heebo(fontSize: 30,color: Colors.lightBlue[50]),),Center(
                                           child: Text(
                                             "$percentage"+" %",
                                             style: GoogleFonts.heebo(fontSize: 11, color: Colors.lightBlue[50])
                                           )),],),
                                     ),backgroundColor: Colors.pink[200],radius: 59,),)
                                   ],
                                 ),
                               );
                             }),
                         SizedBox(width: 10,)
                       ],
                     ),

                     Stack(
                       children: [
                         Padding(
                         padding: const EdgeInsets.only(left:25.0, bottom: 8.0, right:25.0, top: 25.0),
                         child: Container(
                           height: 130,
                             width: 320,
                             child:
                             Card(
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(35)),
                               ),
                               elevation: 0,
                               color: Colors.lightBlue[50],
                           child: Column(
                             children: [
                               Center(child: Text('Comment ca Va?', style: GoogleFonts.heebo(fontSize: 20, color: Color(0xff5fc9ed)),)),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Image(image: AssetImage('assets/happy.png'),height: 70,width: 70,),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Image(image: AssetImage('assets/happy.png'),height: 70,width: 70,),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Image(image: AssetImage('assets/happy.png'),height: 70,width: 70,),
                                 ),
                                 SizedBox(width: 20,)
                                 ],)
                             ],
                           ),
                         )),
                       ),
                         Positioned(top: 55,left: 300,child: CircleAvatar(radius: 35,backgroundColor: Colors.lightBlue[50],child: CircleAvatar(child: Icon(Icons.add,color: Colors.lightBlue[50],),backgroundColor: Color(0xff5fc9ed),))),

                       ]),
                     Stack(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left:25.0, top: 0.0),
                           child: Container(
                             height: 150,
                             width: 320,
                             child:
                             Card(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(35)),
                                 ),
                                 elevation: 0,
                                 color: Colors.lightBlue[50],
                             child: Padding(
                               padding: const EdgeInsets.only(left: 20, top: 20),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('23 octobre 2020', style: GoogleFonts.heebo(fontSize: 15, color: Color(0xff5fc9ed)),),
                                   Text('Jour 2', style: GoogleFonts.heebo(fontSize: 35, color: Color(0xff5fc9ed)),),

                                 ],
                               ),
                             ),

                             ),),
                         ),
                         Padding(
                         padding: const EdgeInsets.only(left:25.0, bottom: 25.0, right:25.0, top: 80),
                         child: Container(
                             height: 600,
                             width: 320,
                             child:
                             Card(
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(35)),
                               ),
                               elevation: 0,
                               color: Colors.lightBlue[50],
                               child:
                                   ListView.builder(

                                     physics: BouncingScrollPhysics(),
                                     itemCount:5,
                                     // itemCount: _categories.length,
                                     scrollDirection: Axis.vertical,
                                     itemBuilder: (BuildContext context, int index){
                                       return FaireCard(

                                       );

                                     },
                                   )
                             )),
                       ),
                     ]),

                   ],
                 ),

               ],),
             ),
           ),
         ),
       ),
     );

   }
 }
