import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Screens/Login_Screen.dart';
import 'package:sample_screen/Screens/Signup_Screen.dart';
import 'package:sample_screen/Screens/Subscribe.dart';
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height/30;
    double width= MediaQuery.of(context).size.width/10;
    return  Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/welcome_bg.png"), fit: BoxFit.cover)),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Column(children: [
                      Text('Welcome', style: GoogleFonts.heebo(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.lightBlue[50]),),
                    Text('Do you have an account?',style: GoogleFonts.heebo(fontSize: 20,  color: Colors.lightBlue[50])),
                    Text('Sign up or log in!',style: GoogleFonts.heebo(fontSize: 20,  color: Colors.lightBlue[50]))
                    ],)],),
                SizedBox(height: 25,),
                  Image(image: AssetImage('assets/faces.png'),height: height*14,width: width*9,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Column(children: [
                      SizedBox(height: height,),
                      GestureDetector(onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder:
                                    (BuildContext context) => Subscribe()));
                      },child: Image(image: AssetImage('assets/signup_btn.png'),)),
                      GestureDetector(onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder:
                                    (BuildContext context) => LoginScreen()));
                      },child: Image(image: AssetImage('assets/login_btn.png'),))

                    ],)
                  ],)

                ],
              ),
            ),


          ),
        ),
      );

  }
}
