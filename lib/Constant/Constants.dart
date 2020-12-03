import 'package:flutter/material.dart';

const input_text_decoration_variable_for_non_focus= OutlineInputBorder(
    borderRadius: const BorderRadius.all(
        const Radius.circular(15.0),
    ),
    borderSide: BorderSide(
        color: Color(0xffe1f5fe), width: 2.0
    ));

const input_text_decoration_variable_for_focus= OutlineInputBorder(
    borderRadius: const BorderRadius.all(
        const Radius.circular(15.0),
    ),
    borderSide: BorderSide(
        color: Color(0xff41B4C7), width: 2.0
    ));
bool tapped=false;

int index_nav=0;

String uid_constant='';
int Day_Count=1;
int documents_lenght;
String F_Name=' ';
String L_Name=' ';
String Image_url='gs://laboratoire-bellomo.appspot.com/propic.png';
