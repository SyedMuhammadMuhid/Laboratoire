import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Services/Auth_Services.dart';
import 'package:sample_screen/Wrapper.dart';
import 'package:sample_screen/main.dart';
import 'package:intl/intl.dart';


void Motivation_popup( BuildContext context, int Points, String Cleaning, int Init )
{
  List Motivation_Statements=[

    "Toutes nos félicitations! Vous êtes à mi-chemin des points quotidiens! Continuez!",
    "Toutes nos félicitations! Vous êtes le pro du nettoyage!",
    "Salut? Vous ne voulez pas accumuler vos points aujourd'hui?",
    "Salut! Comment va ta bouche aujourd'hui?",
    "Salut! Comment vous sentez-vous aujourd'hui?",
    "Toutes nos félicitations! Vous êtes à la moitié de votre traitement! Continuez!"
  ];
       //5:08 PM


  int index=null;

 if(Points==50 ){
   index=0;
 }
 else if(Points==0){
   index=2;
 }
 else if(Cleaning ==To_do[1] || Cleaning == To_do[2] || Cleaning== To_do[4]){

   index=1;
 }
 else if(Init==0 ){
   index=4;
 }

 else if(Init==1){
   index=3;
 }
 else if( Init==100){
   index=5;
 }

  if(index!=null){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          content: Text(Motivation_Statements[index], style: TextStyle(color: Color(0xff41B4C7),fontSize: 14),),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Merci', style: GoogleFonts.heebo(fontWeight: FontWeight.bold, fontSize: 16 ),),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],

        );
      }

  );
  }
}