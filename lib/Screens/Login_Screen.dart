import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Loading/loading.dart';
import 'package:sample_screen/Screens/Welcome.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText1=true;
  String Email;
  String Pass;
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/login_back.png"), fit: BoxFit.cover)),
    child: SafeArea(
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:25.0, right: 25.0, ),
          child: Column(
            children: [

              SizedBox(height: 40,),
              Row(mainAxisAlignment:MainAxisAlignment.center,
                children: [
                Text('Se connector', style: GoogleFonts.heebo(color: Color(0xff41B4C7), fontSize: 30, fontWeight: FontWeight.bold),)
              ],),
              SizedBox(height: 30,),
Row(children: [
  Text('Courriel',style: GoogleFonts.heebo(color: Color(0xff41B4C7), fontSize: 18, fontWeight: FontWeight.bold))
],),
              Container(
                height: 60,
                child: TextFormField(
                  validator: (val) =>
                  val.length < 6 ? 'email incorrect' : null,
                  obscureText: false,
                  onChanged: (val) {
                    setState(() {
                      Email = val;
                    });
                  },
                  style: TextStyle(
                    color: Color(0xff41B4C7),
                    fontSize: 25,
                  ),
                  decoration: InputDecoration(

                    fillColor: Color(0xffF5FBFC),
                    filled: true,
                    enabledBorder:
                    input_text_decoration_variable_for_focus,
                    focusedBorder:
                    input_text_decoration_variable_for_focus,
                    labelStyle: TextStyle(
                        fontSize: 25, color: Color(0xff41B4C7)),
                  )),
              ),
              SizedBox(height: 20,),
              Row(children: [
                Text('Mot de passe',style: GoogleFonts.heebo(color: Color(0xff41B4C7), fontSize: 18, fontWeight: FontWeight.bold))
              ],),
              Container(
                height: 60,
                child: TextFormField(
                    validator: (val) =>
                    val.length < 6 ? 'Password Length' : null,
                    obscureText: obscureText1,
                    onChanged: (val) {
                      setState(() {
                        Pass = val;
                      });
                    },
                    style: TextStyle(
                      color: Color(0xff41B4C7),
                      fontSize: 25,
                    ),
                    decoration: InputDecoration(

                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText1 = !obscureText1;
                          });
                        },
                        child: Icon(obscureText1 == true
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      fillColor: Color(0xffF5FBFC),
                      filled: true,
                      enabledBorder:
                      input_text_decoration_variable_for_focus,
                      focusedBorder:
                      input_text_decoration_variable_for_focus,

                      labelStyle: TextStyle(
                          fontSize: 25, color: Color(0xff41B4C7)),
                    )),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color:Color(0xff41B4C7),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0), bottomLeft: Radius.circular(15.0) )
                ),
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                    child: Text(
                      'Se connector',
                      style: TextStyle(
                          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: (){

                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder:
                                  (BuildContext context) => LoadingScreen()));

                    }),
              ),
SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height/3.5,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  Container(child: Image(image: AssetImage('assets/happy4.png'),)),
                  Positioned(left: 200, top:100,child: Container(child: Image(image: AssetImage('assets/happy3.png'),))),


                ],),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder:
                                (BuildContext context) => Welcome()));

                  },child: CircleAvatar(child: Icon(Icons.arrow_back, size: 40,color: Colors.white,),backgroundColor: Color(0xff41B4C7), radius: 40,))
                ],
              )
            ],
          ),
        ),
      ),
    )));
  }
}
