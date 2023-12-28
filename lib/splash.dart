import 'dart:async';

import 'package:e_commerce/firstScreen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget
{
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 0),() {
        Navigator.push(
          context , MaterialPageRoute(builder: (context) => FirstScreen(),)
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Welcome')),
    );
  }
}