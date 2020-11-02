import 'package:flutter/material.dart';

ThemeData themeData = ThemeData.dark().copyWith(
  backgroundColor: Colors.grey[800],
  accentColor: Colors.orange[200],
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 48.0,
      color: Colors.grey[50],
      fontWeight: FontWeight.w300,
    ),
    bodyText1: TextStyle(
      fontSize: 12.0,
      color: Colors.grey[50],
      fontWeight: FontWeight.w300,
    ),
  ),
);
