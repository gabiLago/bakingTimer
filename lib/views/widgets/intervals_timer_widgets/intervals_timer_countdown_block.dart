import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/models/timers_enums.dart';
import 'package:baking_timer/views/utils/duration_formats_extension.dart';
import 'package:flutter/material.dart';

class CountdownRow extends StatelessWidget {
  final IntervalsTimer timer;
  CountdownRow(this.timer);

  @override
  Widget build(BuildContext context) {
    int totalSeconds = timer.countdownTimerNeeded().getActualCount();

    return Center(
      child: Container(
        child: Text(
          '${Duration(seconds: totalSeconds).toHoursMinutesSeconds()}',
          style: timer.whichCountdownNeeded() == CountdownNeeded.activity
              ? Theme.of(context).textTheme.headline4
              : Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
