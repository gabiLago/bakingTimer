import 'package:baking_timer/main.dart';
import 'package:baking_timer/models/intervals_periodic_timer_model.dart';
import 'package:baking_timer/utils/localized_strings.dart';
import 'package:baking_timer/views/utils/style_and_decoration.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_card_activity_duration.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_card_interval_separator.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_card_name_repeats_row.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_card_pause_duration.dart';
import 'package:baking_timer/views/widgets/show_timers/timer_card_start_stop.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimersTile extends StatelessWidget {
  final String currentLanguage = BakingTimer.currentLanguage;

  final IntervalsPeriodicTimer timerData;
  TimersTile({this.timerData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: kTimerCardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
            decoration: kNameAndRepeatesDecoration(context),
            child: TimerCardNameAndRepeatsRow(timerData: timerData),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: timerData.timerState == TimerState.stop
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                TimerCardActivityDuration(
                  timerData: timerData,
                  currentLanguage: currentLanguage,
                ),
                TimerCardIntervalSeparator(
                  currentLanguage: currentLanguage,
                  timerData: timerData,
                ),
                TimerCardPauseDuration(
                  timerData: timerData,
                  currentLanguage: currentLanguage,
                ),
                TimerStartStop(timerData: timerData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
