import 'package:baking_timer/models/serial_timer_model.dart';
import 'package:baking_timer/views/utils/duration_formats_extension.dart';
import 'package:flutter/material.dart';

class TimerCountDown extends StatelessWidget {
  final SerialTimer timer;
  TimerCountDown(this.timer);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: timer.timerState == TimerState.activityRunning
          ? Text(
              '${Duration(seconds: timer.getActivityCount()).toHoursMinutesSeconds()}',
              style: Theme.of(context).textTheme.headline4,
            )
          : timer.timerState == TimerState.pauseRunning
              ? Text(
                  '${Duration(seconds: timer.getPauseCount()).toHoursMinutesSeconds()}',
                  style: Theme.of(context).textTheme.headline5,
                )
              : null,
    );
  }
}
