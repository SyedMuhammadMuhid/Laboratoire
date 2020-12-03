import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Models/Points_Model.dart';
import 'package:sample_screen/Models/User_Data_Model.dart';
class DatabaseService{
final String uid;
DatabaseService({this.uid});
  //collection services

  final CollectionReference _collectionReference_userdata= FirebaseFirestore.instance.collection('UserData');
  final CollectionReference _collectionReference_points= FirebaseFirestore.instance.collection('UserData').doc(uid_constant).collection('Points');

  Future UpdateUserData(String F_Name, String L_Name, String Age, String Sex, String Device, String Allergies, String Doctor_address, String Dentist_address, String Blood_type, String Frequency, String Total_duration, String Instructions,String Image_url)
  async{
    try{
  return await _collectionReference_userdata.doc(uid).set({
    'F_Name':F_Name,
    'L_Name':L_Name,
    'Age':Age,
    'Sex':Sex,
    'Device':Device,
    'Allergies':Allergies,
    'Doctor_address':Doctor_address,
    'Dentist_address':Dentist_address,
    'Blood_type':Blood_type,
    'Frequency': Frequency,
    'Total_duration':Total_duration,
    'Instructions':Instructions,
    'Image_url': Image_url

  });}catch(e){
      return null;
    }
  }


  //stream for getting data

UserData _userDatafromSnapshot(DocumentSnapshot snapshot) {

  return UserData(
    F_Name: snapshot.data()['F_Name'],
    L_Name: snapshot.data()['L_Name'],
    Age: snapshot.data()['Age'],
    Sex: snapshot.data()['Sex'],
    Device: snapshot.data()['Device'],
    Allergies: snapshot.data()['Allergies'],
    Blood_type: snapshot.data()['Blood_type'],
    Dentist_address: snapshot.data()['Dentist_address'],
    Doctor_address: snapshot.data()['Doctor_address'],
    Instructions: snapshot.data()['Instructions'],
    Image_url: snapshot.data()['Image_url'],
    Total_duration: snapshot.data()['Total_duration'],
    Frequency: snapshot.data()['Frequency'],
  );

}
// user data stream to pre occupy the edit form and then edit and detect changes
  Stream<UserData> get userData{

    return _collectionReference_userdata.doc(uid).snapshots()
        .map(_userDatafromSnapshot);
  }

  Future UpdatePoints(int todo1,int todo2,int todo3,int todo4,int todo5,int todo6,int todo7,int todo8, String todopoint_name)async{

    try{
      return await _collectionReference_points.doc(todopoint_name).set({
        "ToDo1":todo1,
        "ToDo2":todo2,
        "ToDo3":todo3,
        "ToDo4":todo4,
        "ToDo5":todo5,
        "ToDo6":todo6,
        "ToDo7":todo7,
        "ToDo8":todo8,

      });

    }catch(e){
      return null;
    }



  }

  PointData _userPointsfromSnapshot(DocumentSnapshot snapshot) {

    return PointData(
     todo1: snapshot.data()['ToDo1'],
     todo2: snapshot.data()['ToDo2'],
     todo3: snapshot.data()['ToDo3'],
     todo4: snapshot.data()['ToDo4'],
     todo5: snapshot.data()['ToDo5'],
     todo6: snapshot.data()['ToDo6'],
     todo7: snapshot.data()['ToDo7'],
     todo8: snapshot.data()['ToDo8'],

    );

  }
  Stream<PointData> get userPoints{

    return _collectionReference_points.doc().snapshots()
        .map(_userPointsfromSnapshot);
  }

}