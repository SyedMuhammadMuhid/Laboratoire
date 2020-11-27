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
        image: AssetImage("assets/back_img.PNG"), fit: BoxFit.cover)),
    child: SafeArea(
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:25.0, right: 25.0, ),
          child: Column(
            children: [

              SizedBox(height: 20,),
              Row(mainAxisAlignment:MainAxisAlignment.center,
                children: [
                Text('Login', style: GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25),)
              ],),
              SizedBox(height: 30,),

              TextFormField(
                validator: (val) =>
                val.length < 6 ? 'email incorrect' : null,
                obscureText: false,
                onChanged: (val) {
                  setState(() {
                    Email = val;
                  });
                },
                style: TextStyle(
                  color: Color(0xff5fc9ed),
                  fontSize: 25,
                ),
                decoration: InputDecoration(

                  labelText: 'Email',
                  fillColor: Colors.lightBlue[50],
                  filled: true,
                  enabledBorder:
                  input_text_decoration_variable_for_focus,
                  focusedBorder:
                  input_text_decoration_variable_for_focus,
                  labelStyle: TextStyle(
                      fontSize: 25, color: Color(0xff5fc9ed)),
                )),
              SizedBox(height: 20,),
              TextFormField(
                  validator: (val) =>
                  val.length < 6 ? 'Password Length' : null,
                  obscureText: obscureText1,
                  onChanged: (val) {
                    setState(() {
                      Pass = val;
                    });
                  },
                  style: TextStyle(
                    color: Color(0xff5fc9ed),
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
                    labelText: 'Password',
                    fillColor: Colors.lightBlue[50],
                    filled: true,
                    enabledBorder:
                    input_text_decoration_variable_for_focus,
                    focusedBorder:
                    input_text_decoration_variable_for_focus,
                    labelStyle: TextStyle(
                        fontSize: 25, color: Color(0xff5fc9ed)),
                  )),
              SizedBox(height: 20,),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                    color: Color(0xff5fc9ed),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                    ),
                    onPressed: (){

                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder:
                                  (BuildContext context) => LoadingScreen()));

                    }),
              ),

              Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  Container(child: Image(image: AssetImage('assets/faces.png'),)),
                  Positioned(
                    top: MediaQuery.of(context).size.height/2-100,
                    left: MediaQuery.of(context).size.width/2- 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(onTap: (){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder:
                                      (BuildContext context) => Welcome()));

                        },child: CircleAvatar(child: Icon(Icons.arrow_back, size: 40,),backgroundColor: Colors.blue, radius: 40,))
                      ],
                    ),
                  )

                ],),
              )
            ],
          ),
        ),
      ),
    )));
  }
}
