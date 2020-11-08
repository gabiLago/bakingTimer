import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/models/timers_enums.dart';
import 'package:baking_timer/views/utils/style_and_decoration.dart';
import 'package:flutter/material.dart';

class IntervalsTimerIntervals extends StatelessWidget {
  const IntervalsTimerIntervals(this.timer);
  final IntervalsTimer timer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              'x ',
              style: kRepeatsLabelStyle(context),
            ),
            Text(
              timer.getIntervalsTimerState() == TimerState.idle
                  ? '${timer.intervalsTarget}'
                  : '${timer.getIntervalsCount()}/${timer.intervalsTarget}',
              style: kRepeatsStyle,
            ),
          ],
        ),
      ],
    );
  }
}
