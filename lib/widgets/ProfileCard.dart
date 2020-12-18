import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';

class ProfileCard extends StatelessWidget {
  String image_path;
  String name;
  Widget Navegation;

  ProfileCard({this.image_path,this.name,this.Navegation});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        if(name=='Actions'){index_nav=0;}
        else if(name=='Calendrier'){index_nav=1;}
        else if(name=='Évolution'){index_nav=2;}
        else if(name=='Les performances'){index_nav=3;}
        Navigator.of(context).push(
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
                Text(name, style: GoogleFonts.heebo(fontSize: 20,fontWeight: FontWeight.bold),)
              ],),
              SizedBox(height: 5,),
              Container(
                color: Color(0xff969696),
                height: 0.2,

                width: 280,
              )
            ],
          ),
        ),
      ),
    );
  }
}
