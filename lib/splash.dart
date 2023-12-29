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
      const Duration(seconds: 3),() {
        Navigator.pushReplacement(
          context , MaterialPageRoute(builder: (context) => FirstScreen(),)
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Welcome',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
    );
  }
}