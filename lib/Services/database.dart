import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Models/User_Data_Model.dart';
class DatabaseService{
final String uid;
DatabaseService({this.uid});
  //collection services

  final CollectionReference _collectionReference_userdata= FirebaseFirestore.instance.collection('UserData');
  final CollectionReference _collectionReference_points= FirebaseFirestore.instance.collection('UserData').doc(uid_constant).collection('Points');
  final CollectionReference _collectionReference_checkpoints= FirebaseFirestore.instance.collection('UserData').doc(uid_constant).collection('CheckPoints');
final CollectionReference _collectionReference_imagegrid= FirebaseFirestore.instance.collection('UserData').doc(uid_constant).collection('ImageGrid');
final CollectionReference _collectionReference_events= FirebaseFirestore.instance.collection('UserData').doc(uid_constant).collection('Events');


Future UpdateUserData(String F_Name, String L_Name, String Age, String Sex, String Device, String Allergies, String Doctor_address, String Dentist_address, String Blood_type, String Frequency, int Total_duration, String Instructions,String Image_url)
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
    'Image_url': Image_url,
    'Start_date': DateTime.now(),
    'End_date':DateTime.now().add(Duration(days: Total_duration))

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
    Start_date: snapshot.data()['Start_date'],
    End_date: snapshot.data()['End_date']
  );

}
// user data stream to pre occupy the edit form and then edit and detect changes
  Stream<UserData> get userData{

    return _collectionReference_userdata.doc(uid).snapshots()
        .map(_userDatafromSnapshot);
  }

  Future UpdatePoints(int todo1,int todo2,int todo3,int todo4,int todo5,int todo6,int todo7,int todo8,int total_points, int hour_points)async{

    try{

      return await _collectionReference_points.doc().set({
        "ToDo1":todo1,
        "ToDo2":todo2,
        "ToDo3":todo3,
        "ToDo4":todo4,
        "ToDo5":todo5,
        "ToDo6":todo6,
        "ToDo7":todo7,
        "ToDo8":todo8,
        "HourPoints":hour_points,
        "TotalPoints":total_points,

      });

    }catch(e){
      return null;
    }



  }


  Future UpdatePointsSingleUpdate(int index_of_todo,String index_of_day, int value)async{

index_of_todo=index_of_todo+1;

    try{
      return await _collectionReference_points.doc(index_of_day).update({
        'ToDo$index_of_todo':value
      });

    }catch(e){
      return null;
    }



  }
  Future UpdatePointsTotal(String name_of_entry,String index_of_day, int value)async{
    try{
      return await _collectionReference_points.doc(index_of_day).update({
        '$name_of_entry':value
      });

    }catch(e){
      return null;
    }





  }

Future UpdateCheckPoint(String pain, String self_confidence, String sleep, String locution, String mechanism)async{
  try{


    return await _collectionReference_checkpoints.doc().set({
      'Pain':pain,
      'Self_confidence':self_confidence,
      'Sleep':sleep,
      'Locution': locution,
      'Mechanisc':mechanism

    });
  }catch(e){
    return null;
  }

}

  Future UpdateCheckSingle(String name_of_checkbox,String index_of_day, String name_of_entry)async{
    try{
      return await _collectionReference_checkpoints.doc(index_of_day).update({
        '$name_of_entry':name_of_checkbox
      });

    }catch(e){
      return null;
    }


  }


  Future UpdateImageList(List image)async{
    try{
      return await _collectionReference_imagegrid.doc().set({
        'ImageList':image
      });
    }catch(e){
      return null;
    }

  }
  Future UpdateImageListSingle(String document_id, List image)async{
  print(image.toString()+" This is he list");
  print(document_id+" thid id the document id fron the database class");

    try{
      return await _collectionReference_imagegrid.doc(document_id).update({
        'ImageList':image
      });

    }catch(e){
      return null;
    }


  }


  Future UpdateEvents(String Event_name, String Place, bool All_day, DateTime Start_date, DateTime End_date)async {
    try {
      return await _collectionReference_events.doc().set({
        "EventName": Event_name,
        "Place": Place,
        "AllDayEvent": All_day,
        "StartDate": Start_date,
        "EndDate": End_date
      });
    } catch (e) {
      return null;
    }
  }
  Future UpdateDeleteEvent(String document_id)async{

    try{
      return await _collectionReference_events.doc(document_id).delete();
    }catch(e){
      return null;
    }


  }


  }