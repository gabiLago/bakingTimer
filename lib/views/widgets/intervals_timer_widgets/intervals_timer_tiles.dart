import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/models/timers_enums.dart';
import 'package:baking_timer/views/utils/style_and_decoration.dart';
import 'package:baking_timer/views/widgets/show_timers/intervals_timer_action_button.dart';
import 'package:baking_timer/views/widgets/show_timers/intervals_timer_description_block.dart';
import 'package:baking_timer/views/widgets/show_timers/intervals_timer_intervals_block.dart';
import 'package:baking_timer/views/widgets/show_timers/intervals_timer_countdown_block.dart';
import 'package:baking_timer/views/widgets/show_timers/intervals_timer_data_row.dart';
import 'package:flutter/material.dart';

class TimersTile extends StatelessWidget {
  final IntervalsTimer timer;
  TimersTile({this.timer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: kTimerCardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              Expanded(child: IntervalsTimerDescription(timer)),
              IntervalsTimerIntervals(timer),
            ],
          ),
          Row(
            children: [
              TimerDataRow(timer),
              if (timer.getIntervalsTimerState() != TimerState.idle)
                CountdownRow(timer),
              TimerActionButton(timer),
            ],
          )
        ],
      ),
    );
  }
}
