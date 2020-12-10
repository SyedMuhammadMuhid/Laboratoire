import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Loading/loading.dart';
import 'package:sample_screen/Screens/Start_Screen.dart';
import 'package:sample_screen/Screens/Welcome.dart';
import 'package:sample_screen/Services/Auth_Services.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();
final AuthServices _authServices=AuthServices();
  String Email;
  String Pass;
  String Con_Pass;
  String F_Name;
  String L_Name;
  bool obscureText1 = true;
  bool obscureText2 = true;
  //-----------------
  FToast fToast;

  //-----------------------
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {

    //---------------------------------toast function
    void float_toast(String message) async {

      Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.redAccent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      );

      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
        /* positionedToastBuilder: (context, child) {
            return Positioned(
              child: child,
              top: MediaQuery.of(context).size.height-10,

            );
          }*/);
    }

    //________________________________


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5FBFC),
        elevation: 0,
        title: SafeArea(
            child: Text(
              'Create an account',
              style: TextStyle(color: Color(0xff41B4C7), fontSize: 25),
            )),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffF5FBFC),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Scrollbar(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: _key,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Row(children: [
                              Text('Email',style: GoogleFonts.heebo(color: Color(0xff41B4C7), fontSize: 18, fontWeight: FontWeight.bold))
                            ],),
                            Container(
                              height: 60,
                              child: TextFormField(
                                  validator: (val) =>
                                  val.isEmpty ? 'Enter Email' : null,
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
                            SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              Text('Password',style: GoogleFonts.heebo(color: Color(0xff41B4C7), fontSize: 18, fontWeight: FontWeight.bold))
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
                            SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              Text('Confirm Password',style: GoogleFonts.heebo(color: Color(0xff41B4C7), fontSize: 18, fontWeight: FontWeight.bold))
                            ],),
                            Container(
                              height: 60,
                              child: TextFormField(
                                  validator: (val) =>
                                  val.length < 6 && Pass == Con_Pass
                                      ? 'Password Dont Match'
                                      : null,
                                  obscureText: obscureText2,
                                  onChanged: (val) {
                                    setState(() {
                                      Con_Pass = val;
                                    });
                                  },
                                  style: TextStyle(
                                    color:Color(0xff41B4C7),
                                    fontSize: 25,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          obscureText2 = !obscureText2;
                                        });
                                      },
                                      child: Icon(obscureText2 == true
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
                                        fontSize: 25, color:Color(0xff41B4C7)),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              Text('First Name',style: GoogleFonts.heebo(color: Color(0xff41B4C7), fontSize: 18, fontWeight: FontWeight.bold))
                            ],),
                            Container(
                              height: 60,
                              child: TextFormField(
                                  validator: (val) =>
                                  val.length <3 ? 'First Name Length' : null,
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(() {
                                      F_Name = val;
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
                            SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              Text('Last Name',style: GoogleFonts.heebo(color: Color(0xff41B4C7), fontSize: 18, fontWeight: FontWeight.bold))
                            ],),
                            Container(
                              height: 60,
                              child: TextFormField(
                                  validator: (val) =>
                                  val.length < 3 ? 'Last Name Length' : null,
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(() {
                                      L_Name = val;
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
                            SizedBox(
                              height: 20,
                            ),
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
                                    'Create',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  onPressed: ()async{


                                    if (_key.currentState.validate()) {

                                        if(Pass==Con_Pass){

                                      dynamic result=  await _authServices.SignUpWithEmailPass(Email, Pass, F_Name, L_Name);
                                    //  print(result+ 'this is the result after signup as emial and pass');
                                      if(result==null){
                                        print('error signing up');

                                      }
                                      else if(result==0){
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) => LoadingScreen()));
                                      }
                                      else {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) => StartScreen()));
                                      }
                                        }

                                        else if(Pass != Con_Pass){
                                          float_toast("Passwords Don't Match");
                                        }
                                     setState(() {

                                     });
                                    }
                                  }),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height/30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(onTap: (){
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder:
                                              (BuildContext context) => Welcome()));
                                },child: CircleAvatar(child: Icon(Icons.arrow_back, size: 40, color: Colors.white,),backgroundColor:Color(0xff41B4C7), radius: 40,))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
