import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Checkboxwid extends StatefulWidget {
  String value;
  Checkboxwid({this.value});
  @override
  _CheckboxwidState createState() => _CheckboxwidState(value: value);
}

class _CheckboxwidState extends State<Checkboxwid> {
  String value;
  bool check=false;
  _CheckboxwidState({this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CheckboxListTile(
        title: Text(value,style: GoogleFonts.heebo(fontSize: 20, color: Colors.red),),
        controlAffinity: ListTileControlAffinity.leading,
        value: check,
        activeColor: Colors.pink,
        checkColor: Colors.black87,
        onChanged: (bool val){
          setState(() {
         check=val;
          });
        },
      ),
    );
  }
}
