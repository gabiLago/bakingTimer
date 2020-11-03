import 'package:baking_timer/models/intervals_periodic_timer_model.dart';
import 'package:baking_timer/views/utils/style_and_decoration.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_card_description.dart';
import 'package:flutter/material.dart';

class TimerCardNameAndRepeatsRow extends StatelessWidget {
  const TimerCardNameAndRepeatsRow({@required this.timerData});
  final IntervalsPeriodicTimer timerData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        TimerCardDescription(timerData: timerData),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              'x ',
              style: kRepeatsLabelStyle(context),
            ),
            Text(
              '${timerData.numberOfRepeats}',
              style: kRepeatsStyle,
            ),
          ],
        ),
      ],
    );
  }
}
