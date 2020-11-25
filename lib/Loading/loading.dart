import 'package:flutter/material.dart';
import 'package:sample_screen/widgets/HomeScreen.dart';

class LoadingScreen extends StatefulWidget {


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder:
                  (BuildContext context) => HomeScreen()));
    });
    return MaterialApp(
        home: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/loading_bg.png"), fit: BoxFit.cover)),

    child: Scaffold(
backgroundColor: Colors.transparent,
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Image(image: AssetImage('assets/logo_blue.png'),),
        ),
      ),
    )));
  }
}