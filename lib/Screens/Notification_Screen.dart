import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/widgets/NotificationCard.dart';
import 'package:intl/intl.dart';

import 'Home.dart';
class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String formattedTime = DateFormat.jm().format(now);
    print(formattedTime);
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/all_app.png"), fit: BoxFit.cover)),
    child: SafeArea(
    child: Scaffold(
    backgroundColor: Colors.transparent,
    body: SingleChildScrollView(
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(onTap:(){
                    index_nav=0;
                    color_changer_home=true;
                    color_changer_per=false;
                    color_changer_cal=false;
                    color_changer_stat=false;

                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder:
                                (BuildContext context) =>Home()));
                  },child: Icon(Icons.arrow_back, color: Color(0xffF5FBFC),size: 55,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:120.0),
                  child: Text('Notifications', style: GoogleFonts.heebo(fontSize: 30, color: Colors.white),),
                ),
              ]),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height-250,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(

                physics: BouncingScrollPhysics(),
                itemCount: notification_list.length,
                // itemCount: _categories.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    child: Column(children: [
                      Row(
                        children: [
                          CircleAvatar(child: Icon(Icons.notifications_none, color: Color(0xffF5FBFC),size: 35,),backgroundColor: Colors.pink[200],radius: 25,),
                          SizedBox(width: 20,),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(notification_list[index], style: GoogleFonts.heebo(color:Colors.white,fontSize: 18),

                              ),
                            ),
                          ),


                        ],

                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                        InkWell(onTap: (){
                          setState(() {
                            notification_list.removeAt(index);
                          });
                        },child: Image.asset('assets/oui.png')),
                        InkWell(onTap: (){
                          setState(() {
                            notification_list.removeAt(index);
                          });
                        },child: Image.asset('assets/non.png'))
                      ],),
                      Container(height: 2,width: 300,color: Colors.white,),
                    ],),
                  );
                },
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            Image.asset('assets/noti_page_btn.png')
          ],)
        ],
      ),


    ))));
  }
}
