import 'package:baking_timer/localization/localized_strings.dart';
import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/models/timers_enums.dart';
import 'package:baking_timer/viewModel/intervals_timer_viewModel.dart';
import 'package:baking_timer/views/utils/style_and_decoration.dart';
import 'package:baking_timer/views/widgets/intervals_timer_widgets/intervals_timer_action_button.dart';
import 'package:baking_timer/views/widgets/intervals_timer_widgets/intervals_timer_description_block.dart';
import 'package:baking_timer/views/widgets/intervals_timer_widgets/intervals_timer_intervals_block.dart';
import 'package:baking_timer/views/widgets/intervals_timer_widgets/intervals_timer_countdown_block.dart';
import 'package:baking_timer/views/widgets/intervals_timer_widgets/intervals_timer_data_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimersTile extends StatelessWidget {
  final IntervalsTimer timer;
  TimersTile({this.timer});

  @override
  Widget build(BuildContext context) {
    String currentLanguage =
        Provider.of<IntervalsTimerViewModel>(context).getCurrentLanguage();
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: kTimerCardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5, right: 10, bottom: 2.5, left: 10),
            decoration: kFirstRow(context),
            child: Row(
              children: [
                Expanded(
                  child: IntervalsTimerDescription(timer),
                ),
                IntervalsTimerIntervals(timer),
              ],
            ),
          ),
          if (timer.currentIntervalsTimerState() != TimerState.idle &&
              timer.currentIntervalsTimerState() != TimerState.finished)
            Container(
              padding:
                  EdgeInsets.only(top: 2.5, right: 10, bottom: 15, left: 10),
              child: Text(
                timer.whichCountdownNeeded() == CountdownNeeded.activity
                    ? localizedValues[currentLanguage]['activity_term']
                    : localizedValues[currentLanguage]['pause_term'],
                style: timer.whichCountdownNeeded() == CountdownNeeded.activity
                    ? Theme.of(context).textTheme.headline4
                    : Theme.of(context).textTheme.headline5,
              ),
            ),
          Container(
            padding: EdgeInsets.only(top: 2.5, right: 10, bottom: 15, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TimerDataRow(timer),
                if (timer.currentIntervalsTimerState() != TimerState.idle &&
                    timer.currentIntervalsTimerState() != TimerState.finished)
                  CountdownRow(timer),
                TimerActionButton(timer),
              ],
            ),
          )
        ],
      ),
    );
  }
}
