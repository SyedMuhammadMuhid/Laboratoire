import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/loading_bg.png"), fit: BoxFit.cover)),
    child: SafeArea(

    child: Scaffold(
    backgroundColor: Colors.transparent,
      body: Center(child: Image(image: AssetImage('assets/logo_blue.png'),)),
    )


    )));
  }
}
