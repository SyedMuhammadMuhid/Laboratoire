import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Models/User_Data_Model.dart';
import 'package:sample_screen/Popups/Logout_popup.dart';
import 'package:sample_screen/Screens/First_Profile_Screen.dart';
import 'package:sample_screen/Screens/Home.dart';
import 'package:sample_screen/Services/Auth_Services.dart';
import 'package:sample_screen/Services/database.dart';
import 'package:sample_screen/Wrapper.dart';
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
                image: AssetImage("assets/all_app.png"),
                fit: BoxFit.cover)),
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
                          child: GestureDetector(onTap: () {
                            index_nav = 0;
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder:
                                        (BuildContext context) => Home()));
                          },
                              child: Icon(
                                Icons.arrow_back, color: Color(0xffF5FBFC),
                                size: 55,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(child: Badge(
                              badgeContent: Text('2',
                                style: TextStyle(color: Colors.white),),
                              child: Icon(Icons.notifications_none,
                                color: Colors.white, size: 35,)),
                            backgroundColor: Color(0xffFF999A),
                            radius: 25,),
                        )
                      ]),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Stack(

                      children: [

                        Positioned(
                          top: 100,
                          child: Container(
                            height: ((MediaQuery
                                .of(context)
                                .size
                                .height / 4) * 2.5) + 100,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(height: 100,),
                                Container(
                                  height: (MediaQuery
                                      .of(context)
                                      .size
                                      .height / 4) * 2.5,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  child: ListView.builder(

                                    physics: BouncingScrollPhysics(),
                                    itemCount: profile_items.length,
                                    // itemCount: _categories.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return ProfileCard(
                                          name: profile_items[index].name,
                                          image_path: profile_items[index]
                                              .image_path,
                                          Navegation: profile_items[index]
                                              .screen);
                                    },
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),

                        Positioned(
                          left: (MediaQuery
                              .of(context)
                              .size
                              .width - 370) / 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0)),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          onTap: () async {
                                            logout_popup(context);

                                          },
                                          child: Icon(
                                            Icons.exit_to_app, size: 30,
                                            color: Color(0xff41B4C7),)),
                                    )
                                  ],),
                                Stack(children: [
                                ClipOval(
                                child: Image.network(
                                Image_url,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                          ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  FirstProfileScreen()));
                                    },
                                    child: CircleAvatar(child: Icon(
                                      Icons.edit, color: Colors.white,),
                                      backgroundColor: Color(0xffFF999A),),
                                  ),
                                ]),
                                Text(F_Name+" "+L_Name, style: GoogleFonts.heebo(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),)
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
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: uid_constant).userData,
      builder: (context, snapshot) {
        if(!snapshot.hasData)return CircularProgressIndicator();
        UserData userdata = snapshot.data;
        F_Name=userdata.F_Name;
        L_Name=userdata.L_Name;
        return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/all_app.png"),
                    fit: BoxFit.cover)),
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
                              child: GestureDetector(onTap: () {
                                index_nav = 0;
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder:
                                            (BuildContext context) => Home()));
                              },
                                  child: Icon(
                                    Icons.arrow_back, color: Color(0xffF5FBFC),
                                    size: 55,)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircleAvatar(child: Badge(
                                  badgeContent: Text('2',
                                    style: TextStyle(color: Colors.white),),
                                  child: Icon(Icons.notifications_none,
                                    color: Colors.white, size: 35,)),
                                backgroundColor: Color(0xffFF999A),
                                radius: 25,),
                            )
                          ]),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Stack(

                          children: [

                            Positioned(
                              top: 100,
                              child: Container(
                                height: ((MediaQuery
                                    .of(context)
                                    .size
                                    .height / 4) * 2.5) + 100,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(height: 100,),
                                    Container(
                                      height: (MediaQuery
                                          .of(context)
                                          .size
                                          .height / 4) * 2.5,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      child: ListView.builder(

                                        physics: BouncingScrollPhysics(),
                                        itemCount: profile_items.length,
                                        // itemCount: _categories.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (BuildContext context,
                                            int index) {
                                          return ProfileCard(
                                              name: profile_items[index].name,
                                              image_path: profile_items[index]
                                                  .image_path,
                                              Navegation: profile_items[index]
                                                  .screen);
                                        },
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ),

                            Positioned(
                              left: (MediaQuery
                                  .of(context)
                                  .size
                                  .width - 370) / 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                      bottomLeft: Radius.circular(30.0)),
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                              onTap: () async {
                                                logout_popup(context);
                                              },
                                              child: Icon(
                                                Icons.exit_to_app, size: 30,
                                                color: Color(0xff41B4C7),)),
                                        )
                                      ],),
                                    Stack(children: [
                                      CircleAvatar(radius: 50,
                                        backgroundColor: Colors.white,
                                        child: Image(image: AssetImage(
                                            'assets/propic.png'),),),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                      FirstProfileScreen()));
                                        },
                                        child: CircleAvatar(child: Icon(
                                          Icons.edit, color: Colors.white,),
                                          backgroundColor: Color(0xffFF999A),),
                                      ),
                                    ]),
                                    Text('any thing', style: GoogleFonts.heebo(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),)
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
    );
  }
}
