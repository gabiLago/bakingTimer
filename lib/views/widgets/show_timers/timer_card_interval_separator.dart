import 'package:baking_timer/models/intervals_periodic_timer_model.dart';
import 'package:baking_timer/utils/localized_strings.dart';
import 'package:flutter/material.dart';

class TimerCardIntervalSeparator extends StatelessWidget {
  const TimerCardIntervalSeparator(
      {@required this.currentLanguage, this.timerData});

  final String currentLanguage;
  final IntervalsPeriodicTimer timerData;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: timerData.timerState == TimerState.stop
          ? EdgeInsets.symmetric(vertical: 30.0)
          : EdgeInsets.symmetric(horizontal: 4.0),
      child: Expanded(
        child: Text(
          timerData.timerState == TimerState.stop
              ? localizedValues[currentLanguage]['interval']
              : '/',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
