import 'package:flutter/material.dart';
import 'package:time_computer/constants/const.dart';
import 'package:time_computer/views/onbording_screen.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor
      ),
      home: OnBordingScreen(),
    );
  }
}
