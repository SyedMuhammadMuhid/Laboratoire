import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Loading/loading.dart';
import 'package:sample_screen/Screens/Start_Screen.dart';
import 'package:sample_screen/Screens/Welcome.dart';
import 'package:sample_screen/Services/Auth_Services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sample_screen/Wrapper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText1 = true;
  final _key = GlobalKey<FormState>();
  String Email;
  String Pass;
  bool _asynccaller = false;
  final AuthServices _authServices = AuthServices();
  FToast fToast;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    //--------------------------------------

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
          }*/
      );
    }

    //--------------------------

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/login_back.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ModalProgressHUD(
            inAsyncCall: _asynccaller,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Se connecter',
                          style: GoogleFonts.dMSerifText(
                              color: Color(0xff41B4C7),
                              fontSize: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text('Courriel',
                            style: GoogleFonts.dMSerifText(
                                color: Color(0xff41B4C7),
                                fontSize: 18,
                              ))
                      ],
                    ),
                    Form(
                        key: _key,
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              child: TextFormField(
                                  validator: (val) =>
                                      val.length < 6 ? 'Adresse Email incorrecte' : null,
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
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text('Mot de passe',
                                    style: GoogleFonts.dMSerifText(
                                        color: Color(0xff41B4C7),
                                        fontSize: 18,
                                       ))
                              ],
                            ),
                            Container(
                              height: 60,
                              child: TextFormField(
                                  validator: (val) =>
                                      val.length < 6 ? 'Longueur du mot de passe' : null,
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
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff41B4C7),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0))),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                          child: Text(
                            'Se connecter',
                             style: GoogleFonts.dMSerifText(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          ),
                          onPressed: () async {
                            if (_key.currentState.validate()) {
                              setState(() {
                                _asynccaller = true;
                              });

                              final result =
                                  await _authServices.SignInWithEmailPass(
                                      Email.trim(), Pass);

                              setState(() {
                                _asynccaller = false;
                              });

                              if (result == null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            StartScreen()));
                              }
                              else if (result==1) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoadingScreen()));
                              } else if (result == 0) {
                                float_toast(
                                    Toast_wrong_data);
                              }
                            }
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Container(
                              child: Image(
                            image: AssetImage('assets/happy4.png'),
                          )),
                          Positioned(
                              left: 200,
                              top: 100,
                              child: Container(
                                  child: Image(
                                image: AssetImage('assets/happy3.png'),
                              ))),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Welcome()));
                            },
                            child: CircleAvatar(
                              child: Icon(
                                Icons.arrow_back,
                                size: 40,
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xff41B4C7),
                              radius: 40,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
