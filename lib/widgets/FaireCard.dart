import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FaireCard extends StatefulWidget {
  @override
  _FaireCardState createState() => _FaireCardState();
}

class _FaireCardState extends State<FaireCard> {
  String image_link="";
  bool clicked=false;
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
                  GestureDetector(onTap: (){setState(() {
                    if(clicked==false){
                    image_link="assets/congradulations.png";
                    clicked=true;}
                    else if(clicked){
                      image_link="";
                      clicked=false;
                    }
                  });},
                      onDoubleTap: (){
                    setState(() {
                      if(clicked==false){
                        image_link='assets/oops.png';
                        clicked=true;
                      }

                    });
                  },child: Stack(children: [Icon(Icons.cloud_queue, color: Colors.black45,), Image(image: AssetImage(image_link),)])),
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
