import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class EventCard extends StatefulWidget {
  String name;
  String note;
  String date;
  EventCard({this.note,this.name,this.date});
  @override
  _EventCardState createState() => _EventCardState(note: note,name: name,date: date);
}

class _EventCardState extends State<EventCard> {
  String name;
  String note;
  String date;
  _EventCardState({this.note,this.name,this.date});
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
              child: Text(date, style: GoogleFonts.heebo(fontSize: 22, color: Colors.red),),
            ),
          ],
        ),
      ),
    );
  }
}
