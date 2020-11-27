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
          color: Colors.lightBlue[50],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0) ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),      child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Text(name, style: GoogleFonts.heebo(fontSize: 25, color: Colors.black54),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15.0, right: 15),
                  child: Text(date, style: GoogleFonts.heebo(fontSize: 25, color: Colors.red),),
                ),

              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(note, style: GoogleFonts.heebo(fontSize: 18, color: Colors.black45),),
                ),
              ],
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
