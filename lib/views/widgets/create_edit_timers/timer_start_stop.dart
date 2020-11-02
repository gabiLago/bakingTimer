import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimerStartStop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        alignment: Alignment.bottomRight,
        child: Icon(
          FontAwesomeIcons.solidPlayCircle,
          size: 36.0,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
