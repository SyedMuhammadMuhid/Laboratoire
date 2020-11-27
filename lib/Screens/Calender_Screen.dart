import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/Screens/Profile.dart';
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
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder:
                                (BuildContext context) =>ProfileScreen()));
                  },child: Icon(Icons.menu, color: Colors.lightBlue[50],size: 55,)),
                ),
                Text('Calendar', style: GoogleFonts.heebo(fontSize: 30, color: Color(0xff5fc9ed)),),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder:
                                (BuildContext context) => NotificationScreen()));
                  },child: CircleAvatar(child: Icon(Icons.notifications_none, color: Colors.lightBlue[50],size: 35,),backgroundColor: Colors.pink[200],radius: 25,)),
                )
              ]),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
            Text(formatted,style: GoogleFonts.heebo(color: Color(0xff5fc9ed), fontSize: 40, fontWeight: FontWeight.bold),)
          ],),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 380,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
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
                              padding: const EdgeInsets.only(left: 15, right: 15,bottom: 3),
                              child: TextFormField(
                                  obscureText: false,
                                  onChanged: (val) {
                                  },
                                  style: TextStyle(
                                    color: Color(0xff5fc9ed),
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Name of Event',
                                    fillColor: Colors.lightBlue[50],
                                    filled: true,
                                    enabledBorder:
                                    input_text_decoration_variable_for_focus,
                                    focusedBorder:
                                    input_text_decoration_variable_for_focus,
                                    labelStyle: TextStyle(
                                        fontSize: 25, color: Color(0xff5fc9ed)),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                  obscureText: false,
                                  onChanged: (val) {
                                  },
                                  style: TextStyle(
                                    color: Color(0xff5fc9ed),
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Place',
                                    fillColor: Colors.lightBlue[50],
                                    filled: true,
                                    enabledBorder:
                                    input_text_decoration_variable_for_focus,
                                    focusedBorder:
                                    input_text_decoration_variable_for_focus,
                                    labelStyle: TextStyle(
                                        fontSize: 25, color: Color(0xff5fc9ed)),
                                  )),
                            ),
                            Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                child: Text('All Day Event', style: TextStyle(fontSize: 25, color: Color(0xff5fc9ed) ),),
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
                                  activeColor: Color(0xff5fc9ed),
                                ),
                              )
                            ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                child: Text('Start Date:'+'  ${_dateTime_start.day}-${_dateTime_start.month}-${_dateTime_start.year}', style: TextStyle(fontSize: 25, color: Color(0xff5fc9ed) ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:15, top:5, bottom:5),
                                child: GestureDetector(onTap:(){
                                  setState(() async{
                               _dateTime_start=await showDatePicker(context: context, initialDate: _dateTime_start, firstDate: DateTime(DateTime.now().year-1), lastDate: DateTime(DateTime.now().year+1));

                                        });
                                },child: Icon(Icons.expand_more, color: Colors.black54,size: 30,)),
                              )
                            ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                child: Text('End Date:'+'    ${_dateTime_end.day}-${_dateTime_end.month}-${_dateTime_end.year}', style: TextStyle(fontSize: 25, color: Color(0xff5fc9ed) ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:15, top:5, bottom:5),
                                child: GestureDetector(onTap:(){
                                  setState(() async{
                                    _dateTime_end=await showDatePicker(context: context, initialDate: _dateTime_end, firstDate: DateTime(DateTime.now().year-1), lastDate: DateTime(DateTime.now().year+1));

                                  });
                                },child: Icon(Icons.expand_more, color: Colors.black54,size: 30,)),
                              )
                            ],),
                            SizedBox(height: 7,),
                            Row(mainAxisAlignment: MainAxisAlignment.center
                              ,children: [
                              CircleAvatar(radius:40,backgroundColor: Color(0xff5fc9ed),child: Icon(Icons.check, color: Colors.white,size: 50,),)
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
              });

            },child: CircleAvatar(radius:40,backgroundColor: Color(0xff5fc9ed),child: Icon(clicked_check==false?Icons.add:Icons.clear, color: Colors.white,size: 50,),))),

          ],),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('Events',style: GoogleFonts.heebo(fontSize: 30, color: Color(0xff5fc9ed)),)
          ],),
          Container(
            height: 500,
            child: ListView.builder(

              physics: BouncingScrollPhysics(),
              itemCount: Events_data.length,
              // itemCount: _categories.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index){
                return  EventCard(name: Events_data[index].name,note: Events_data[index].note,date: Events_data[index].date,);
              },
            ),
          ),
        ],),
      ),
    )

    ));
  }
}
