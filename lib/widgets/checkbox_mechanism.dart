import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Services/database.dart';
class Checkbox_mechanism extends StatefulWidget {
  String value;
  Checkbox_mechanism({this.value});
  @override
  _Checkbox_mechanismState createState() => _Checkbox_mechanismState(value: value);
}

class _Checkbox_mechanismState extends State<Checkbox_mechanism> {
  String value;
  bool check=false;
  _Checkbox_mechanismState({this.value});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('UserData').doc(uid_constant).collection('CheckPoints').snapshots(),
    builder: (context, snapshot) {
    if(!snapshot.hasData)return Container();
    if(snapshot.data.docs[index_of_the_day_constant]["Mechanisc"]== value)
    {
      check=true;
    }
    else if(snapshot.data.docs[index_of_the_day_constant]["Mechanisc"]!=value){
      check=false;
    }
    return Container(
      child: CheckboxListTile(
        title: Text(value,style: GoogleFonts.heebo(fontSize: 20, color: Colors.red),),
        controlAffinity: ListTileControlAffinity.leading,
        value: check,
        activeColor: Colors.pink,
        checkColor: Colors.black87,
        onChanged: (bool val){
          setState(() {
            if( check==false){
              DatabaseService(uid: uid_constant).UpdateCheckSingle(value, snapshot.data.docs[index_of_the_day_constant].documentID, 'Mechanisc');
              check=true;
            }
            else if(check==true){
              DatabaseService(uid: uid_constant).UpdateCheckSingle(" ", snapshot.data.docs[index_of_the_day_constant].documentID, 'Mechanisc');
              check=false;
            }
          });
        },
      ),
    );});
  }
}
