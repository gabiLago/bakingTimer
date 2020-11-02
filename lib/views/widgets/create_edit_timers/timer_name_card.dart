import 'package:flutter/material.dart';

class TimerNameCard extends StatelessWidget {
  final String timerName;
  final TextEditingController controller;

  TimerNameCard({this.timerName, this.controller});

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 15.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Text(timerName),
            TextField(
              controller: controller,
              autofocus: true,
            ),
          ],
        ));
  }
}
