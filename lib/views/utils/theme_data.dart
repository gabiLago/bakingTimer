import 'package:flutter/material.dart';

ThemeData themeData = ThemeData.dark().copyWith(
  backgroundColor: Colors.grey[800],
  accentColor: Colors.green[400],
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 48.0,
      color: Colors.grey[50],
      fontWeight: FontWeight.w300,
    ),
    headline2: TextStyle(
      fontSize: 18.0,
      color: Colors.grey[50],
      fontWeight: FontWeight.w300,
    ),
    headline3: TextStyle(
      fontSize: 12.0,
      color: Colors.orange[200],
    ),
    headline4: TextStyle(
      fontSize: 48.0,
      color: Colors.green[400],
      fontWeight: FontWeight.w300,
    ),
    headline5: TextStyle(
      fontSize: 48.0,
      color: Colors.deepOrangeAccent[400],
      fontWeight: FontWeight.w300,
    ),
    bodyText1: TextStyle(
      fontSize: 12.0,
      color: Colors.grey[50],
      fontWeight: FontWeight.w300,
    ),
    bodyText2: TextStyle(
      fontSize: 8.0,
      color: Colors.grey[50],
      fontWeight: FontWeight.w300,
    ),
  ),
);
