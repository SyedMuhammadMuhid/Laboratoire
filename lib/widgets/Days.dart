import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/widgets/FaireCard.dart';
class Dayswid extends StatefulWidget {
  String Date;
  String Jour;
  Dayswid({this.Date,this.Jour});
  @override
  _DayswidState createState() => _DayswidState(Date: Date,Jour: Jour);
}

class _DayswidState extends State<Dayswid> {
  String Date;
  String Jour;
  _DayswidState({this.Date,this.Jour});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:25.0, top: 0.0),
              child: Container(
                height: tapped==false?150:0,
                width: tapped==false?320:0,
                child:
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                  ),
                  elevation: 0,
                  color: Colors.lightBlue[50],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Date+' octobre 2020', style: GoogleFonts.heebo(fontSize: 15, color: Color(0xff5fc9ed)),),
                        Text(Jour, style: GoogleFonts.heebo(fontSize: 35, color: Color(0xff5fc9ed)),),

                      ],
                    ),
                  ),

                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:25.0, bottom: 25.0, right:25.0, top: 80),
              child: Container(
                  height: tapped==false?800:0,
                  width: tapped==false?320:0,
                  child:
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                      ),
                      elevation: 0,
                      color: Colors.lightBlue[50],
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 500,
                            child: ListView.builder(

                              physics: BouncingScrollPhysics(),
                              itemCount:5,
                              // itemCount: _categories.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index){
                                return FaireCard(

                                );

                              },
                            ),
                          ),

                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Container(height: 70, width: 70,child: Icon(Icons.remove, color: Colors.red,size: 30,),color: Colors.white,),
                            Container(height: 70, width: 70,child: Center(child: Text('12h', style: GoogleFonts.heebo(color:Colors.lightBlue[50],fontSize: 30),)),color: Color(0xff5fc9ed) ,),
                            Container(height: 70, width: 70,child: Icon(Icons.add, color: Color(0xff5fc9ed),size: 30,),color: Colors.white,)
                          ],),
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                                color:Color(0xff5fc9ed),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.0), bottomLeft: Radius.circular(25.0) )
                            ),
                            width: MediaQuery.of(context).size.width,
                            child:
                            Column(children: [
                              Text('Accumulation of points', style: GoogleFonts.heebo(fontSize: 18, color: Colors.lightBlue[50]),),
                              Text('52', style:GoogleFonts.heebo(fontSize: 30, color: Colors.lightBlue[50]) ,)
                            ],),)
                        ],
                      )
                  )),
            ),

          ]),
    );
  }
}
