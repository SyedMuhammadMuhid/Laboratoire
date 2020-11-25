import 'package:flutter/material.dart';
import 'package:sample_screen/widgets/HomeScreen.dart';
import 'package:sample_screen/widgets/MyBottomNavBar.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
