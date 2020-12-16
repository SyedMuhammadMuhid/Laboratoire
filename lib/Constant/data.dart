import 'package:flutter/material.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Models/PerformancesModel.dart';
import 'package:sample_screen/Models/events_data_model.dart';
import 'package:sample_screen/Models/profile_list_model.dart';
import 'package:sample_screen/Screens/Home.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/Screens/Tips_Screen.dart';


List Pain = [
  'Douleur aux gencives',
  'Mal aux dents',
  'Maux de tête',
  'Blessures',
  'Dents sensibles'
];
List Self_con = ['au sommet', "Je vais bien", 'Pas fameux', 'Bad'];
List Sleep = ['0 à 3 heures', '3 à 6 heures', '6 à 9 heures', '9 heures +'];
List Locution = [
  'Difficulté à articuler',
  'Lisping (parlant sur le bout de la langue)',
  'Accumulation de salive (bouche plus humide)'
];
List Mechanism = ["Oublier d'activer", "Rupture de l'appareil"];
List To_do = [
  "J'ai porté mon appareil\ntoute la nuit",
  "Nettoyer mon appareil après\nle petit déjeuner",
  "Nettoyer mon appareil après\nle déjeuner",
  "Parler en mordant dans\nl'appareil",
  "Nettoyer mon appareil après\nle dîner",
  "Activation de la vis",
  "Rincer la bouche avec du\nfluor tous les jours",
  "Nombre d'heures que j'ai\nporté mon appareilaujourd'hui,\ny compris la nuit dernière"
];
String Congrats_Statement = 'Bravo! ';
String Todo_Statement = 'Faire: ';
String Oops_Statement = 'Oups! ';



// Do not change these to french, as these are the defined names used in Database
List ToDo_number=['ToDo1','ToDo2','ToDo3','ToDo4','ToDo5','ToDo6','ToDo7','ToDo8'];
List ToDo_and_total_values=['ToDo1','ToDo2','ToDo3','ToDo4','ToDo5','ToDo6','ToDo7','ToDo8',"HourPoints"];

//---------------

List profile_items = [
  ProfileListModel(
      name: 'Actions', image_path: 'assets/actions_logo.png', screen: Home()),
  ProfileListModel(
      name: 'Calendrier', image_path: 'assets/calander_logo.png', screen: Home()),
  ProfileListModel(
      name: 'Évolution',
      image_path: 'assets/evaluation_logo.png',
      screen: Home()),
  ProfileListModel(
      name: 'Les performances',
      image_path: 'assets/performance_logo.png',
      screen: Home()),
  ProfileListModel(
      name: 'Notifications',
      image_path: 'assets/notification_logo.png',
      screen: NotificationScreen()),
  ProfileListModel(
      name: 'Conseils', image_path: 'assets/tips_logo.png', screen: TipsScreen()),
  ProfileListModel(
      name: "Page d'aide",
      image_path: 'assets/help_logo.png',
      screen: TipsScreen()),
  ProfileListModel(
      name: "Évaluer l'application",
      image_path: 'assets/rate_logo.png',
      screen: TipsScreen())
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
      data: "Nettoyage de l'appareil après\nle petit déjeuner",
      logo: 'assets/blue_medal.png'),
  PerformancesModel(
      data: "Nettoyage de l'appareil après\nle déjeuner",
      logo: 'assets/blue_medal.png'),
  PerformancesModel(
      data: "Nettoyage de l'appareil après\nle dîner",
      logo: 'assets/white_medal.png'),
  PerformancesModel(
      data: "Exercice de parler en mordant\nl'appareil",
      logo: 'assets/gray_medal.png'),
  PerformancesModel(
      data: "Porter l'appareil la nuit",
      logo: 'assets/blue_medal.png'),
  PerformancesModel(
      data: "Nombre d'heures par jour pendant\nlesquelles l'appareil est porté",
      logo: 'assets/white_medal.png')
];
List notification_list = [
  'Rappel de vous rincer la bouche avec du fluor tous les jours',
  'Avez-vous porté votre appareil hier soir?',
  'Avez-vous nettoyé votre appareil après votre petit-déjeuner?',
  'As-tu nettoyé ton appareil dentaire après le déjeuner?',
  'Avez-vous nettoyé votre appareil dentaire après le dîner?',
  'Avez-vous parlé en mordant votre appareil?',
  'Avez-vous activé la vis?',
  "Combien d'heures avez-vous porté votre appareil dentaire aujourd'hui, y compris hier soir?",

];

List notification_timing=['7:00 AM','8:00 AM','9:00 AM','1:00 PM','7:00 PM', '8:00 PM', '9:00 PM','9:00 PM'];

String Actions_Data='Actions';
String Name_of_the_event_data="Nom de l'événement";
String Place_data='Endroit';
String All_day_event_data="Événement d'une journée";
String Start_date_data="Date de début:";
String End_date_data="Date de fin:";
String Event_data="Événements";
String First_name_data="Prénom";
String Last_name_data="Nom de famille";
String Age_data="Âge";
String Sex_data="Sexe";
String Dentist_address_data="Coordonnées du dentiste du patient";
String Doctor_address_data="Coordonnées du médecin du patient";
String Allergies_data="Allergies";
String Total_duration_data="Durée totale du traitement'";
String Instructions_data="Instruction du dentiste";
String Toast_wrong_data="Mauvais e-mail / mot de passe";
String Creat_an_account_data="Créer un compte";
String Toast_pass_dont_match_data="Les mots de passe ne correspondent pas";
String App_name_data='''Laboratoire\nBellomo & Lambert''';
String First_time_data="Première fois ?";
String Login_with_this_or_that='Abonnez-vous via votre compte Facebook';
String Login_with_this_or_that2='ou votre compte Instagram';
String Email_regristration_data="Inscription par e-mail";
String Welcome_data="Bienvenue";
String Do_have_account="Avez-vous un compte?";
String Sign_up_login_data="Inscrivez-vous ou connectez-vous!";
String Pain_data="Douleur";
String Self_confidence_data="Confiance en soi";
String Sleep_data='Dormir';
String Mechanism_data='Mécanisme';
String Please_wait_data="Nous créons votre package, veuillez patienter";