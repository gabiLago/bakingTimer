import 'package:baking_timer/models/serial_timer_model.dart';
import 'package:baking_timer/views/utils/style_and_decoration.dart';
import 'package:flutter/material.dart';

class RepeatsData extends StatelessWidget {
  const RepeatsData(this.timer);
  final SerialTimer timer;

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
              timer.timerState == TimerState.idle
                  ? '${timer.numberOfRepeats}'
                  : '${timer.repeatesCount}/${timer.numberOfRepeats}',
              style: kRepeatsStyle,
            ),
          ],
        ),
      ],
    );
  }
}
