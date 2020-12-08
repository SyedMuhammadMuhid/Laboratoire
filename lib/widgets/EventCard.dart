import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Screens/Home.dart';
import 'package:sample_screen/Services/database.dart';
class EventCard extends StatefulWidget {
  String name;
  String note;
  Timestamp date;
  String doc_id;
  EventCard({this.note,this.name,this.date,this.doc_id});
  @override
  _EventCardState createState() => _EventCardState(note: note,name: name,date: date,doc_id: doc_id);
}

class _EventCardState extends State<EventCard> {
  String name;
  String note;
  Timestamp date;
  String doc_id;


  _EventCardState({this.note,this.name,this.date,this.doc_id});
  List months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF5FBFC),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0), bottomRight: Radius.circular(5.0), bottomLeft: Radius.circular(5.0) ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(width: 13, height: 75,color: Color(0xff41B4C7),),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Text(name, style: GoogleFonts.heebo(fontSize: 22, color: Colors.black54),),
                    ),


                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(note, style: GoogleFonts.heebo(fontSize: 15, color: Colors.black45),),
                    ),
                  ],
                ),
                SizedBox(height: 10,),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15),
              child: Text(date.toDate().day.toString()+ " "+months[date.toDate().month-1], style: GoogleFonts.heebo(fontSize: 22, color: Colors.red),),
            ),

            InkWell(
              onTap: ()async{
                await DatabaseService(uid: uid_constant).UpdateDeleteEvent(doc_id);
                index_nav=1;

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.delete, color: Colors.red,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
