import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Popups/Motivation_popup.dart';
import 'package:sample_screen/Services/database.dart';

class FaireCard extends StatefulWidget {
  String Data;
  int points;
  int index_of_day;
  int index_of_todo;
  int total_point_of_the_day;
 String document_id;

  FaireCard({this.Data,this.points,this.index_of_day,this.index_of_todo,this.total_point_of_the_day,this.document_id});
  @override
  _FaireCardState createState() => _FaireCardState(Data: Data,points: points,index_of_day: index_of_day,index_of_todo: index_of_todo,total_point_of_the_day: total_point_of_the_day,document_id: document_id);
}

class _FaireCardState extends State<FaireCard> {
  String Data;
  int points;
  int index_of_day;
  int index_of_todo;
  int total_point_of_the_day;
  String document_id;


  _FaireCardState({this.Data,this.points,this.index_of_todo,this.index_of_day,this.total_point_of_the_day,this.document_id});

  String image_link = "assets/trans_img.png";
  bool clicked = false;
  int Statement = 0;
  int anything=0;
  bool Iam_oops=false;
  @override

  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);



    if(anything==0&&points==0){
      image_link="assets/trans_img.png";
      Statement=0;
    }
    else if(anything==0&&points==10){
      image_link="assets/congradulations.png";
      Statement=1;
      clicked=true;
    }
    else if(anything==0&&points==-1){
      image_link='assets/oops.png';
      Statement=2;
      clicked=true;
    }
    anything++;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
        .collection('UserData')
        .doc(uid_constant)
        .collection('Points')
        .snapshots(),
    builder: (context, snapshot) {
    if (!snapshot.hasData) return Container();

    total_point_of_the_day=snapshot.data.docs[index_of_day]['TotalPoints'];

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        height: MediaQuery.of(context).size.width<400?132:121,
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
                            DatabaseService(uid: user.uid).UpdatePointsSingleUpdate(index_of_todo, document_id, 10);
                            total_point_of_the_day+=10;
                            print(total_point_of_the_day.toString()+" this is sthe farie card and the total point dynamic variable");
                            DatabaseService(uid: user.uid).UpdatePointsTotal("TotalPoints", document_id,total_point_of_the_day );
                            Iam_oops=false;
                            clicked = true;
                            Motivation_popup(context, -1 ,Data , -1);

                          }
                          else if (clicked) {
                            image_link = "assets/trans_img.png";
                            clicked = false;
                            Statement = 0;
                            DatabaseService(uid: user.uid).UpdatePointsSingleUpdate(index_of_todo, document_id, 0);
                            if(Iam_oops!=true){
                            total_point_of_the_day-=10;
                            print(total_point_of_the_day.toString()+" this is sthe - command farie card and the total point dynamic variable");

                            DatabaseService(uid: user.uid).UpdatePointsTotal("TotalPoints", document_id,total_point_of_the_day);
                            }
                            Motivation_popup(context, total_point_of_the_day ,'' , -1);

                          }
                        });
                      },
                      onDoubleTap: () {
                        Statement = 2;
                        setState(() {
                          if (clicked == false) {
                            image_link = 'assets/oops.png';
                            clicked = true;
                            DatabaseService(uid: user.uid).UpdatePointsSingleUpdate(index_of_todo, document_id, -1);
                            Iam_oops=true;


                          } else if (clicked == true && Iam_oops!=true) {
                            image_link = 'assets/oops.png';
                            clicked = true;
                            DatabaseService(uid: user.uid).UpdatePointsSingleUpdate(index_of_todo, document_id, -1);
                            Iam_oops=true;
                           total_point_of_the_day-=10;
                            DatabaseService(uid: user.uid).UpdatePointsTotal("TotalPoints", document_id, total_point_of_the_day);

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
                        height: MediaQuery.of(context).size.width<400?80:65,
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
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, top: 0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width/2,
                         child: Text(
                          Data,
                          style:
                              GoogleFonts.heebo(fontSize: 15, color: Colors.black),

                        ),
                      ),
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
    );});
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
