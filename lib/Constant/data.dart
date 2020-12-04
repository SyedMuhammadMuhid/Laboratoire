import 'package:flutter/material.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Models/PerformancesModel.dart';
import 'package:sample_screen/Models/events_data_model.dart';
import 'package:sample_screen/Models/profile_list_model.dart';
import 'package:sample_screen/Screens/Home.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/Screens/Tips_Screen.dart';
List months = ['January','February','March','April','May','June','July','August','September','October','November','December'];
DateTime now = DateTime.now();
int current_mon = now.month-1;

List Pain = [
  'Gum pain',
  'Toothache',
  'Headaches',
  'Injuries',
  'Sensitive Teeth'
];
List Self_con = ['At the top', "I'm fine", 'Not famous', 'Bad'];
List Sleep = ['0 to 3 hours', '3 to 6 hours', '6 to 9 hours', '9 hours +'];
List Locution = [
  'Difficulty in articulation',
  'Lisping (speaking on the tip of the tongue)',
  'Accumulation of saliva (wettermouth)'
];
List Mechanism = ['Forgetting to activate', 'Breakage of the device'];
List To_do = [
  "I wore my device all night long",
  "Clean my device after breakfast",
  "Clean my device after lunch",
  "Talking while biting into the device",
  "Clean my device after dinner",
  "Activation of Screw",
  "Rinse mouth with fluoride every day",
  "Number of hours I wore my device\ntoday, including last night"
];
String Congrats_Statement = 'Congratulations! ';
String Todo_Statement = 'To Do: ';
String Oops_Statement = 'Oops! ';

// List Days = [
//   'Jour 1',
//   'Jour 2',
//   'Jour 3',
//   'Jour 4',
//   'Jour 5',
//   'Jour 6',
//   'Jour 7',
//   'Jour 8',
//   'Jour 9',
//   'Jour 10',
//   'Jour 11',
//   'Jour 12',
//   'Jour 13',
//   'Jour 14'
// ];
List Days=[];
DateTime _now = DateTime.now();

// List Date = [
//   ((_now.day).toString()+' '+months[current_mon]+' '+_now.year.toString()).toString(),
//   ( (_now.day + 1).toString()+' '+months[current_mon]+' '+_now.year.toString()).toString(),
//   ((_now.day + 2).toString()+' '+months[current_mon]+' '+_now.year.toString()).toString(),
//    (_now.day + 3).toString()+' '+months[current_mon]+' '+_now.year.toString(),
//    (_now.day + 4).toString()+' '+months[current_mon]+' '+_now.year.toString(),
//    (_now.day + 5).toString()+' '+months[current_mon]+' '+_now.year.toString(),
//    (_now.day+6).toString()+' '+months[current_mon]+' '+_now.year.toString(),
//   (_now.day+7).toString()+' '+months[current_mon]+' '+_now.year.toString(),
//   (_now.day+8).toString()+' '+months[current_mon]+' '+_now.year.toString(),
//    (_now.day+9).toString()+' '+months[current_mon]+' '+_now.year.toString(),
//   (_now.day+10).toString()+' '+months[current_mon]+' '+_now.year.toString(),
//   (_now.day+11).toString()+' '+months[current_mon]+' '+_now.year.toString(),
//   (_now.day+12).toString()+' '+months[current_mon]+' '+_now.year.toString(),
//   (_now.day+13).toString()+' '+months[current_mon]+' '+_now.year.toString()
// ];
List Date=[];

List ToDo_number=['ToDo1','ToDo2','ToDo3','ToDo4','ToDo5','ToDo6','ToDo7','ToDo8'];
List ToDo_and_total_values=['ToDo1','ToDo2','ToDo3','ToDo4','ToDo5','ToDo6','ToDo7','ToDo8',"HourPoints"];

List profile_items = [
  ProfileListModel(
      name: 'Actions', image_path: 'assets/actions_logo.png', screen: Home()),
  ProfileListModel(
      name: 'Calendar', image_path: 'assets/calander_logo.png', screen: Home()),
  ProfileListModel(
      name: 'Evolution',
      image_path: 'assets/evaluation_logo.png',
      screen: Home()),
  ProfileListModel(
      name: 'Performances',
      image_path: 'assets/performance_logo.png',
      screen: Home()),
  ProfileListModel(
      name: 'Notifications',
      image_path: 'assets/notification_logo.png',
      screen: NotificationScreen()),
  ProfileListModel(
      name: 'Tips', image_path: 'assets/tips_logo.png', screen: TipsScreen()),
  ProfileListModel(
      name: 'Help Page',
      image_path: 'assets/help_logo.png',
      screen: TipsScreen()),
  ProfileListModel(
      name: 'Rate the app',
      image_path: 'assets/rate_logo.png',
      screen: TipsScreen())
];
List Events_data = [
  EventsDataModel(
      name: 'Dentist Appointment', date: '16 Oct', note: "its a reminder"),
  EventsDataModel(
      name: 'Activate the Screw', date: '24 Oct', note: 'its at 5 o clock'),
  EventsDataModel(
      name: 'Dentist Appointment', date: '29 Oct', note: 'no special notes'),
  EventsDataModel(
      name: 'Dentist Appointment',
      date: '30 Oct',
      note: 'be there on time, thanks')
];
List images = [
  'assets/propic.png',
  'assets/propic.png',
  'assets/propic.png',
  'assets/propic.png',
  'assets/propic.png',
  'assets/propic.png',
  'assets/propic.png',
  'assets/propic.png'
];
List performance_list = [
  PerformancesModel(
      data: 'Cleaning the appliance after breakfast',
      logo: 'assets/blue_medal.png'),
  PerformancesModel(
      data: 'Cleaning the appliance after lunch',
      logo: 'assets/blue_medal.png'),
  PerformancesModel(
      data: 'Cleaning the appliance after dinner',
      logo: 'assets/white_medal.png'),
  PerformancesModel(
      data: 'Exercise of speaking while biting\nthe device',
      logo: 'assets/gray_medal.png'),
  PerformancesModel(
      data: 'Wearing the device at night', logo: 'assets/blue_medal.png'),
  PerformancesModel(
      data: 'Number of hours per day the device\nis worn',
      logo: 'assets/white_medal.png')
];
List notification_list = [
  'Au-s tu Active la vis?',
  'As-tu nettoye ton appareil\napres ton dejeuner?'
];

// List total_points_constant=[0,0,0,0,0,0,0,0,0,0,0,0,0,0];
// List total_hour_points_constant=[0,0,0,0,0,0,0,0,0,0,0,0,0,0];

List total_points_constant=[];
List total_hour_points_constant=[];

void Date_and_Day_Setter(int count){
print('hamara count $count');

  for(int i=1; i<=count;i++){
     Days.add('Jour $i');
     Date.add(((_now.day+(i-1)).toString()+' '+months[current_mon]+' '+_now.year.toString()).toString());
     total_points_constant.add(0);
     total_hour_points_constant.add(0);
  }

}