import 'package:flutter/material.dart';
import 'package:sample_screen/Models/PerformancesModel.dart';
import 'package:sample_screen/Models/events_data_model.dart';
import 'package:sample_screen/Models/profile_list_model.dart';

List Pain=['Gum pain', 'Toothache', 'Headaches', 'Injuries','Sensitive Teeth'];
List Self_con=['At the top', "I'm fine", 'Not famous','Bad'];
List Sleep=['0 to 3 hours', '3 to 6 hours', '6 to 9 hours', '9 hours +'];
List Locution=['Difficulty in articulation', 'Lisping (speaking on the tip of the tongue)', 'Accumulation of saliva (wettermouth)'];
List Mechanism=['Forgetting to activate', 'Breakage of the device'];

List Days=['Jour 1', 'Jour 2', 'Jour 3'];
List Date=['23', '24','25'];

List profile_items=[ProfileListModel(name:'Actions', image_path: 'assets/actions_logo.png'), ProfileListModel(name:'Calendar', image_path: 'assets/calander_logo.png'),ProfileListModel(name:'Evolution', image_path: 'assets/evaluation_logo.png'),ProfileListModel(name:'Performances', image_path: 'assets/performance_logo.png'),ProfileListModel(name:'Notifications', image_path: 'assets/notification_logo.png'),ProfileListModel(name:'Tips', image_path: 'assets/tips_logo.png'),ProfileListModel(name:'Help Page', image_path: 'assets/help_logo.png'),ProfileListModel(name:'Rate the app', image_path: 'assets/rate_logo.png')];
List Events_data=[EventsDataModel(name: 'Dentist Appointment', date: '16 Oct',note: "its a reminder"),EventsDataModel(name: 'Activate the Screw', date: '24 Oct',note: 'its at 5 o clock'), EventsDataModel(name: 'Dentist Appointment', date: '29 Oct', note: 'no special notes'),EventsDataModel(name: 'Dentist Appointment', date: '30 Oct',note: 'be there on time, thanks')];
List images=['assets/propic.png','assets/propic.png','assets/propic.png','assets/propic.png','assets/propic.png','assets/propic.png','assets/propic.png','assets/propic.png'];
List performance_list=[PerformancesModel(data: 'Cleaning the appliance after breakfast',logo: 'assets/blue_medal.png'),PerformancesModel(data: 'Cleaning the appliance after lunch',logo: 'assets/blue_medal.png'),PerformancesModel(data: 'Cleaning the appliance after dinner',logo: 'assets/white_medal.png'),PerformancesModel(data: 'Exercise of speaking while biting\nthe device',logo: 'assets/gray_medal.png'),PerformancesModel(data: 'Wearing the device at night',logo: 'assets/blue_medal.png'),PerformancesModel(data: 'Number of hours per day the device\nis worn',logo: 'assets/white_medal.png')];
List notification_list=['Au-s tu Active la vis?', 'As-tu nettoye ton appareil\napres ton dejeuner?'];