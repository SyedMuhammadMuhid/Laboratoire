import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Loading/loading.dart';
import 'package:sample_screen/Screens/First_Profile_Screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height/30;
    double width= MediaQuery.of(context).size.width/10;
    return MaterialApp(
      home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/login_back.png"), fit: BoxFit.cover)),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                 body: SingleChildScrollView(
                   child: Column(
                     children: <Widget>[
                       SizedBox(height: height,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Image(image: AssetImage('assets/logo_blue.png'),height: 50, width: 50,),
                         SizedBox(width: 5,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('''Laboratoire\nBellomo & Lambert''', style: GoogleFonts.heebo(fontSize: 20,color: Color(0xff41B4C7), ),),
                           ],
                         )
                       ],),
                       SizedBox(height: height*1.3,),
                       Image(image: AssetImage("assets/faces.png"),height: height*14,width: width*9,),
                       Padding(
                         padding: const EdgeInsets.only(top: 17),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [

                             Column(
                               children: [
                                 Text('Perfect Smile', style: GoogleFonts.heebo(fontSize: 35, color: Colors.black87 ),),
                                 Text('Welcome, you are now ', style: GoogleFonts.heebo(fontSize: 18, color: Colors.black54),),
                                 Text('ready to start ! ', style: GoogleFonts.heebo(fontSize: 18, color: Colors.black54 ),),

                               ],
                             )
                           ],
                         ),
                       ),
                       SizedBox(height: height,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           GestureDetector(onTap: (){
                             Navigator.of(context).pushReplacement(
                                 MaterialPageRoute(
                                     builder:
                                         (BuildContext context) => FirstProfileScreen()));

                           },child: CircleAvatar(child: Icon(Icons.arrow_forward, size: 40,color: Colors.white,),backgroundColor: Color(0xff41B4C7), radius: 40,))
                         ],
                       )
                     ],

                   ),
                 ),

              ),
            )

      ),
    );
  }
}
