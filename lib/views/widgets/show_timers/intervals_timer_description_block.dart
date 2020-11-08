import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/views/utils/style_and_decoration.dart';
import 'package:flutter/material.dart';

class IntervalsTimerDescription extends StatelessWidget {
  const IntervalsTimerDescription(this.timer);

  final IntervalsTimer timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      child: Text(
        timer.timerName,
        style: kTimerNameStyle,
      ),
    );
  }
}
