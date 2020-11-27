import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Loading/loading.dart';
import 'package:sample_screen/Screens/Home.dart';
import 'package:sample_screen/Screens/Start_Screen.dart';
import 'package:sample_screen/widgets/ProfileCard.dart';

import 'Login_Screen.dart';

class FirstProfileScreen extends StatefulWidget {
  @override
  _FirstProfileScreenState createState() => _FirstProfileScreenState();
}

class _FirstProfileScreenState extends State<FirstProfileScreen> {
  final _key = GlobalKey<FormState>();

  String F_L_Name;
  String Age;
  String Sex;
  String Device="Choose a Device";
  bool _isExpanded=false;
  bool _isExpanded2=false;
  bool _isExpanded3=false;

  String Allergies;
  String Doctor_address;
  String Dentist_address;
  String blood_type="Blood Type";
  String Frequency="Choose Frequency";
  String Total_duration;
  String Instructions;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_image_app.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(onTap:(){
                            index_nav=0;
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder:
                                        (BuildContext context) =>StartScreen()));
                          },child: Icon(Icons.arrow_back, color: Colors.lightBlue[50],size: 55,)),
                        ),

                      ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Container(

                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0) ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        width: 370,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Form(
                            key: _key,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.check_circle_outline, size: 50,color:Color(0xff5fc9ed) ,),
                                    )
                                  ],),
                                Stack(children: [CircleAvatar(radius: 50, backgroundColor: Colors.white,child: Image(image: AssetImage('assets/propic.png'),),),CircleAvatar(child: Icon(Icons.edit, color: Colors.white,),backgroundColor: Colors.pink[200],),]),
                                Text('Mon Profil', style: GoogleFonts.heebo(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),),
                                Image.asset('assets/first_pro_btn.png'),
                                TextFormField(
                                    validator: (val) =>
                                    val.length < 1 ? 'Please Fill this Field' : null,
                                    obscureText: false,
                                    onChanged: (val) {
                                      setState(() {
                                        F_L_Name = val;
                                      });
                                    },
                                    style: TextStyle(
                                      color: Color(0xff5fc9ed),
                                      fontSize: 25,
                                    ),
                                    decoration: InputDecoration(

                                      labelText: 'First and Last Name',
                                      fillColor: Colors.white,
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
                                    val.length < 2 ? 'Please Fill This Field' : null,
                                    obscureText: false,
                                    onChanged: (val) {
                                      setState(() {
                                        Age = val;
                                      });
                                    },
                                    style: TextStyle(
                                      color: Color(0xff5fc9ed),
                                      fontSize: 25,
                                    ),
                                    decoration: InputDecoration(

                                      labelText: 'Age',
                                      fillColor: Colors.white,
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
                                    val.length < 2? 'Please Fill the Field' : null,
                                    obscureText: false,
                                    onChanged: (val) {
                                      setState(() {
                                        Sex= val;
                                      });
                                    },
                                    style: TextStyle(
                                      color: Color(0xff5fc9ed),
                                      fontSize: 25,
                                    ),
                                    decoration: InputDecoration(

                                      labelText: 'Sex',
                                      fillColor: Colors.white,
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
                                  height: _isExpanded==false?60:332,
                                  width: 371,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff5fc9ed)),

                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                            Container(
                                              child: Text(Device, style: GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25),),
                                            ),
                                            GestureDetector(onTap: (){
                                              setState(() {
                                                _isExpanded=!_isExpanded;
                                              });
                                            },child: Icon(_isExpanded==false?Icons.expand_more:Icons.expand_less, color: Colors.black54,))
                                          ],),
                                        ),
                                       Container(
                                         height: _isExpanded==false?0:332,
                                         child: Column(children: [
                                         Container(height: 2, width: 400,color: Color(0xff5fc9ed),),
                                         Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Row(children: [Text('Sagittal', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25),)],),
                                         ),
                                         Container(height: 2, width: 400,color: Color(0xff5fc9ed),),
                                         Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Row(children: [Text('Schwartz', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25),)],),
                                         ),
                                         Container(height: 2, width: 400,color: Color(0xff5fc9ed),),

                                         Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Row(children: [Text('Split Plate', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                         ),
                                         Container(height: 2, width: 400,color: Color(0xff5fc9ed),),

                                         Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Row(children: [Text('Bionator', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                         ),
                                         Container(height: 2, width: 400,color: Color(0xff5fc9ed),),

                                         Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Row(children: [Text('Twin Block', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                         ),
                                         Container(height: 2, width: 400,color: Color(0xff5fc9ed),),

                                       ],),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),

                                TextFormField(
                                    validator: (val) =>
                                    val.length < 2 ? 'Please Fill This Field' : null,
                                    obscureText: false,
                                    onChanged: (val) {
                                      setState(() {
                                        Dentist_address = val;
                                      });
                                    },
                                    style: TextStyle(
                                      color: Color(0xff5fc9ed),
                                      fontSize: 25,
                                    ),
                                    decoration: InputDecoration(

                                      labelText: "Dentist's Address",
                                      fillColor: Colors.white,
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
                                    val.length < 2 ? 'Please Fill This Field' : null,
                                    obscureText: false,
                                    onChanged: (val) {
                                      setState(() {
                                        Doctor_address= val;
                                      });
                                    },
                                    style: TextStyle(
                                      color: Color(0xff5fc9ed),
                                      fontSize: 25,
                                    ),
                                    decoration: InputDecoration(

                                      labelText: "Doctor's Address",
                                      fillColor: Colors.white,
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
                                    val.length < 2 ? 'Please Fill This Field' : null,
                                    obscureText: false,
                                    onChanged: (val) {
                                      setState(() {
                                        Allergies = val;
                                      });
                                    },
                                    style: TextStyle(
                                      color: Color(0xff5fc9ed),
                                      fontSize: 25,
                                    ),
                                    decoration: InputDecoration(

                                      labelText: 'Allergies',
                                      fillColor: Colors.white,
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
                                  height: _isExpanded2==false?60:550,
                                  width: 371,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff5fc9ed)),

                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(blood_type, style: GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25),),
                                              ),
                                              GestureDetector(onTap: (){
                                                setState(() {
                                                  _isExpanded2=!_isExpanded2;
                                                });
                                              },child: Icon(_isExpanded2==false?Icons.expand_more:Icons.expand_less, color: Colors.black54,))
                                            ],),
                                        ),
                                        Container(
                                          height: _isExpanded2==false?0:550,
                                          child: Column(children: [
                                          Container(height: 2, width: 400,color: Color(0xff5fc9ed),),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: [Text('O-', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25),)],),
                                          ),
                                          Container(height: 2, width: 400,color: Color(0xff5fc9ed),),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: [Text('O+', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25),)],),
                                          ),
                                          Container(height: 2, width: 400,color: Color(0xff5fc9ed),),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: [Text('A-', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                          ),
                                          Container(height: 2, width: 400,color: Color(0xff5fc9ed),),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: [Text('A+', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                          ),
                                          Container(height: 2, width: 400,color: Color(0xff5fc9ed),),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: [Text('B-', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                          ),
                                          Container(height: 2, width: 400,color: Color(0xff5fc9ed),),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: [Text('B+', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                          ),
                                          Container(height: 2, width: 400,color: Color(0xff5fc9ed),),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: [Text('AB-', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                          ),
                                          Container(height: 2, width: 400,color: Color(0xff5fc9ed),),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: [Text('AB+', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                          ),
                                          Container(height: 2, width: 400,color: Color(0xff5fc9ed),),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: [Text('UnKnown', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                          ),
                                          Container(height: 2, width: 400,color: Color(0xff5fc9ed),),
                                        ],),),


                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),

                                Container(
                                  height: _isExpanded3==false?60:277,
                                  width: 371,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff5fc9ed)),

                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(Frequency, style: GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25),),
                                              ),
                                              GestureDetector(onTap: (){
                                                setState(() {
                                                  _isExpanded3=!_isExpanded3;
                                                });
                                              },child: Icon(_isExpanded3==false?Icons.expand_more:Icons.expand_less, color: Colors.black54,))
                                            ],),
                                        ),
                                        Container(
                                          height: _isExpanded3==false?0:332,
                                          child: Column(children: [
                                            Container(height: 2, width: 400,color: Color(0xff5fc9ed),),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(children: [Text('1x /Day', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25),)],),
                                            ),
                                            Container(height: 2, width: 400,color: Color(0xff5fc9ed),),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(children: [Text('3x /Day', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25),)],),
                                            ),
                                            Container(height: 2, width: 400,color: Color(0xff5fc9ed),),

                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(children: [Text('1x /Week', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                            ),
                                            Container(height: 2, width: 400,color: Color(0xff5fc9ed),),

                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(children: [Text('2x /Week', style:GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 25))],),
                                            ),
                                            Container(height: 2, width: 400,color: Color(0xff5fc9ed),),


                                          ],),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),

                                TextFormField(
                                    validator: (val) =>
                                    val.length < 1 ? 'Please Fill This Field' : null,
                                    obscureText: false,
                                    onChanged: (val) {
                                      setState(() {
                                        Total_duration = val;
                                      });
                                    },
                                    style: TextStyle(
                                      color: Color(0xff5fc9ed),
                                      fontSize: 25,
                                    ),
                                    decoration: InputDecoration(

                                      labelText: 'Total Duration of Treatment',
                                      fillColor: Colors.white,
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
                                    val.length < 2 ? 'Please Fill This Field' : null,
                                    obscureText: false,
                                    onChanged: (val) {
                                      setState(() {
                                        Instructions = val;
                                      });
                                    },
                                    style: TextStyle(
                                      color: Color(0xff5fc9ed),
                                      fontSize: 25,
                                    ),
                                    decoration: InputDecoration(

                                      labelText: 'Instruction from Dentist',
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder:
                                      input_text_decoration_variable_for_focus,
                                      focusedBorder:
                                      input_text_decoration_variable_for_focus,
                                      labelStyle: TextStyle(
                                          fontSize: 25, color: Color(0xff5fc9ed)),
                                    )),
                                SizedBox(height: 30,),
                                GestureDetector(onTap: (){
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder:
                                              (BuildContext context) => LoadingScreen()));
                                if (_key.currentState.validate()) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder:
                                              (BuildContext context) => LoadingScreen()));}
                                },child: Image.asset('assets/first_pro_btn.png'))
                              ],
                            ),
                          ),
                        ),

                      ),
                    ),
                  ),

                ],),
              ),
            )

        ));
  }
}
