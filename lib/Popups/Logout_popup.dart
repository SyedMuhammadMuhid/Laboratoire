import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Services/Auth_Services.dart';
import 'package:sample_screen/Wrapper.dart';
import 'package:sample_screen/main.dart';

void logout_popup( BuildContext context)
{
  final AuthServices _auth=AuthServices();
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Logout', style: TextStyle(color: Colors.red, fontSize: 18),),
          content: Text('By clicking Logout you exit this application and the session', style: TextStyle(color: Color(0xff41B4C7),fontSize: 14),),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text('Cancle', style: GoogleFonts.heebo(fontWeight: FontWeight.bold, fontSize: 16 ),),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Logout', style: GoogleFonts.heebo(fontWeight: FontWeight.bold, fontSize: 16 ),),
                  onPressed: ()async{

                    await _auth.Sign_Out();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Wrapper()));
                //   Navigator.pop(context);

                  },
                ),
              ],
            )
          ],

        );
      }

  );
}