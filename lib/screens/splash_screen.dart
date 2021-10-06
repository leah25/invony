import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invony/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  static const routeName = "/splashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  void navigate() {
    Navigator.pushNamedAndRemoveUntil(
        context, HomePage.routeName, (route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/blur.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: Hero(
            tag: "icon",
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/name.png'),
            ),
          ),
        ),
      ),
    );
  }
}
