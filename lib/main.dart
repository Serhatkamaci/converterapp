import 'package:convertapp/degRadConverterAppendClass.dart';
import 'package:convertapp/positionPage.dart';
import 'package:convertapp/speedPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'degradPage.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=>DegRadConverterAppendClass(),
        ),
      ],
      child: MaterialApp(
        title: 'Converter Application',
        debugShowCheckedModeBanner: false,
        home: PageView(
            children: <Widget>[
              PositionPageMain(),
              SpeedPageMain(),
              DegradPageMain(),
            ]
        ),
      ),
    );
  }
}