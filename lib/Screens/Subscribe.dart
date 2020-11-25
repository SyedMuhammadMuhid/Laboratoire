import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Subscribe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Column(
        children: [
          Text('First time?', style: GoogleFonts.heebo(color: Color(0xff5fc9ed)),)
        ],
      ),
    );
  }
}
