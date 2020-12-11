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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: index_nav==0?HomeScreen():index_nav==1?CalenderScreen():index_nav==2?StatScreen():index_nav==3?PerforScreen():HomeScreen(),

      bottomNavigationBar: Material(
        elevation: 30,
        child: Container(
            height: 80,
            color: Color(0xffF5FBFC),
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
                },child: ImageIcon(AssetImage('assets/home_icon.png'),color: color_changer_home==false?Colors.black45:Colors.yellow,size: 50,)/*Icon(Icons.home, color: color_changer_home==false?Colors.black45:Colors.yellow, size: 50,)*/),
                Container(height: 60, child: VerticalDivider(color: Colors.black45)),
                GestureDetector(onTap:(){
                  setState(() {
                    color_changer_cal=true;
                    color_changer_home=false;
                    color_changer_stat=false;
                    color_changer_per=false;
                    index_nav=1;
                  });
                },child:ImageIcon(AssetImage('assets/cal_logo.png'),color:color_changer_cal==false?Colors.black45:Colors.yellow,size: 50,) /*Icon(Icons.calendar_today, color:color_changer_cal==false?Colors.black45:Colors.yellow,size: 40,)*/),

                Container(height: 60, child: VerticalDivider(color: Colors.black45)),
                GestureDetector(onTap:(){
                  setState(() {
                    color_changer_cal=false;
                    color_changer_home=false;
                    color_changer_stat=true;
                    color_changer_per=false;
                    index_nav=2;
                  });
                },child: ImageIcon(AssetImage('assets/stat_logo.png'),color:color_changer_stat==false?Colors.black45:Colors.yellow,size: 50,)/*Icon(Icons.sort, color:color_changer_stat==false?Colors.black45:Colors.yellow,size: 50,)*/),
                Container(height: 60, child: VerticalDivider(color: Colors.black45)),
                GestureDetector(onTap:(){
                  setState(() {
                    color_changer_cal=false;
                    color_changer_home=false;
                    color_changer_stat=false;
                    color_changer_per=true;
                    index_nav=3;
                  });
                },child: ImageIcon(AssetImage('assets/perfo_logo.png'),color:color_changer_per==false?Colors.black45:Colors.yellow,size: 50,)/*Icon(Icons.shutter_speed, color:color_changer_per==false?Colors.black45:Colors.yellow,size: 47,)*/),
                SizedBox(width: 5,)


              ],
            )
        ),
      ),
    );
  }
}
