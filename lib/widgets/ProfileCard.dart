import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {
  String image_path;
  String name;
  Widget Navegation;

  ProfileCard({this.image_path,this.name,this.Navegation});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder:
                    (BuildContext context) => Navegation));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                Image(image: AssetImage(image_path),height: 40,width: 40,),
                SizedBox(width: 30,),
                Text(name, style: GoogleFonts.heebo(fontSize: 22, fontWeight: FontWeight.bold),)
              ],),
              SizedBox(height: 5,),
              Container(
                color: Color(0xff5fc9ed),
                height: 1,
                width: 340,
              )
            ],
          ),
        ),
      ),
    );
  }
}
