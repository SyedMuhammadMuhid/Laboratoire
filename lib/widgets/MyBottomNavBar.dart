import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    bool color_changer=false;
    return Container(
      height: 80,
      color: Colors.lightBlue[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 5),
          GestureDetector(onTap:(){
            setState(() {
              color_changer=true;
            });
          },child: Icon(Icons.home, color: color_changer==false?Colors.black45:Colors.yellow, size: 50,)),
          Container(height: 60, child: VerticalDivider(color: Colors.black45)),
          Icon(Icons.calendar_today, color:Colors.black45,size: 40,),
          Container(height: 60, child: VerticalDivider(color: Colors.black45)),
          Icon(Icons.sort, color:Colors.black45,size: 50,),
          Container(height: 60, child: VerticalDivider(color: Colors.black45)),
          Icon(Icons.shutter_speed, color:Colors.black45,size: 47,),
          SizedBox(width: 5,)


        ],
      )
    );
  }
}
