import 'package:baking_timer/models/intervals_periodic_timer_model.dart';
import 'package:baking_timer/views/utils/style_and_decoration.dart';
import 'package:flutter/material.dart';

class TimerCardDescription extends StatelessWidget {
  const TimerCardDescription({@required this.timerData});

  final IntervalsPeriodicTimer timerData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      child: Text(
        timerData.timerName,
        style: kTimerNameStyle,
      ),
    );
  }
}
