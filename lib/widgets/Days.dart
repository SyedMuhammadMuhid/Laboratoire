import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Models/Points_Model.dart';
import 'package:sample_screen/Services/database.dart';
import 'package:sample_screen/widgets/FaireCard.dart';
class Dayswid extends StatefulWidget {
  String Date;
  String Jour;
  QueryDocumentSnapshot document;
  int index_of_day;
  Dayswid({this.Date,this.Jour,this.document,this.index_of_day});
  @override
  _DayswidState createState() => _DayswidState(Date: Date,Jour: Jour,document: document,index_of_day:index_of_day);
}

class _DayswidState extends State<Dayswid> {
  String Date;
  String Jour;
  int index_of_day;

  QueryDocumentSnapshot document;
  _DayswidState({this.Date,this.Jour,this.document,this.index_of_day});
  @override
  Widget build(BuildContext context) {

    return Container(
    child: Stack(
    children: [
    Padding(
    padding: const EdgeInsets.only(left:25.0, top: 0.0),
    child: Container(
    height: tapped==false?150:0,
    width: tapped==false?((MediaQuery.of(context).size.width/3)*2.3):0,
    child:
    Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(35)),
    ),
    elevation: 0,
    color: Color(0xffF5FBFC),
    child: Padding(
    padding: const EdgeInsets.only(left: 20, top: 20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(Date, style: GoogleFonts.heebo(fontSize: 15, color:Color(0xff41B4C7)),),
    Text(Jour, style: GoogleFonts.heebo(fontSize: 35, color: Color(0xff41B4C7)),),

    ],
    ),
    ),

    ),),
    ),
    Padding(
    padding: const EdgeInsets.only(left:25.0, bottom: 25.0, right:25.0, top: 80),
    child: Container(
    height: tapped==false?1063:0,
    width: tapped==false?((MediaQuery.of(context).size.width/3)*2.3):0,
    child:
    Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(35)),
    ),
    elevation: 0,
    color: Color(0xffF5FBFC),
    child:
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Container(
    height: 800,
    child: ListView.builder(

    physics: NeverScrollableScrollPhysics(),
    itemCount:To_do.length,
    // itemCount: _categories.length,
    scrollDirection: Axis.vertical,
    itemBuilder: (BuildContext context, int index){
    return FaireCard(
      points: document[ToDo_number[index]],
    Data: To_do[index],
      index_of_day:index_of_day,
      index_of_todo:index
    );

    },
    ),
    ),

    SizedBox(height: 20,),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(height: 70, width: 70,child: Icon(Icons.remove, color: Colors.red,size: 30,),color: Colors.white,),
    Container(height: 70, width: 70,child: Center(child: Text('12h', style: GoogleFonts.heebo(color: Colors.white,fontSize: 30),)),color: Color(0xff41B4C7) ,),
    Container(height: 70, width: 70,child: Icon(Icons.add, color: Color(0xff41B4C7),size: 30,),color: Colors.white,)
    ],),
    SizedBox(height: 10,),
    Container(
    decoration: BoxDecoration(
    color:Color(0xff41B4C7),
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.0), bottomLeft: Radius.circular(25.0) )
    ),
    width: MediaQuery.of(context).size.width,
    child:
    Column(children: [
    Text('Accumulation of points', style: GoogleFonts.heebo(fontSize: 18, color: Color(0xffF5FBFC)),),
    Text(total_points.toString(), style:GoogleFonts.heebo(fontSize: 30, color: Color(0xffF5FBFC)) ,)
    ],),)
    ],
    )
    )),
    ),

    ]),
    );

  }
}
