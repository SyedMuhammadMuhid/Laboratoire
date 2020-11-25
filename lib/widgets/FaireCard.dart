import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FaireCard extends StatelessWidget {


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
          color: Colors.lightBlue[50],
          elevation: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Stack(children: [Icon(Icons.cloud_queue, color: Colors.black45,), Image(image: AssetImage('assets/congradulations.png'),)]),
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
