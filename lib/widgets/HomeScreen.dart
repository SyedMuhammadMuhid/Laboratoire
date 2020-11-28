
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/Screens/Profile.dart';
import 'package:sample_screen/widgets/Days.dart';
import 'package:sample_screen/widgets/FaireCard.dart';
import 'package:sample_screen/widgets/checkbox.dart';
 class HomeScreen extends StatefulWidget {
   @override
   _HomeScreenState createState() => _HomeScreenState();
 }

 class _HomeScreenState extends State<HomeScreen> {
   List pain_check=[false,false, false, false, false];
   bool self_confidence_check=false;
   bool sleep_check=false;
   bool locution_check=false;
   bool mechanism_check=false;
   @override
   Widget build(BuildContext context) {
double size=170;
double TWO_PI=3.14*2;



     return Container(
         decoration: BoxDecoration(
             image: DecorationImage(
                 image: AssetImage("assets/all_app.png"), fit: BoxFit.cover)),
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
                         child: GestureDetector(onTap:(){
                           Navigator.of(context).push(
                               MaterialPageRoute(
                                   builder:
                                       (BuildContext context) =>ProfileScreen()));
                         },child: Icon(Icons.menu, color: Colors.white,size: 55,)),
                       ),
                         Text('Actions', style: GoogleFonts.heebo(color: Colors.white, fontSize: 30),),
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: GestureDetector(onTap: (){
                             Navigator.of(context).push(
                                 MaterialPageRoute(
                                     builder:
                                         (BuildContext context) => NotificationScreen()));
                           },child: CircleAvatar(child: Icon(Icons.notifications_none, color:Colors.white,size: 35,),backgroundColor: Colors.pink[200],radius: 25,)),
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
                                             color:  Color(0xffA3D5D9), shape: BoxShape.circle),

                                       ),
                                     ),
                                             Center(child:  CircleAvatar(child: Padding(
                                               padding: const EdgeInsets.all(15.0),
                                               child: Column(children: [Text('POINTS', style: GoogleFonts.heebo(fontSize: 18, color: Color(0xffF5FBFC)),), Text('52',style: GoogleFonts.heebo(fontSize: 30,color: Color(0xffF5FBFC)),),Center(
                                                   child: Text(
                                                     "$percentage"+" %",
                                                     style: GoogleFonts.heebo(fontSize: 11, color: Color(0xffF5FBFC))
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
                                             color: Color(0xffA3D5D9), shape: BoxShape.circle),
                                       ),
                                     ),
                                     Center(child:  CircleAvatar(child: Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: Column(children: [Text('JOURS', style: GoogleFonts.heebo(fontSize: 18, color: Color(0xffF5FBFC)),), Text('217',style: GoogleFonts.heebo(fontSize: 30,color: Color(0xffF5FBFC)),),Center(
                                           child: Text(
                                             "$percentage"+" %",
                                             style: GoogleFonts.heebo(fontSize: 11, color: Color(0xffF5FBFC))
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
                           height: tapped==false?130: 1560,
                             width: 320,
                             
                               child: Card(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(35)),
                                 ),
                                 elevation: 0,
                                 color: Color(0xffF5FBFC),
                           child: SingleChildScrollView(
                             child: Column(
                                 children: [
                                   Center(child: Text('Comment ca Va?', style: GoogleFonts.heebo(fontSize: 20, color: Color(0xff41B4C7)),)),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Image(image: AssetImage('assets/happy1.png'),height: 70,width: 70,),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(4.0),
                                       child: Image(image: AssetImage('assets/happy2.png'),height: 70,width: 140,),
                                     ),
                                     SizedBox(width: 20,)
                                     ],),
                                   SizedBox(height: 30,),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(children: [
                                       Image(image: AssetImage('assets/pain.png'),),
                                       SizedBox(width: 20,),
                                       Text('Pain', style: GoogleFonts.heebo(fontSize: 20, color: Colors.black87),)
                                     ],),
                                   ),
                                   Container(
                                     height: 270,
                                     child: ListView.builder(

                                       physics: BouncingScrollPhysics(),
                                       itemCount: Pain.length,
                                       // itemCount: _categories.length,
                                       scrollDirection: Axis.vertical,
                                       itemBuilder: (BuildContext context, int index){
                                         return Checkboxwid(value: Pain[index]);
                                       },
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(children: [
                                       Image(image: AssetImage('assets/self_confidence.png'),),
                                       SizedBox(width: 20,),
                                       Text('Self Confidence', style: GoogleFonts.heebo(fontSize: 20, color: Colors.black87),)
                                     ],),
                                   ),
                                   Container(
                                     height: 215,
                                     child: ListView.builder(

                                       physics: BouncingScrollPhysics(),
                                       itemCount: Self_con.length,
                                       // itemCount: _categories.length,
                                       scrollDirection: Axis.vertical,
                                       itemBuilder: (BuildContext context, int index){
                                         return Checkboxwid(value: Self_con[index]);
                                       },
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(children: [
                                       Image(image: AssetImage('assets/sleep.png'),),
                                       SizedBox(width: 20,),
                                       Text('Sleep', style: GoogleFonts.heebo(fontSize: 20, color: Colors.black87),)
                                     ],),
                                   ),
                                   Container(
                                     height: 215,
                                     child: ListView.builder(

                                       physics: BouncingScrollPhysics(),
                                       itemCount: Sleep.length,
                                       // itemCount: _categories.length,
                                       scrollDirection: Axis.vertical,
                                       itemBuilder: (BuildContext context, int index){
                                         return Checkboxwid(value: Sleep[index]);
                                       },
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(children: [
                                       Image(image: AssetImage('assets/locution.png'),),
                                       SizedBox(width: 20,),
                                       Text('Locution', style: GoogleFonts.heebo(fontSize: 20, color: Colors.black87),)
                                     ],),
                                   ),
                                   Container(
                                     height: 200,
                                     child: ListView.builder(

                                       physics: BouncingScrollPhysics(),
                                       itemCount: Locution.length,
                                       // itemCount: _categories.length,
                                       scrollDirection: Axis.vertical,
                                       itemBuilder: (BuildContext context, int index){
                                         return Checkboxwid(value: Locution[index]);
                                       },
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(children: [
                                       Image(image: AssetImage('assets/mechanism.png'),),
                                       SizedBox(width: 20,),
                                       Text('Mechanism', style: GoogleFonts.heebo(fontSize: 20, color: Colors.black87),)
                                     ],),
                                   ),
                                   Container(
                                     height: 100,
                                     child: ListView.builder(

                                       physics: BouncingScrollPhysics(),
                                       itemCount: Mechanism.length,
                                       // itemCount: _categories.length,
                                       scrollDirection: Axis.vertical,
                                       itemBuilder: (BuildContext context, int index){
                                         return Checkboxwid(value: Mechanism[index]);
                                       },
                                     ),
                                   ),
                                   SizedBox(height: 20,),
                                   Image(image: AssetImage('assets/dropdown_btn.png'),)
                                 ],
                             ),
                           ),
                         ),
                             ),
                       ),
                         Positioned(top: 55,left: 300,
                             child: CircleAvatar(
                                 radius: 35,backgroundColor: Color(0xffF5FBFC),
                                 child: GestureDetector(onTap: (){
                                   tapped=!tapped;
                                   setState(() {

                                     print('i am tapped'+ tapped.toString());
                                   });
                                 },
                                   child: CircleAvatar(
                                     child: Icon(tapped==false?Icons.add:Icons.remove,color: Color(0xffF5FBFC),),
                                     backgroundColor: Color(0xff41B4C7),
                                   ),
                                 ))),

                       ]),
                     Container(
                       height: tapped==false?1000:0,
                       child: ListView.builder(

                         physics: BouncingScrollPhysics(),
                         itemCount: Days.length,
                         // itemCount: _categories.length,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (BuildContext context, int index){
                           return Dayswid(Date: Date[index],Jour: Days[index],);
                         },
                       ),
                     ),
                     /*Stack(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left:25.0, top: 0.0),
                           child: Container(
                             height: tapped==false?150:0,
                             width: tapped==false?320:0,
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
                             height: tapped==false?600:0,
                             width: tapped==false?320:0,
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
                     ]),*/

                   ],
                 ),

               ],),
             ),
           ),
         ),

     );

   }
 }
