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
    bool isFullSize = timer.currentIntervalsTimerState() == TimerState.idle ||
            timer.currentIntervalsTimerState() == TimerState.finished
        ? true
        : false;

    return Container(
      width: MediaQuery.of(context).size.width * (isFullSize ? 0.5 : 0.2),
      decoration: BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IntervalsTimerTargets(
            intervalsTimer: timer,
            countdownTimer: CountdownNeeded.activity,
            fullSize: isFullSize,
          ),
          IntervalsTimerSeparator(
            timer: timer,
            fullSize: isFullSize,
          ),
          IntervalsTimerTargets(
            intervalsTimer: timer,
            countdownTimer: CountdownNeeded.waiting,
            fullSize: isFullSize,
          ),
        ],
      ),
    );
  }
}
