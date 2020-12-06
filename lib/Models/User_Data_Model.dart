import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class UserData{

  String F_Name;
  String L_Name;
  String Age;
  String Sex;
  String Device;
  String Allergies;
  String Doctor_address;
  String Dentist_address;
  String Blood_type;
  String Frequency;
  int Total_duration;
  String Instructions;
  String Image_url;
  Timestamp Start_date;
  Timestamp End_date;
  UserData({this.F_Name,this.L_Name,this.Age, this.Sex,this.Device,this.Allergies,this.Doctor_address,this.Dentist_address,this.Blood_type,this.Frequency,this.Total_duration,this.Instructions,this.Image_url,this.Start_date,this.End_date});
}