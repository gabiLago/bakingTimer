import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/models/timers_enums.dart';
import 'package:baking_timer/views/widgets/intervals_timer_widgets/intervals_timer_separator_block.dart';
import 'package:baking_timer/views/widgets/intervals_timer_widgets/intervals_timer_target_block.dart';
import 'package:flutter/material.dart';

class TimerDataRow extends StatelessWidget {
  final IntervalsTimer timer;
  TimerDataRow(this.timer);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          IntervalsTimerTargets(
            intervalsTimer: timer,
            countdownTimer: CountdownNeeded.activity,
          ),
          IntervalsTimerSeparator(timer),
          IntervalsTimerTargets(
            intervalsTimer: timer,
            countdownTimer: CountdownNeeded.pause,
          ),
        ],
      ),
    );
  }
}
