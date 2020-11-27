import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class NotificationCard extends StatelessWidget {
  String data;
  NotificationCard({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Column(children: [
        Row(
          children: [
          CircleAvatar(child: Icon(Icons.notifications_none, color: Colors.lightBlue[50],size: 35,),backgroundColor: Colors.pink[200],radius: 25,),
            SizedBox(width: 20,),
            Text(data, style: GoogleFonts.heebo(color:Color(0xff5fc9ed),fontSize: 18),),

          ],
          
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          Image.asset('assets/oui.png'),
          Image.asset('assets/non.png')
        ],),
        Container(height: 2,width: 300,color: Color(0xff5fc9ed),),
      ],),
    );
  }
}
