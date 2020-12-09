import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PerformancesCard extends StatelessWidget {
  String logo;
  String data;
  PerformancesCard({this.logo,this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            height: 70,

            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(logo),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data, style: GoogleFonts.heebo(color:Colors.white,fontSize: 16),),
                  ),
                )
              ],
            ),
          ),
          Container(height: 2,width: 270,color: Colors.white,)
        ],
      ),
    );
  }
}
