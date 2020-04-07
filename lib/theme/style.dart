import 'package:flutter/material.dart';


ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color(0xff0C60A5),
    primaryColorLight: Color(0xffA6C1F6),
    scaffoldBackgroundColor: Color(0xffF0F1F2),
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      body1: TextStyle(fontSize: 18.0),
    ),
  );
}
