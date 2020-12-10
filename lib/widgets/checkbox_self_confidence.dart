import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Services/database.dart';
class Checkbox_self_confidence extends StatefulWidget {
  String value;
  Checkbox_self_confidence({this.value});
  @override
  _Checkbox_self_confidenceState createState() => _Checkbox_self_confidenceState(value: value);
}

class _Checkbox_self_confidenceState extends State<Checkbox_self_confidence> {
  String value;
  bool check=false;
  _Checkbox_self_confidenceState({this.value});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('UserData').doc(uid_constant).collection('CheckPoints').snapshots(),
    builder: (context, snapshot) {
    if(!snapshot.hasData)return Center(child: CircularProgressIndicator());
    if(snapshot.data.docs[index_of_the_day_constant]["Self_confidence"]== value)
    {
      check=true;
    }
    else if(snapshot.data.docs[index_of_the_day_constant]["Self_confidence"]!=value){
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
              DatabaseService(uid: uid_constant).UpdateCheckSingle(value, snapshot.data.docs[index_of_the_day_constant].documentID, 'Self_confidence');
              check=true;
            }
            else if(check==true){
              DatabaseService(uid: uid_constant).UpdateCheckSingle(" ", snapshot.data.docs[index_of_the_day_constant].documentID, 'Self_confidence');
              check=false;
            }
          });
        },
      ),
    );});
  }
}
