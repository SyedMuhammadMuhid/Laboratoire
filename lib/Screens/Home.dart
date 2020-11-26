import 'package:flutter/material.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Screens/Calender_Screen.dart';
import 'package:sample_screen/Screens/Perfor_Screen.dart';
import 'package:sample_screen/Screens/Stat_Screen.dart';
import 'package:sample_screen/widgets/HomeScreen.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool color_changer_home=true;
  bool color_changer_cal=false;
  bool color_changer_stat=false;
  bool color_changer_per=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: index_nav==0?HomeScreen():index_nav==1?CalenderScreen():index_nav==2?StatScreen():index_nav==3?PerforScreen():HomeScreen(),

      bottomNavigationBar: Container(
          height: 80,
          color: Colors.lightBlue[50],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 5),
              GestureDetector(onTap:(){
                setState(() {
                  color_changer_home=true;
                  color_changer_per=false;
                  color_changer_cal=false;
                  color_changer_stat=false;
                  index_nav=0;
                });
              },child: Icon(Icons.home, color: color_changer_home==false?Colors.black45:Colors.yellow, size: 50,)),
              Container(height: 60, child: VerticalDivider(color: Colors.black45)),
              GestureDetector(onTap:(){
                setState(() {
                  color_changer_cal=true;
                  color_changer_home=false;
                  color_changer_stat=false;
                  color_changer_per=false;
                  index_nav=1;
                });
              },child: Icon(Icons.calendar_today, color:color_changer_cal==false?Colors.black45:Colors.yellow,size: 40,)),
              Container(height: 60, child: VerticalDivider(color: Colors.black45)),
              GestureDetector(onTap:(){
                setState(() {
                  color_changer_cal=false;
                  color_changer_home=false;
                  color_changer_stat=true;
                  color_changer_per=false;
                  index_nav=2;
                });
              },child: Icon(Icons.sort, color:color_changer_stat==false?Colors.black45:Colors.yellow,size: 50,)),
              Container(height: 60, child: VerticalDivider(color: Colors.black45)),
              GestureDetector(onTap:(){
                setState(() {
                  color_changer_cal=false;
                  color_changer_home=false;
                  color_changer_stat=false;
                  color_changer_per=true;
                  index_nav=3;
                });
              },child: Icon(Icons.shutter_speed, color:color_changer_per==false?Colors.black45:Colors.yellow,size: 47,)),
              SizedBox(width: 5,)


            ],
          )
      ),
    );
  }
}
