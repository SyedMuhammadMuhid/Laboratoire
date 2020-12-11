import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Services/Auth_Services.dart';
import 'package:sample_screen/Wrapper.dart';
import 'package:sample_screen/main.dart';

void logout_popup(BuildContext context) {
  final AuthServices _auth = AuthServices();
  final user = Provider.of<User>(context, listen: false);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Se déconnecter',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
          content: Text(
            "En cliquant sur Déconnexion, vous quittez cette application et la session",
            style: TextStyle(color: Color(0xff41B4C7), fontSize: 14),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Annuler',
                    style: GoogleFonts.heebo(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text(
                    'Se déconnecter',
                    style: GoogleFonts.heebo(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  onPressed: () async {
                    await _auth.signOutGoogle();
                    await _auth.FBLogout().whenComplete(() => print('done'));
                    await _auth.Sign_Out();

//                    if (await _auth.googleSignIn.currentUser!=null) {
//                      await _auth.signOutGoogle();
//                      print('done signout google ');
//                    }
//                    else if (_auth.auth.currentUser!=null) {
//                      print('done signout firebase user ');
//
//                      await _auth.Sign_Out();
//                    }
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Wrapper()),
                        (Route<dynamic> route) =>
                            false); //                    Navigator.of(context).pushReplacement(MaterialPageRoute(
//                        builder: (BuildContext context) => Wrapper()));
                  },
                ),
              ],
            )
          ],
        );
      });
}
