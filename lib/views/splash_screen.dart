import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_computer/constants/const.dart';
import 'package:time_computer/views/Auth.dart';
import 'package:time_computer/views/register_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer timer = Timer(Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>AuthScreen())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            SizedBox(height: 30.0,),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
