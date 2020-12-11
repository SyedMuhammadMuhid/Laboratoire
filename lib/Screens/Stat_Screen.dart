import 'dart:io';

import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as StorageReference;
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Models/User_Data_Model.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/Screens/Profile.dart';
import 'package:sample_screen/Services/database.dart';
import 'package:sample_screen/widgets/ImageCard.dart';

class StatScreen extends StatefulWidget {
  @override
  _StatScreenState createState() => _StatScreenState();

}

class _StatScreenState extends State<StatScreen> {
  List<dynamic> images = [
    // 'assets/pain.png'
//        'https://i.stack.imgur.com/ILTQq.png',
//        'https://i.stack.imgur.com/ILTQq.png',
//        'https://i.stack.imgur.com/ILTQq.png',
//        'https://i.stack.imgur.com/ILTQq.png',
  ];

  List<String> button = ['https://firebasestorage.googleapis.com/v0/b/laboratoire-bellomo.appspot.com/o/plus_btn.png?alt=media&token=d2463c61-e318-4d16-9002-c5634f09b6e8'];


  double TWO_PI = 3.14 * 2;

  @override
  Widget build(BuildContext context) {
    List<String> newList = [...images, ...button];

    final user = Provider.of<User>(context);

    double size = MediaQuery
        .of(context)
        .size
        .width / 2;
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          UserData userdata = snapshot.data;

          int Day_index = (Timestamp
              .now()
              .toDate()
              .difference(userdata.Start_date.toDate())
              .inDays);
          double progress = (((100 / userdata.Total_duration) * (Day_index + 1)).ceil()).toDouble();

          return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/all_app.png"),
                      fit: BoxFit.cover)),
              child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (
                                                    BuildContext context) =>
                                                    ProfileScreen()));
                                      },
                                      child: Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                        size: 55,
                                      )),
                                ),
                                Text(
                                  'Evolution',
                                  style: GoogleFonts.heebo(
                                      color: Colors.white, fontSize: 30),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (
                                                    BuildContext context) =>
                                                    NotificationScreen()));
                                      },
                                      child: notification_list.length==0?CircleAvatar(
                                        child: Icon(
                                          Icons.notifications_none,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                        backgroundColor: Color(0xffFF999A),
                                        radius: 25,
                                      ):CircleAvatar(
                                        child: Badge(
                                            badgeContent: Text(
                                              notification_list.length.toString(),
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            child: Icon(
                                              Icons.notifications_none,
                                              color: Colors.white,
                                              size: 35,
                                            )),
                                        backgroundColor: Color(0xffFF999A),
                                        radius: 25,
                                      )
                                  ),
                                )
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TweenAnimationBuilder(
                                  tween: Tween(
                                      begin: 0.0,
                                      end: ((100 / userdata.Total_duration) * (Day_index + 1)) / 100),
                                  duration: Duration(seconds: 4),
                                  builder: (context, value, child) {
                                    // percentage to show in Center Text

                                    int percentage = (value * 100).ceil();
                                   // progress=percentage;

                                    return Container(
                                      width: size,
                                      height: size,
                                      child: Stack(
                                        children: [
                                          ImageIcon(
                                            AssetImage('assets/dotted.png'),
                                            color: Colors.white,
                                            size: size,
                                          ),
                                          ShaderMask(
                                            shaderCallback: (rect) {
                                              return SweepGradient(
                                                  startAngle: 0.0,
                                                  endAngle: TWO_PI,
                                                  stops: [
                                                    value,
                                                    value
                                                  ],
                                                  // value from Tween Animation Builder

                                                  // 0.0 , 0.5 , 0.5 , 1.0

                                                  center: Alignment.center,
                                                  colors: [
                                                    Colors.yellow,
                                                    Colors.transparent
                                                  ]).createShader(rect);
                                            },
                                            child: Container(
                                              width: size,
                                              height: size,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.yellow),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              width: size - 18,
                                              height: size - 18,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffA3D5D9),
                                                  shape: BoxShape.circle),
                                            ),
                                          ),
                                          Center(
                                            child: CircleAvatar(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    15.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '   JOURS\n RESTANTS',
                                                      style: GoogleFonts.heebo(
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xffF5FBFC)),
                                                    ),
                                                    Text(
                                                      userdata.Total_duration
                                                          .toString(),
                                                      style: GoogleFonts.heebo(
                                                          fontSize: 30,
                                                          color: Color(
                                                              0xffF5FBFC)),
                                                    ),
                                                    Center(
                                                        child: Text(
                                                            "$percentage" +
                                                                " %",
                                                            style: GoogleFonts
                                                                .heebo(
                                                                fontSize: 15,
                                                                color: Color(
                                                                    0xffF5FBFC)))),
                                                  ],
                                                ),
                                              ),
                                              backgroundColor: Color(
                                                  0xffFF6766),
                                              radius: (size-30)/2,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'assets/mountains.png',
                                        height: MediaQuery.of(context).size.width<400?150:200,
                                        width: MediaQuery.of(context).size.width<400?350:400,
                                      ),
                                      Positioned(
                                          top: 100 - progress,
                                          left: 0 + (progress * 3.4),
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 33.3,
                                                child:
                                                Image.asset('assets/flag.png'),
                                              ),
                                              Text(
                                                progress.toString() + " %",
                                                style: GoogleFonts.heebo(
                                                    color: Colors.red),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ta Progression\n     en photos",
                                style: GoogleFonts.heebo(
                                    fontSize: 40, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "Une fois par mois, prend une photo\nde ton sourier afin de voir l'evolution.",
                                  style: GoogleFonts.heebo(
                                      fontSize: 20, color: Colors.white))
                            ],
                          ),

//                Wrap(
//                  alignment: WrapAlignment.start,
//                  direction: Axis.horizontal, // default
//                  children: [
//                    Image.network('https://i.stack.imgur.com/ILTQq.png',height: 100,),
//                    Image.network('https://i.stack.imgur.com/ILTQq.png',height: 100,),
//                    Image.network('https://i.stack.imgur.com/ILTQq.png',height: 100,),
//                    Image.network('https://i.stack.imgur.com/ILTQq.png',height: 100,),
//                    Image.network('https://i.stack.imgur.com/ILTQq.png',height: 100,),
//
//
//                  ],
//                ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 300,
                              child:  StreamBuilder(
                               stream: FirebaseFirestore.instance.collection('UserData').doc(uid_constant).collection('ImageGrid').snapshots(),
                               builder: (context, snapshot) {
                               if(!snapshot.hasData)return Center(child: CircularProgressIndicator());
                               List Local_image_list=snapshot.data.docs[0]["ImageList"];
                               print(Local_image_list.toString()+" this is the Local image list that is assigned the list from database ");

                            return  GridView.builder(
                                physics: ClampingScrollPhysics(),
                               // itemCount: newList.length,
                               itemCount: Local_image_list.length,
                                gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 5),
                                itemBuilder: (BuildContext context, int index) {
                                  //if(newList[index].contains('firebasestorage'))
                                  return InkWell(
                                    onTap: ()async {
                                      if (Local_image_list[index] == button[0]) {
                                       await chooseFile(snapshot,Local_image_list);

                                        print(snapshot.data.docs[0].documentID+" doc id in function");
                                        print(newList.toString()+" checking if newList list got updated");
                                      //  await DatabaseService(uid: uid_constant).UpdateImageListSingle(snapshot.data.docs[0].documentID, newList);
                                       setState(() {

                                         });
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                   Local_image_list[index].toString() ),
                                                fit: Local_image_list[index] == button[0]
                                                    ? BoxFit.none
                                                    : BoxFit.cover),
                                            color: Colors.white,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                                bottomRight: Radius.circular(
                                                    8.0),
                                                bottomLeft: Radius.circular(
                                                    8.0))),
                                        height: 90,
                                        width: 90,

                                        // child: Image.asset(
                                        //   newList[index],
                                        //   height: 90,
                                        //   width: 90,
                                        //   fit: newList[index]==button[0]?BoxFit.none:BoxFit.fill,
                                        // ),
                                      ),
                                    ),
                                  );
                                },
                              );}),
                            ),
                          ),

                          Image(image: AssetImage('assets/video_btn.png'),),
                          SizedBox(height: 30,)

                        ],
                      ),
                    ),
                  )));
        });
  }

  void chooseFile( snapshot , Local_imagme_list) async {
    List newList;
    List<dynamic> Local;
    File selected = await ImagePicker.pickImage(source: ImageSource.gallery);
   // images.add(selected.path);

    // this.setState(() {
    //   _image = selected;
    //   print(_image);
    // });
    //
    // setState(() {
    //
    //   showSpinner = true;
    // });

    StorageReference.Reference storageReference = StorageReference
        .FirebaseStorage.instance
        .ref()
        .child('Dentist/${Path.basename(selected.path)}}');
    StorageReference.UploadTask uploadTask = storageReference.putFile(selected);
    await uploadTask.whenComplete(() => print('File Uploaded'));
    storageReference.getDownloadURL().then((fileURL) async {
      //  _uploadedFileURL = fileURL;
      // print(fileURL)
      Local=Local_imagme_list;
      Local.removeLast();
      images=Local;
      images.add(fileURL);
     newList=[ ...images,...button];

////print(CRUD.imgUrl);

      await DatabaseService(uid: uid_constant).UpdateImageListSingle(snapshot.data.docs[0].documentID, newList);

//
//    // CRUD.imgUrl=fileURL;
//    // showSpinner = false;
//    //
//    // print(CRUD.imgUrl);
//    // CRUD.updateProfileData();
//
//
//  });


    });
    // setState(() {
    //
    // });
  }


}