import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as StorageReference;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Loading/loading.dart';
import 'package:sample_screen/Models/User_Data_Model.dart';
import 'package:sample_screen/Screens/Home.dart';
import 'package:sample_screen/Screens/Start_Screen.dart';
import 'package:sample_screen/Services/database.dart';
import 'package:path/path.dart' as Path;
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

  String Allergies;
  String Doctor_address;
  String Dentist_address;
  String Blood_type ;
  String Frequency ;
  int Total_duration;
  String Instructions;
  String Image_url='gs://laboratoire-bellomo.appspot.com/propic.png';
  int times=0;
  // a choose file function--------------

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

  StorageReference.Reference storageReference = StorageReference.FirebaseStorage.instance
        .ref()
        .child('Recent/${Path.basename(selected.path)}}');
   StorageReference.UploadTask  uploadTask = storageReference.putFile(selected);
    await uploadTask.whenComplete(() => print('File Uploaded'));
    storageReference.getDownloadURL().then((fileURL) async{
      setState(() {
        //  _uploadedFileURL = fileURL;
        // print(fileURL);

        Image_url =  fileURL;

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
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid:user.uid ).userData,
        builder: (context, snapshot) {
          UserData userdata = snapshot.data;
          if(times<1){
            F_Name=userdata.F_Name;
            L_Name=userdata.L_Name;
           Age=userdata.Age;
           Sex=userdata.Sex;
           Device=userdata.Device;
           Allergies=userdata.Allergies;
           Doctor_address=userdata.Doctor_address;
           Dentist_address=userdata.Dentist_address;
           Frequency=userdata.Frequency;
           Total_duration=userdata.Total_duration;
           Blood_type=userdata.Blood_type;
           Instructions=userdata.Instructions;
           Image_url=userdata.Image_url;}
          times++;
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
                            width: 370,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Form(
                                key: _key,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                            onTap: (){
                                              chooseFile();
                                            },
                                            child: CircleAvatar(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Color(0xff41B4C7),
                                            ),
                                          )),
                                    ]),
                                    Text(
                                      'Mon Profil',
                                      style: GoogleFonts.heebo(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                    Image.asset('assets/first_pro_btn.png'),
                                    Row(
                                      children: [
                                        Text('First Name',
                                            style: GoogleFonts.heebo(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    TextFormField(
                                        validator: (val) => val.length < 1
                                            ? 'Please Fill this Field'
                                            : null,
                                        obscureText: false,
                                        onChanged: (val) {
                                          setState(() {
                                            F_Name= val;
                                          });
                                        },
                                        initialValue: userdata.F_Name,
                                        style: TextStyle(
                                          color: Color(0xff41B4C7),
                                          fontSize: 25,
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: Color(0xffF5FBFC),
                                          filled: true,
                                          labelStyle: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xff41B4C7)),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text('Last Name',
                                            style: GoogleFonts.heebo(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    TextFormField(
                                        validator: (val) => val.length < 1
                                            ? 'Please Fill this Field'
                                            : null,
                                        obscureText: false,
                                        onChanged: (val) {
                                          setState(() {
                                            L_Name = val;
                                          });
                                        },
                                        initialValue: userdata.L_Name,
                                        style: TextStyle(
                                          color: Color(0xff41B4C7),
                                          fontSize: 25,
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: Color(0xffF5FBFC),
                                          filled: true,
                                          labelStyle: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xff41B4C7)),
                                        )),
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Text('Age',
                                            style: GoogleFonts.heebo(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    TextFormField(
                                        validator: (val) => val.length < 2
                                            ? 'Please Fill This Field'
                                            : null,
                                        obscureText: false,
                                        onChanged: (val) {
                                          setState(() {
                                            Age = val;
                                          });
                                        },
                                        initialValue: userdata.Age,
                                        style: TextStyle(
                                          color: Color(0xff41B4C7),
                                          fontSize: 25,
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: Color(0xffF5FBFC),
                                          filled: true,
                                          labelStyle: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xff41B4C7)),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text('Sex',
                                            style: GoogleFonts.heebo(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    TextFormField(
                                        validator: (val) => val.length < 2
                                            ? 'Please Fill the Field'
                                            : null,
                                        obscureText: false,
                                        onChanged: (val) {
                                          setState(() {
                                            Sex = val;
                                          });
                                        },
                                        initialValue: userdata.Sex,
                                        style: TextStyle(
                                          color: Color(0xff41B4C7),
                                          fontSize: 25,
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: Color(0xffF5FBFC),
                                          filled: true,
                                          labelStyle: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xff41B4C7)),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: _isExpanded == false ? 60 : 332,
                                      width: 371,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff41B4C7)),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                              bottomLeft:
                                                  Radius.circular(15.0))),
                                      child: SingleChildScrollView(
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      Device,
                                                      style: GoogleFonts.heebo(
                                                          color:
                                                              Color(0xff41B4C7),
                                                          fontSize: 25),
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
                                                            ? Icons.expand_more
                                                            : Icons.expand_less,
                                                        color: Colors.black54,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: _isExpanded == false
                                                  ? 0
                                                  : 332,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            Device = 'Sagittal';
                                                            _isExpanded = false;
                                                          });
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Sagittal',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff5fc9ed),
                                                                  fontSize: 25),
                                                            )
                                                          ],
                                                        )),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Device = 'Schwartz';
                                                        _isExpanded = false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Schwartz',
                                                            style:
                                                                GoogleFonts.heebo(
                                                                    color: Color(
                                                                        0xff5fc9ed),
                                                                    fontSize: 25),
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Device = 'Split Plate';
                                                        _isExpanded = false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('Split Plate',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff5fc9ed),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Device = 'Bionator';
                                                        _isExpanded = false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('Bionator',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Device = 'Twin Block';
                                                        _isExpanded = false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('Twin Block',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
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
                                        Text("Dentist's Address",
                                            style: GoogleFonts.heebo(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    TextFormField(
                                        validator: (val) => val.length < 2
                                            ? 'Please Fill This Field'
                                            : null,
                                        obscureText: false,
                                        onChanged: (val) {
                                          setState(() {
                                            Dentist_address = val;
                                          });
                                        },
                                        initialValue: userdata.Dentist_address,
                                        style: TextStyle(
                                          color: Color(0xff41B4C7),
                                          fontSize: 25,
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: Color(0xffF5FBFC),
                                          filled: true,
                                          labelStyle: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xff41B4C7)),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text("Doctor's Address",
                                            style: GoogleFonts.heebo(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    TextFormField(
                                        validator: (val) => val.length < 2
                                            ? 'Please Fill This Field'
                                            : null,
                                        obscureText: false,
                                        onChanged: (val) {
                                          setState(() {
                                            Doctor_address = val;
                                          });
                                        },
                                        initialValue: userdata.Doctor_address,
                                        style: TextStyle(
                                          color: Color(0xff41B4C7),
                                          fontSize: 25,
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: Color(0xffF5FBFC),
                                          filled: true,
                                          labelStyle: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xff41B4C7)),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text('Allergies',
                                            style: GoogleFonts.heebo(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    TextFormField(
                                        validator: (val) => val.length < 2
                                            ? 'Please Fill This Field'
                                            : null,
                                        obscureText: false,
                                        onChanged: (val) {
                                          setState(() {
                                            Allergies = val;
                                          });
                                        },
                                        initialValue: userdata.Allergies,
                                        style: TextStyle(
                                          color: Color(0xff41B4C7),
                                          fontSize: 25,
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: Color(0xffF5FBFC),
                                          filled: true,
                                          labelStyle: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xff41B4C7)),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: _isExpanded2 == false ? 60 : 550,
                                      width: 371,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff41B4C7)),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                              bottomLeft:
                                                  Radius.circular(15.0))),
                                      child: SingleChildScrollView(
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      Blood_type,
                                                      style: GoogleFonts.heebo(
                                                          color:
                                                              Color(0xff41B4C7),
                                                          fontSize: 25),
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
                                                            ? Icons.expand_more
                                                            : Icons.expand_less,
                                                        color: Colors.black54,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: _isExpanded2 == false
                                                  ? 0
                                                  : 550,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Blood_type='O-';
                                                        _isExpanded2=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'O-',
                                                            style:
                                                                GoogleFonts.heebo(
                                                                    color: Color(
                                                                        0xff41B4C7),
                                                                    fontSize: 25),
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Blood_type='O+';
                                                        _isExpanded2=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'O+',
                                                            style:
                                                                GoogleFonts.heebo(
                                                                    color: Color(
                                                                        0xff41B4C7),
                                                                    fontSize: 25),
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Blood_type='A-';
                                                        _isExpanded2=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('A-',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Blood_type='A+';
                                                        _isExpanded2=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('A+',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Blood_type='B-';
                                                        _isExpanded2=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('B-',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Blood_type='B+';
                                                        _isExpanded2=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('B+',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Blood_type='AB-';
                                                        _isExpanded2=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('AB-',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Blood_type='AB+';
                                                        _isExpanded2=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('AB+',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Blood_type='Unknown';
                                                        _isExpanded2=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('UnKnown',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
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
                                    Container(
                                      height: _isExpanded3 == false ? 60 : 277,
                                      width: 371,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff41B4C7)),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                              bottomLeft:
                                                  Radius.circular(15.0))),
                                      child: SingleChildScrollView(
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      Frequency,
                                                      style: GoogleFonts.heebo(
                                                          color:
                                                              Color(0xff41B4C7),
                                                          fontSize: 25),
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
                                                            ? Icons.expand_more
                                                            : Icons.expand_less,
                                                        color: Colors.black54,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: _isExpanded3 == false
                                                  ? 0
                                                  : 332,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Frequency='1x /Day';
                                                        _isExpanded3=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            '1x /Day',
                                                            style:
                                                                GoogleFonts.heebo(
                                                                    color: Color(
                                                                        0xff41B4C7),
                                                                    fontSize: 25),
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Frequency='3x /Day';
                                                        _isExpanded3=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            '3x /Day',
                                                            style:
                                                                GoogleFonts.heebo(
                                                                    color: Color(
                                                                        0xff41B4C7),
                                                                    fontSize: 25),
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Frequency='1x /Week';
                                                        _isExpanded3=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('1x /Week',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(onTap: (){
                                                      setState(() {
                                                        Frequency='2x /Week';
                                                        _isExpanded3=false;
                                                      });
                                                    },
                                                      child: Row(
                                                        children: [
                                                          Text('2x /Week',
                                                              style: GoogleFonts.heebo(
                                                                  color: Color(
                                                                      0xff41B4C7),
                                                                  fontSize: 25))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 400,
                                                    color: Color(0xff41B4C7),
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
                                        Text('Total Duration of Treatment',
                                            style: GoogleFonts.heebo(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    TextFormField(
                                        validator: (val) => val.length < 1
                                            ? 'Please Fill This Field'
                                            : null,
                                        obscureText: false,
                                        onChanged: (val) {
                                          setState(() {
                                            Total_duration = int.parse(val);
                                          });
                                        },
                                        initialValue: userdata.Total_duration.toString(),
                                        style: TextStyle(
                                          color: Color(0xff41B4C7),
                                          fontSize: 25,
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: Color(0xffF5FBFC),
                                          filled: true,
                                          labelStyle: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xff41B4C7)),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text('Instruction from Dentist',
                                            style: GoogleFonts.heebo(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    TextFormField(
                                        validator: (val) => val.length < 2
                                            ? 'Please Fill This Field'
                                            : null,
                                        obscureText: false,
                                        onChanged: (val) {
                                          setState(() {
                                            Instructions = val;
                                          });
                                        },
                                        initialValue: userdata.Instructions,
                                        style: TextStyle(
                                          color: Color(0xff41B4C7),
                                          fontSize: 25,
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: Color(0xffF5FBFC),
                                          filled: true,
                                          labelStyle: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xff41B4C7)),
                                        )),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    GestureDetector(
                                        onTap: () async {
                                          if (_key.currentState.validate()) {
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

                                            for(int i=1; i<=Total_duration;i++){
                                              await DatabaseService(uid: uid_constant).UpdatePoints(0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                                            }

                                            // if(Frequency=='1x /Day'){
                                            //  await DatabaseService(uid: uid_constant).UpdatePoints(0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Day 1');
                                            // }
                                            // else if(Frequency=='3x /Day'){
                                            //   for(int i=1; i<4;i++)
                                            //   {
                                            //     await DatabaseService(uid: uid_constant).UpdatePoints(0, 0, 0, 0, 0, 0, 0,0,0, 0,'Day $i');
                                            //
                                            //   }
                                            //
                                            // }
                                            // else if(Frequency=='1x /Week'){
                                            //   for(int i=1; i<8;i++)
                                            //   {
                                            //     await DatabaseService(uid: uid_constant).UpdatePoints(0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Day $i');
                                            //
                                            //   }
                                            //
                                            // }
                                            // else if(Frequency=='2x /Week'){
                                            //
                                            //   for(int i=1; i<15;i++)
                                            //     {
                                            //       await DatabaseService(uid: uid_constant).UpdatePoints(0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Day $i');
                                            //
                                            //     }
                                            //
                                            // }


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
              )));
        });
  }
}
