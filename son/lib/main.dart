import 'package:flutter/material.dart';
import 'package:multi_converter/degRadConverterAppendClass.dart';
import 'package:multi_converter/positionPage.dart';
import 'package:multi_converter/speedPage.dart';
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