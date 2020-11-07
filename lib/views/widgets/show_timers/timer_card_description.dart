import 'package:baking_timer/models/serial_timer_model.dart';
import 'package:baking_timer/views/utils/style_and_decoration.dart';
import 'package:flutter/material.dart';

class TimerCardDescription extends StatelessWidget {
  const TimerCardDescription(this.timer);

  final SerialTimer timer;

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
