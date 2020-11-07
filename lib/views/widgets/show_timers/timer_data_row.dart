import 'package:baking_timer/models/serial_timer_model.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_card_activity_duration.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_card_interval_separator.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_card_pause_duration.dart';
import 'package:flutter/material.dart';

class TimerDataRow extends StatelessWidget {
  final SerialTimer timer;
  TimerDataRow(this.timer);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          TimerCardActivityDuration(timer),
          TimerCardIntervalSeparator(timer),
          TimerCardPauseDuration(timer),
        ],
      ),
    );
  }
}
