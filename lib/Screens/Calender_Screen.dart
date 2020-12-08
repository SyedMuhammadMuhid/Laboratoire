import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Popups/Motivation_popup.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/Screens/Profile.dart';
import 'package:sample_screen/Services/database.dart';
import 'package:sample_screen/widgets/EventCard.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalenderScreen extends StatefulWidget {
  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  static final DateTime now = DateTime. now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter. format(now);
  CalendarController _controller;
  bool switch_val=false;
  DateTime _dateTime_start;
  DateTime _dateTime_end;
  String Name_of_the_Event='';
  String Place='';


  bool clicked_check=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller= CalendarController();
    _dateTime_start=DateTime.now();
    _dateTime_end=DateTime.now();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {


    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/all_app.png"), fit: BoxFit.cover)),
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
                  },child: CircleAvatar(child: Badge(badgeContent:Text('2', style: TextStyle(color: Colors.white),),child: Icon(Icons.notifications_none, color:Colors.white,size: 35,)),backgroundColor: Color(0xffFF999A),radius: 25,)),
                )
              ]),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
            Text(formatted,style: GoogleFonts.heebo(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)
          ],),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xffF5FBFC),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Container(
                          height:clicked_check==false?370:0,
                          child: TableCalendar(calendarController: _controller,)),
                      Container(
                        height:clicked_check==false?0:370,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15,bottom: 10),
                              child: TextFormField(
                                  obscureText: false,
                                  onChanged: (val) {
                                          setState(() {
                                            Name_of_the_Event=val;
                                          });
                                  },
                                  style: TextStyle(
                                    color: Color(0xff41B4C7),
                                    fontSize: 20,
                                  ),
                                  initialValue: Name_of_the_Event,
                                  decoration: InputDecoration(
                                    labelText: 'Name of Event',
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
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(() {
                                      Place=val;
                                    });
                                  },
                                  style: TextStyle(
                                    color: Color(0xff41B4C7),
                                    fontSize: 20,
                                  ),
                                  initialValue: Place,
                                  decoration: InputDecoration(
                                    labelText: 'Place',

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
                            Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                child: Text('All Day Event', style: TextStyle(fontSize: 25, color: Color(0xff41B4C7) ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:15, top:5, bottom:5),
                                child: Switch(
                                  value: switch_val,
                                  onChanged: (val){
                                    setState(() {
                                      switch_val=!switch_val;
                                    });
                                  },
                                  activeColor: Color(0xff41B4C7),
                                ),
                              )
                            ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                child: Text('Start Date:'+'  ${_dateTime_start.day}-${_dateTime_start.month}-${_dateTime_start.year}', style: TextStyle(fontSize: 25, color: Color(0xff41B4C7) ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:15, top:5, bottom:5),
                                child: GestureDetector(onTap:()async{
                                  _dateTime_start=await showDatePicker(context: context, initialDate: _dateTime_start, firstDate: DateTime(DateTime.now().year-1), lastDate: DateTime(DateTime.now().year+1));
                                  if(_dateTime_start==null)
                                    _dateTime_start=DateTime.now();
                                  setState((){

                                        });
                                },child: Icon(Icons.expand_more, color: Colors.black54,size: 30,)),
                              )
                            ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                child: Text('End Date:'+'    ${_dateTime_end.day}-${_dateTime_end.month}-${_dateTime_end.year}', style: TextStyle(fontSize: 25, color: Color(0xff41B4C7) ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:15, top:5, bottom:5),
                                child: GestureDetector(onTap:()async{
                                  _dateTime_end=await showDatePicker(context: context, initialDate: _dateTime_end, firstDate: DateTime(DateTime.now().year-1), lastDate: DateTime(DateTime.now().year+1));
                                  if(_dateTime_end==null)
                                    _dateTime_end=DateTime.now();
                                  setState((){
                                  });
                                },child: Icon(Icons.expand_more, color: Colors.black54,size: 30,)),
                              )
                            ],),
                            SizedBox(height: 7,),
                            Row(mainAxisAlignment: MainAxisAlignment.center
                              ,children: [
                              InkWell(onTap: ()async{
                               await  DatabaseService(uid: uid_constant).UpdateEvents(Name_of_the_Event, Place, switch_val, _dateTime_start, _dateTime_end);
                               setState(() {
                                 Name_of_the_Event=' ';
                                 Place=' ';
                                 _dateTime_end=DateTime.now();
                                 _dateTime_start=DateTime.now();
                                 clicked_check=false;
                               });
                              },child: CircleAvatar(radius:40,backgroundColor: Color(0xff41B4C7),child: Icon(Icons.check, color: Colors.white,size: 50,),))
                            ],)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Positioned(left: 290,child: GestureDetector(onTap: (){
              setState(() {
                clicked_check=!clicked_check;
                Motivation_popup(context,-1, " ", Init);
                Init++;
              });

            },child: CircleAvatar(radius:40,backgroundColor: Color(0xff41B4C7),child: Icon(clicked_check==false?Icons.add:Icons.clear, color: Colors.white,size: 50,),))),

          ],),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('Events',style: GoogleFonts.heebo(fontSize: 30, color:Colors.white),)
          ],),
          Container(
            height: 500,
   child: StreamBuilder(
    stream: FirebaseFirestore.instance.collection('UserData').doc(uid_constant).collection('Events').snapshots(),
    builder: (context, snapshot) {
    if(!snapshot.hasData)return Container();

            return ListView.builder(

              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.docs.length,
              // itemCount: _categories.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index){
                return  EventCard(name: snapshot.data.docs[index]["EventName"],
                  note: snapshot.data.docs[index]["Place"],date:snapshot.data.docs[index]["StartDate"],
                doc_id:snapshot.data.docs[index].documentID);
              },
            );
    })
          ),
        ],),
      ),
    )

    ));
  }
}
