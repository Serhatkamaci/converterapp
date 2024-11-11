
import 'package:convertapp/degRadPage.dart';
import 'package:convertapp/positionPage.dart';
import 'package:convertapp/speedPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter Application',
      debugShowCheckedModeBanner: false,
      home: PageView(
        children: <Widget>[
          PositionPageMain(),
          SpeedPageMain(),
          DegradPageMain(),
          ]
        ),
    );
  }
}