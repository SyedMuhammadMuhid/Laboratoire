import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Screens/Home.dart';
import 'package:sample_screen/widgets/ProfileCard.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/background_image_app.png"), fit: BoxFit.cover)),
    child: SafeArea(
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(onTap:(){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder:
                                (BuildContext context) =>Home()));
                  },child: Icon(Icons.arrow_back, color: Colors.lightBlue[50],size: 55,)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(child: Icon(Icons.notifications_none, color: Colors.lightBlue[50],size: 35,),backgroundColor: Colors.pink[200],radius: 25,),
                )
              ]),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(

              children: [

              Positioned(
                 top: 100,
                child: Container(
                  height: (MediaQuery.of(context).size.height),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 100,),
                      Container(
                        height: (MediaQuery.of(context).size.height),
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(

                          physics: BouncingScrollPhysics(),
                          itemCount:profile_items.length,
                          // itemCount: _categories.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index){
                            return ProfileCard(name: profile_items[index].name, image_path: profile_items[index].image_path,);

                          },
                        ),
                      ),
                    ],
                  ),

                ),
              ),

              Positioned(
                left: (MediaQuery.of(context).size.width-370)/2,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0) ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  height: 190,
                  width: 370,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.exit_to_app, size: 30,color:Color(0xff5fc9ed) ,),
                        )
                      ],),
                      Stack(children: [CircleAvatar(radius: 50, child: Image(image: AssetImage('assets/propic.png'),),),CircleAvatar(child: Icon(Icons.edit, color: Colors.white,),backgroundColor: Colors.pink[200],),]),
                      Text('Mon Profil', style: GoogleFonts.heebo(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),)
                    ],
                  ),
                ),
              ),

            ],),
          ),

        ],),
      ),
    )

    ));
  }
}
