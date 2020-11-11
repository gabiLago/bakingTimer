import 'package:flutter/material.dart';

BoxDecoration kTimerCardDecoration(context) => BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: Theme.of(context).backgroundColor);

BoxDecoration kFirstRow(context) => BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );

TextStyle kRepeatsLabelStyle(context) => TextStyle(
      fontSize: 18.0,
      color: Theme.of(context).accentColor,
    );

TextStyle kRepeatsStyle = TextStyle(
  fontSize: 28.0,
);

TextStyle kTimerNameStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.grey[50],
);
