import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Services/database.dart';

class FaireCard extends StatefulWidget {
  String Data;
  FaireCard({this.Data});
  @override
  _FaireCardState createState() => _FaireCardState(Data: Data);
}

class _FaireCardState extends State<FaireCard> {
  String Data;
  _FaireCardState({this.Data});
  String image_link = "assets/trans_img.png";
  bool clicked = false;
  int Statement = 0;
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        height: 100,
        width: 30,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35)),
          ),
          color: Color(0xffF5FBFC),
          elevation: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  InkWell(
                      onTap: () {
                        Statement = 1;
                        setState(() {
                          if (clicked == false) {
                            image_link = "assets/congradulations.png";
                            DatabaseService(uid: user.uid).UpdatePoints(0, 0, 0, 0, 0, 0, 0, 0,'Day 1');
                            clicked = true;
                          } else if (clicked) {
                            image_link = "assets/trans_img.png";
                            clicked = false;
                            Statement = 0;
                          }
                        });
                      },
                      onDoubleTap: () {
                        Statement = 2;
                        setState(() {
                          if (clicked == false) {
                            image_link = 'assets/oops.png';
                            clicked = true;
                            DatabaseService(uid: user.uid).UpdatePoints(10, 0, 0, 0, 0, 0, 0, 0,"Day 1");

                          } else if (clicked == true) {
                            image_link = 'assets/oops.png';
                            clicked = true;
                          }
                        });
                      },
                      child: Stack(children: [
                        Icon(
                          Icons.cloud_queue,
                          color: Colors.black45,
                        ),
                        Image(
                          image: AssetImage(image_link,),
                        )
                      ])),
                  Center(
                    child: Container(
                        height: 60,
                        width: 7,
                        child: VerticalDivider(color: Colors.black)),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 3),
                    child: Text(
                      Statement == 0
                          ? Todo_Statement
                          : Statement == 1
                              ? Congrats_Statement
                              : Statement == 2
                                  ? Oops_Statement
                                  : Todo_Statement,
                      style: GoogleFonts.heebo(
                          fontSize: 15, color: Colors.black45),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 0),
                    child: Text(
                      Data,
                      style:
                          GoogleFonts.heebo(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 0),
                    child: Text(
                      "+10 pts",
                      style: GoogleFonts.heebo(
                          decoration: Statement == 2
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontSize: 15,
                          color: Statement == 0
                              ? Colors.black26
                              : Statement == 1
                                  ? Color(0xff41B4C7)
                                  : Statement == 2
                                      ? Colors.red
                                      : Colors.black26),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*class FaireCard extends StatelessWidget {

String image_link="";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        height: 100,
        width: 30,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35)),
          ),
          color: Color(0xffF5FBFC),
          elevation: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  GestureDetector(onTap: (){image_link="assets/congradulations.png";},onDoubleTap: (){image_link='assets/oops.png';},child: Stack(children: [Icon(Icons.cloud_queue, color: Colors.black45,), Image(image: AssetImage(image_link),)])),
                  Center(child:Container(height: 60, width: 7, child: VerticalDivider(color: Colors.black)),)
                ],
              ),
              Column(
crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 3),
                    child: Text('A faires', style: GoogleFonts.heebo(fontSize: 15, color: Colors.black45),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top:0),
                    child: Text("J'ai porte mon apperail", style: GoogleFonts.heebo(fontSize: 15, color: Colors.black),),
                  ),Padding(
                    padding: const EdgeInsets.only(left: 12, top: 0),
                    child: Text("toute la nuit", style: GoogleFonts.heebo(fontSize: 15, color: Colors.black),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 0),
                    child: Text("+10 pts", style: GoogleFonts.heebo(fontSize: 15, color: Colors.black26),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}*/
