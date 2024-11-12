import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget{

  late String data;
  late var fontWeight;
  late var color;

  TextWidget({required this.data, this.fontWeight= FontWeight.normal, this.color= Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}