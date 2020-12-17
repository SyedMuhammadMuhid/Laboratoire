import 'dart:io';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as StorageReference;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Loading/loading.dart';
import 'package:sample_screen/Models/User_Data_Model.dart';
import 'package:sample_screen/Screens/Home.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/Screens/Start_Screen.dart';
import 'package:sample_screen/Services/database.dart';
import 'package:path/path.dart' as Path;
import 'package:sample_screen/widgets/Please_wait.dart';
import 'Login_Screen.dart';

class FirstProfileScreen extends StatefulWidget {
  @override
  _FirstProfileScreenState createState() => _FirstProfileScreenState();
}

class _FirstProfileScreenState extends State<FirstProfileScreen> {
  final _key = GlobalKey<FormState>();
  String F_Name;
  String L_Name;
  String Age;
  String Sex;
  String Device;
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  FToast fToast;

  bool asyncpressed = false;
  String Allergies;
  String Doctor_address;
  String Dentist_address;
  String Blood_type;
  String Frequency;
  int Total_duration;
  String Instructions;
  String Image_url = 'gs://laboratoire-bellomo.appspot.com/propic.png';
  int times = 0;
  List image = [
    'https://firebasestorage.googleapis.com/v0/b/laboratoire-bellomo.appspot.com/o/plus_btn.png?alt=media&token=d2463c61-e318-4d16-9002-c5634f09b6e8'
  ];
  // a choose file function--------------
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void chooseFile() async {
    File selected = await ImagePicker.pickImage(source: ImageSource.gallery);

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
        .child('Recent/${Path.basename(selected.path)}}');
    StorageReference.UploadTask uploadTask = storageReference.putFile(selected);
    await uploadTask.whenComplete(() => print('File Uploaded'));
    storageReference.getDownloadURL().then((fileURL) async {
      setState(() {
        //  _uploadedFileURL = fileURL;
        // print(fileURL);

        Image_url = fileURL;
      });

//print(CRUD.imgUrl);

      // CRUD.imgUrl=fileURL;
      // showSpinner = false;
      //
      // print(CRUD.imgUrl);
      // CRUD.updateProfileData();
    });
  }
  // end of function-------------

  //---------------------------------toast function
  void float_toast(String message) async {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
      /* positionedToastBuilder: (context, child) {
            return Positioned(
              child: child,
              top: MediaQuery.of(context).size.height-10,

            );
          }*/
    );
  }

  //________________________________

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    uid_constant = user.uid;
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          UserData userdata = snapshot.data;
          if (times < 1) {
            F_Name = userdata.F_Name;
            L_Name = userdata.L_Name;
            Age = userdata.Age;
            Sex = userdata.Sex;
            Device = userdata.Device;
            Allergies = userdata.Allergies;
            Doctor_address = userdata.Doctor_address;
            Dentist_address = userdata.Dentist_address;
            Frequency = userdata.Frequency;
            Total_duration = userdata.Total_duration;
            Blood_type = userdata.Blood_type;
            Instructions = userdata.Instructions;
            Image_url = userdata.Image_url;
          }
          times++;
          return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/all_app.png"),
                      fit: BoxFit.cover)),
              child: SafeArea(
                  child: Scaffold(
                backgroundColor: Colors.transparent,
                body: ModalProgressHUD(
                  inAsyncCall: asyncpressed,
                  progressIndicator: PleaseWait(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                    onTap: () {
                                      index_nav = 0;
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  StartScreen()));
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Color(0xffF5FBFC),
                                      size: 55,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                    onTap: () async {
                                      //-----------------------------------------------
                                      if (_key.currentState.validate()) {
                                        setState(() {
                                          asyncpressed = true;
                                        });

                                        if (userdata.Total_duration !=
                                            Total_duration) {
                                          dynamic result =
                                              await DatabaseService(
                                                      uid: uid_constant)
                                                  .UpdateUserData(
                                                      F_Name,
                                                      L_Name,
                                                      Age,
                                                      Sex,
                                                      Device,
                                                      Allergies,
                                                      Doctor_address,
                                                      Dentist_address,
                                                      Blood_type,
                                                      Frequency,
                                                      Total_duration,
                                                      Instructions,
                                                      Image_url);

                                          final snapShot =
                                              await FirebaseFirestore.instance
                                                  .collection('UserData')
                                                  .doc(uid_constant)
                                                  .collection('Points')
                                                  .get();
                                          final snapShot2 =
                                              await FirebaseFirestore.instance
                                                  .collection('UserData')
                                                  .doc(uid_constant)
                                                  .collection('CheckPoints')
                                                  .get();
                                          final snapShot3 =
                                              await FirebaseFirestore.instance
                                                  .collection('ImageGrid')
                                                  .doc(uid_constant)
                                                  .collection('CheckPoints')
                                                  .get();

                                          if (snapShot.docs.length != 0 &&
                                              snapShot2.docs.length != 0) {
                                            FirebaseFirestore.instance
                                                .collection('UserData')
                                                .doc(uid_constant)
                                                .collection('Points')
                                                .get()
                                                .then((snapshot) {
                                              for (DocumentSnapshot ds
                                                  in snapshot.docs) {
                                                ds.reference.delete();
                                              }
                                            });

                                            FirebaseFirestore.instance
                                                .collection('UserData')
                                                .doc(uid_constant)
                                                .collection('CheckPoints')
                                                .get()
                                                .then((snapshot) {
                                              for (DocumentSnapshot ds
                                                  in snapshot.docs) {
                                                ds.reference.delete();
                                              }
                                            });
                                          }
// one for removed and made into one
                                          for (int i = 1;
                                              i <= Total_duration;
                                              i++) {
                                            DatabaseService(uid: uid_constant)
                                                .UpdatePoints(0, 0, 0, 0, 0, 0,
                                                    0, 0, 0, 0);

                                            // this command was in an other for loop
                                            DatabaseService(uid: uid_constant)
                                                .UpdateCheckPoint(
                                                    ' ', ' ', ' ', ' ', ' ');
                                          }

                                          if (snapShot3.docs.length == 0) {
                                            await DatabaseService(
                                                    uid: uid_constant)
                                                .UpdateImageList(image);
                                          }
                                        }
//-------------------------------------------

                                        else if (userdata.Total_duration ==
                                            Total_duration) {
                                          dynamic result =
                                              await DatabaseService(
                                                      uid: uid_constant)
                                                  .UpdateUserData(
                                                      F_Name,
                                                      L_Name,
                                                      Age,
                                                      Sex,
                                                      Device,
                                                      Allergies,
                                                      Doctor_address,
                                                      Dentist_address,
                                                      Blood_type,
                                                      Frequency,
                                                      Total_duration,
                                                      Instructions,
                                                      Image_url);
                                        }

                                        //------------------------------------------------
                                        setState(() {
                                          asyncpressed = false;
                                        });

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        NotificationScreen()));
                                      }
                                      //-----------------------------------------------

                                      else {
                                        float_toast(
                                            'créer un profil en premier');
                                      }
                                    },
                                    child: notification_list.length == 0
                                        ? CircleAvatar(
                                            child: Icon(
                                              Icons.notifications_none,
                                              color: Colors.white,
                                              size: 35,
                                            ),
                                            backgroundColor: Color(0xffFF999A),
                                            radius: 25,
                                          )
                                        : CircleAvatar(
                                            child: Badge(
                                                badgeContent: Text(
                                                  notification_list.length
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                child: Icon(
                                                  Icons.notifications_none,
                                                  color: Colors.white,
                                                  size: 35,
                                                )),
                                            backgroundColor: Color(0xffFF999A),
                                            radius: 25,
                                          )),
                              )
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffF5FBFC),
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
                              // padding change
                              width: 370,

                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Form(
                                  key: _key,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.check_circle_outline,
                                              size: 50,
                                              color: Color(0xff41B4C7),
                                            ),
                                          )
                                        ],
                                      ),
                                      Stack(children: [
                                        ClipOval(
                                          child: Image.network(
                                            Image_url,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        // CircleAvatar(
                                        //   radius: 50,
                                        //   backgroundColor: Colors.white,
                                        //   child: Image(
                                        //     image:
                                        //         NetworkImage(Image_url),
                                        //     fit: BoxFit.cover,
                                        //   ),
                                        // ),
                                        Positioned(
                                            top: 60,
                                            left: 60,
                                            child: InkWell(
                                              onTap: () {
                                                chooseFile();
                                              },
                                              child: CircleAvatar(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                                backgroundColor:
                                                    Color(0xff41B4C7),
                                              ),
                                            )),
                                      ]),
                                      Text(
                                        'Mon Profil',
                                        style: GoogleFonts.dMSerifText(
                                            fontSize: 28,
                                            color: Color(0xff1C191B),
                                            letterSpacing: 1),
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            if (_key.currentState.validate()) {
                                              setState(() {
                                                asyncpressed = true;
                                              });

                                              if (userdata.Total_duration !=
                                                  Total_duration) {
                                                dynamic result =
                                                    await DatabaseService(
                                                            uid: uid_constant)
                                                        .UpdateUserData(
                                                            F_Name,
                                                            L_Name,
                                                            Age,
                                                            Sex,
                                                            Device,
                                                            Allergies,
                                                            Doctor_address,
                                                            Dentist_address,
                                                            Blood_type,
                                                            Frequency,
                                                            Total_duration,
                                                            Instructions,
                                                            Image_url);

                                                final snapShot =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('UserData')
                                                        .doc(uid_constant)
                                                        .collection('Points')
                                                        .get();
                                                final snapShot2 =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('UserData')
                                                        .doc(uid_constant)
                                                        .collection(
                                                            'CheckPoints')
                                                        .get();
                                                final snapShot3 =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('ImageGrid')
                                                        .doc(uid_constant)
                                                        .collection(
                                                            'CheckPoints')
                                                        .get();

                                                if (snapShot.docs.length != 0 &&
                                                    snapShot2.docs.length !=
                                                        0) {
                                                  FirebaseFirestore.instance
                                                      .collection('UserData')
                                                      .doc(uid_constant)
                                                      .collection('Points')
                                                      .get()
                                                      .then((snapshot) {
                                                    for (DocumentSnapshot ds
                                                        in snapshot.docs) {
                                                      ds.reference.delete();
                                                    }
                                                  });

                                                  FirebaseFirestore.instance
                                                      .collection('UserData')
                                                      .doc(uid_constant)
                                                      .collection('CheckPoints')
                                                      .get()
                                                      .then((snapshot) {
                                                    for (DocumentSnapshot ds
                                                        in snapshot.docs) {
                                                      ds.reference.delete();
                                                    }
                                                  });
                                                }
// one for removed and made into one
                                                for (int i = 1;
                                                    i <= Total_duration;
                                                    i++) {
                                                  DatabaseService(
                                                          uid: uid_constant)
                                                      .UpdatePoints(0, 0, 0, 0,
                                                          0, 0, 0, 0, 0, 0);

                                                  // this command was in an other for loop
                                                  DatabaseService(
                                                          uid: uid_constant)
                                                      .UpdateCheckPoint(' ',
                                                          ' ', ' ', ' ', ' ');
                                                }

                                                if (snapShot3.docs.length ==
                                                    0) {
                                                  await DatabaseService(
                                                          uid: uid_constant)
                                                      .UpdateImageList(image);
                                                }
                                              }
//-------------------------------------------

                                              else if (userdata
                                                      .Total_duration ==
                                                  Total_duration) {
                                                dynamic result =
                                                    await DatabaseService(
                                                            uid: uid_constant)
                                                        .UpdateUserData(
                                                            F_Name,
                                                            L_Name,
                                                            Age,
                                                            Sex,
                                                            Device,
                                                            Allergies,
                                                            Doctor_address,
                                                            Dentist_address,
                                                            Blood_type,
                                                            Frequency,
                                                            Total_duration,
                                                            Instructions,
                                                            Image_url);
                                              }

                                              //------------------------------------------------
                                              setState(() {
                                                asyncpressed = false;
                                              });

                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              LoadingScreen()));
                                            }
                                          },
                                          child: Image.asset(
                                              'assets/first_pro_btn.png')),
                                      Row(
                                        children: [
                                          Text("   " + First_name_data,
                                              style: GoogleFonts.heebo(
                                                  color: Color(0xff969696),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                            validator: (val) => val.length < 1
                                                ? 'Veuillez remplir ce champ'
                                                : null,
                                            onChanged: (val) {
                                              setState(() {
                                                F_Name = val;
                                              });
                                            },
                                            initialValue: userdata.F_Name.trim(),
                                            style: GoogleFonts.dMSerifText(
                                              color: Color(0xff41B4C7),
                                              fontSize: 23,
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: Color(0xffF5FBFC),
                                              filled: true,
                                              labelStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xff41B4C7)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text("   " +Last_name_data,
                                              style:GoogleFonts.heebo(
                                          color: Color(0xff969696),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                            validator: (val) => val.length < 1
                                                ? 'Veuillez remplir ce champ'
                                                : null,
                                            obscureText: false,
                                            onChanged: (val) {
                                              setState(() {
                                                L_Name = val;
                                              });
                                            },
                                            initialValue: userdata.L_Name.trim(),
                                            style: GoogleFonts.dMSerifText(
                                              color: Color(0xff41B4C7),
                                              fontSize: 23,
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: Color(0xffF5FBFC),
                                              filled: true,
                                              labelStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xff41B4C7)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text("   " +Age_data,
                                              style: GoogleFonts.heebo(
                                                  color: Color(0xff969696),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                            validator: (val) => val.isEmpty
                                                ? 'Veuillez remplir ce champ'
                                                : null,
                                            keyboardType: TextInputType.number,
                                            obscureText: false,
                                            onChanged: (val) {
                                              setState(() {
                                                Age = val;
                                              });
                                            },
                                            initialValue: userdata.Age.trim(),
                                            style: GoogleFonts.dMSerifText(
                                              color: Color(0xff41B4C7),
                                              fontSize: 23,
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: Color(0xffF5FBFC),
                                              filled: true,
                                              labelStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xff41B4C7)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text("   " +Sex_data,
                                              style: GoogleFonts.heebo(
                                                  color: Color(0xff969696),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                            validator: (val) => val.length < 2
                                                ? 'Veuillez remplir ce champ'
                                                : null,
                                            obscureText: false,
                                            onChanged: (val) {
                                              setState(() {
                                                Sex = val;
                                              });
                                            },
                                            initialValue: userdata.Sex.trim(),
                                            style: GoogleFonts.dMSerifText(
                                              color: Color(0xff41B4C7),
                                              fontSize: 23,
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: Color(0xffF5FBFC),
                                              filled: true,
                                              labelStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xff41B4C7)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text("   " +"Type d'appareil sélectionné",
                                              style: GoogleFonts.heebo(
                                                  color: Color(0xff969696),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Container(
                                          height:
                                              _isExpanded == false ? 60 : 332,
                                          width: 371,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff41B4C7)),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
                                                  bottomLeft:
                                                      Radius.circular(20.0))),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      child: Center(
                                                        child: Text(
                                                          Device,
                                                          style: GoogleFonts
                                                              .dMSerifText(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            _isExpanded =
                                                                !_isExpanded;
                                                          });
                                                        },
                                                        child: Icon(
                                                          _isExpanded == false
                                                              ? Icons
                                                                  .arrow_downward
                                                              : Icons
                                                                  .arrow_upward,
                                                          color:
                                                              Color(0xff41B4C7),
                                                          size: 30,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: _isExpanded == false
                                                    ? 0
                                                    : 277,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Device = 'Sagittal';
                                                          _isExpanded = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Sagittal',
                                                              style: GoogleFonts
                                                                  .dMSerifText(
                                                                      color: Color(
                                                                          0xff41B4C7),
                                                                      fontSize:
                                                                          25),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Device = 'Schwartz';
                                                          _isExpanded = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Schwartz',
                                                              style: GoogleFonts
                                                                  .dMSerifText(
                                                                      color: Color(
                                                                          0xff41B4C7),
                                                                      fontSize:
                                                                          25),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Device =
                                                              'Split Plate';
                                                          _isExpanded = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text('Split Plate',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Device = 'Bionator';
                                                          _isExpanded = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text("   " +'Bionator',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Device = 'Twin Block';
                                                          _isExpanded = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text("   " +'Twin Block',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text("   " +Dentist_address_data,
                                              style: GoogleFonts.heebo(
                                                  color: Color(0xff969696),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                            validator: (val) => val.length < 2
                                                ? 'Veuillez remplir ce champ'
                                                : null,
                                            obscureText: false,
                                            onChanged: (val) {
                                              setState(() {
                                                Dentist_address = val;
                                              });
                                            },
                                            initialValue:
                                                userdata.Dentist_address.trim(),
                                            style: GoogleFonts.dMSerifText(
                                              color: Color(0xff41B4C7),
                                              fontSize: 23,
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: Color(0xffF5FBFC),
                                              filled: true,
                                              labelStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xff41B4C7)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text("   " +Doctor_address_data,
                                            style: GoogleFonts.heebo(
                                                color: Color(0xff969696),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                            validator: (val) => val.length < 2
                                                ? 'Veuillez remplir ce champ'
                                                : null,
                                            obscureText: false,
                                            onChanged: (val) {
                                              setState(() {
                                                Doctor_address = val;
                                              });
                                            },
                                            initialValue: userdata.Doctor_address.trim(),
                                            style: GoogleFonts.dMSerifText(
                                              color: Color(0xff41B4C7),
                                              fontSize: 23,
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: Color(0xffF5FBFC),
                                              filled: true,
                                              labelStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xff41B4C7)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text("   " +Allergies_data,
                                              style: GoogleFonts.heebo(
                                                  color: Color(0xff969696),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                            validator: (val) => val.length < 2
                                                ? 'Veuillez remplir ce champ'
                                                : null,
                                            obscureText: false,
                                            onChanged: (val) {
                                              setState(() {
                                                Allergies = val;
                                              });
                                            },
                                            initialValue: userdata.Allergies.trim(),
                                            style: GoogleFonts.dMSerifText(
                                              color: Color(0xff41B4C7),
                                              fontSize: 23,
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: Color(0xffF5FBFC),
                                              filled: true,
                                              labelStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xff41B4C7)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text("   " +"Groupe sanguin",
                                              style: GoogleFonts.heebo(
                                                  color: Color(0xff969696),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Container(
                                          height:
                                              _isExpanded2 == false ? 60 : 554,
                                          width: 371,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff41B4C7)),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
                                                  bottomLeft:
                                                      Radius.circular(20.0))),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      child: Center(
                                                        child: Text(
                                                          Blood_type,
                                                          style: GoogleFonts
                                                              .dMSerifText(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            _isExpanded2 =
                                                                !_isExpanded2;
                                                          });
                                                        },
                                                        child: Icon(
                                                          _isExpanded2 == false
                                                              ? Icons
                                                                  .arrow_downward
                                                              : Icons
                                                                  .arrow_upward,
                                                          color:
                                                              Color(0xff41B4C7),
                                                          size: 30,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: _isExpanded2 == false
                                                    ? 0
                                                    : 499,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Blood_type = 'O-';
                                                          _isExpanded2 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'O-',
                                                              style: GoogleFonts
                                                                  .dMSerifText(
                                                                      color: Color(
                                                                          0xff41B4C7),
                                                                      fontSize:
                                                                          25),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Blood_type = 'O+';
                                                          _isExpanded2 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'O+',
                                                              style: GoogleFonts
                                                                  .dMSerifText(
                                                                      color: Color(
                                                                          0xff41B4C7),
                                                                      fontSize:
                                                                          25),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Blood_type = 'A-';
                                                          _isExpanded2 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text('A-',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Blood_type = 'A+';
                                                          _isExpanded2 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text('A+',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Blood_type = 'B-';
                                                          _isExpanded2 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text('B-',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Blood_type = 'B+';
                                                          _isExpanded2 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text('B+',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Blood_type = 'AB-';
                                                          _isExpanded2 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text('AB-',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Blood_type = 'AB+';
                                                          _isExpanded2 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text('AB+',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Blood_type =
                                                              'Unknown';
                                                          _isExpanded2 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text('UnKnown',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                                "   " +"Choisir la fréquence de l’activation de la vis",

                                                style: GoogleFonts.heebo(
                                                    color: Color(0xff969696),
                                                    fontSize: 15,

                                                    fontWeight: FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Container(
                                          height:
                                              _isExpanded3 == false ? 60 : 277,
                                          width: 371,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff41B4C7)),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
                                                  bottomLeft:
                                                      Radius.circular(20.0))),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      child: Center(
                                                        child: Text(
                                                          Frequency,
                                                          style: GoogleFonts
                                                              .dMSerifText(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            _isExpanded3 =
                                                                !_isExpanded3;
                                                          });
                                                        },
                                                        child: Icon(
                                                          _isExpanded3 == false
                                                              ? Icons
                                                                  .arrow_downward
                                                              : Icons
                                                                  .arrow_upward,
                                                          color:
                                                              Color(0xff41B4C7),
                                                          size: 30,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: _isExpanded3 == false
                                                    ? 0
                                                    : 222,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Frequency =
                                                              '1x / jour';
                                                          _isExpanded3 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              '1x / jour',
                                                              style: GoogleFonts
                                                                  .dMSerifText(
                                                                      color: Color(
                                                                          0xff41B4C7),
                                                                      fontSize:
                                                                          25),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Frequency =
                                                              '3x /Jour';
                                                          _isExpanded3 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              '3x /Jour',
                                                              style: GoogleFonts
                                                                  .dMSerifText(
                                                                      color: Color(
                                                                          0xff41B4C7),
                                                                      fontSize:
                                                                          25),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Frequency =
                                                              '1x /Semaine';
                                                          _isExpanded3 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text('x /Semaine',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 400,
                                                      color: Color(0xff41B4C7),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          Frequency =
                                                              '2x /Semaine';
                                                          _isExpanded3 = false;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text('2x /Semaine',
                                                                style: GoogleFonts
                                                                    .dMSerifText(
                                                                        color: Color(
                                                                            0xff41B4C7),
                                                                        fontSize:
                                                                            25))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text("   " +Total_duration_data,

                                                style: GoogleFonts.heebo(
                                                    color: Color(0xff969696),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                            validator: (val) => val == '0'
                                                ? 'La durée doit être supérieure à 0'
                                                : null,
                                            obscureText: false,
                                            keyboardType: TextInputType.number,
                                            onChanged: (val) {
                                              setState(() {
                                                Total_duration = int.parse(val);
                                              });
                                            },
                                            initialValue: userdata.Total_duration
                                                .toString().trim(),
                                            style: GoogleFonts.dMSerifText(
                                              color: Color(0xff41B4C7),
                                              fontSize: 23,
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: Color(0xffF5FBFC),
                                              filled: true,
                                              labelStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xff41B4C7)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text("   " +
                                                'Instructions spéciales du dentiste',

                                                style: GoogleFonts.heebo(
                                                    color: Color(0xff969696),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                            validator: (val) => val.length < 2
                                                ? 'Veuillez remplir ce champ'
                                                : null,
                                            obscureText: false,
                                            onChanged: (val) {
                                              setState(() {
                                                Instructions = val;
                                              });
                                            },
                                            initialValue: userdata.Instructions.trim(),
                                            style: GoogleFonts.dMSerifText(
                                              color: Color(0xff41B4C7),
                                              fontSize: 23,
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: Color(0xffF5FBFC),
                                              filled: true,
                                              labelStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xff41B4C7)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      GestureDetector(
                                          onTap: () async {
                                            if (_key.currentState.validate()) {
                                              setState(() {
                                                asyncpressed = true;
                                              });

                                              if (userdata.Total_duration !=
                                                  Total_duration) {
                                                dynamic result =
                                                    await DatabaseService(
                                                            uid: uid_constant)
                                                        .UpdateUserData(
                                                            F_Name,
                                                            L_Name,
                                                            Age,
                                                            Sex,
                                                            Device,
                                                            Allergies,
                                                            Doctor_address,
                                                            Dentist_address,
                                                            Blood_type,
                                                            Frequency,
                                                            Total_duration,
                                                            Instructions,
                                                            Image_url);

                                                final snapShot =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('UserData')
                                                        .doc(uid_constant)
                                                        .collection('Points')
                                                        .get();
                                                final snapShot2 =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('UserData')
                                                        .doc(uid_constant)
                                                        .collection(
                                                            'CheckPoints')
                                                        .get();
                                                final snapShot3 =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('ImageGrid')
                                                        .doc(uid_constant)
                                                        .collection(
                                                            'CheckPoints')
                                                        .get();

                                                if (snapShot.docs.length != 0 &&
                                                    snapShot2.docs.length !=
                                                        0) {
                                                  FirebaseFirestore.instance
                                                      .collection('UserData')
                                                      .doc(uid_constant)
                                                      .collection('Points')
                                                      .get()
                                                      .then((snapshot) {
                                                    for (DocumentSnapshot ds
                                                        in snapshot.docs) {
                                                      ds.reference.delete();
                                                    }
                                                  });

                                                  FirebaseFirestore.instance
                                                      .collection('UserData')
                                                      .doc(uid_constant)
                                                      .collection('CheckPoints')
                                                      .get()
                                                      .then((snapshot) {
                                                    for (DocumentSnapshot ds
                                                        in snapshot.docs) {
                                                      ds.reference.delete();
                                                    }
                                                  });
                                                }
// one for removed and made into one
                                                for (int i = 1;
                                                    i <= Total_duration;
                                                    i++) {
                                                  DatabaseService(
                                                          uid: uid_constant)
                                                      .UpdatePoints(0, 0, 0, 0,
                                                          0, 0, 0, 0, 0, 0);

                                                  // this command was in an other for loop
                                                  DatabaseService(
                                                          uid: uid_constant)
                                                      .UpdateCheckPoint(' ',
                                                          ' ', ' ', ' ', ' ');
                                                }

                                                if (snapShot3.docs.length ==
                                                    0) {
                                                  await DatabaseService(
                                                          uid: uid_constant)
                                                      .UpdateImageList(image);
                                                }
                                              }
//-------------------------------------------

                                              else if (userdata
                                                      .Total_duration ==
                                                  Total_duration) {
                                                dynamic result =
                                                    await DatabaseService(
                                                            uid: uid_constant)
                                                        .UpdateUserData(
                                                            F_Name,
                                                            L_Name,
                                                            Age,
                                                            Sex,
                                                            Device,
                                                            Allergies,
                                                            Doctor_address,
                                                            Dentist_address,
                                                            Blood_type,
                                                            Frequency,
                                                            Total_duration,
                                                            Instructions,
                                                            Image_url);
                                              }

                                              //------------------------------------------------
                                              setState(() {
                                                asyncpressed = false;
                                              });

                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              LoadingScreen()));
                                            }
                                          },
                                          child: Image.asset(
                                              'assets/first_pro_btn.png'))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )));
        });
  }
}
