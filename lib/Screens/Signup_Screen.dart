import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Screens/Start_Screen.dart';
import 'package:sample_screen/Screens/Welcome.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();

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
        backgroundColor: Colors.lightBlue[50],
        elevation: 0,
        title: SafeArea(
            child: Text(
              'Create an account',
              style: TextStyle(color: Color(0xff5fc9ed), fontSize: 25),
            )),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlue[50],
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
                            TextFormField(
                                validator: (val) =>
                                val.isEmpty ? 'Enter Email' : null,
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
                            SizedBox(
                              height: 20,
                            ),
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
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
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
                                  color:Color(0xff5fc9ed),
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
                                  labelText: 'Confirm Password',
                                  fillColor: Colors.lightBlue[50],
                                  filled: true,
                                  enabledBorder:
                                  input_text_decoration_variable_for_focus,
                                  focusedBorder:
                                  input_text_decoration_variable_for_focus,
                                  labelStyle: TextStyle(
                                      fontSize: 25, color:Color(0xff5fc9ed)),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                validator: (val) =>
                                val.length <3 ? 'First Name Length' : null,
                                obscureText: false,
                                onChanged: (val) {
                                  setState(() {
                                    F_Name = val;
                                  });
                                },
                                style: TextStyle(
                                  color: Color(0xff5fc9ed),
                                  fontSize: 25,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'First Name',
                                  fillColor: Colors.lightBlue[50],
                                  filled: true,
                                  enabledBorder:
                                  input_text_decoration_variable_for_focus,
                                  focusedBorder:
                                  input_text_decoration_variable_for_focus,
                                  labelStyle: TextStyle(
                                      fontSize: 25, color: Color(0xff5fc9ed)),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                validator: (val) =>
                                val.length < 3 ? 'Last Name Length' : null,
                                obscureText: false,
                                onChanged: (val) {
                                  setState(() {
                                    L_Name = val;
                                  });
                                },
                                style: TextStyle(
                                  color: Color(0xff5fc9ed),
                                  fontSize: 25,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  fillColor: Colors.lightBlue[50],
                                  filled: true,
                                  enabledBorder:
                                  input_text_decoration_variable_for_focus,
                                  focusedBorder:
                                  input_text_decoration_variable_for_focus,
                                  labelStyle: TextStyle(
                                      fontSize: 25, color: Color(0xff5fc9ed)),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: FlatButton(
                                  color: Color(0xff5fc9ed),
                                  child: Text(
                                    'Create',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  onPressed: (){

                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder:
                                                (BuildContext context) => StartScreen()));
                                    if (_key.currentState.validate()) {
                                      setState(() async {
                                        if(Pass==Con_Pass){

                                        }

                                        else if(Pass != Con_Pass){
                                          float_toast("Passwords Don't Match");
                                        }
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
                                },child: CircleAvatar(child: Icon(Icons.arrow_back, size: 40, color: Colors.white,),backgroundColor:Color(0xff5fc9ed), radius: 40,))
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
