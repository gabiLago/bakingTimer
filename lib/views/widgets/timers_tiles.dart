import 'package:baking_timer/models/serial_timer_model.dart';
import 'package:baking_timer/views/utils/style_and_decoration.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_action_button.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_card_description.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_card_name_repeats_row.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_countdown.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_data_row.dart';
import 'package:flutter/material.dart';

class TimersTile extends StatelessWidget {
  final SerialTimer timer;
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
              Expanded(child: TimerCardDescription(timer)),
              RepeatsData(timer),
            ],
          ),
          Row(
            children: [
              TimerDataRow(timer),
              if (timer.timerState != TimerState.idle) TimerCountDown(timer),
              TimerActionButton(timer),
            ],
          )
        ],
      ),
    );
  }
}
