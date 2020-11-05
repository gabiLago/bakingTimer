import 'package:baking_timer/models/intervals_periodic_timer_model.dart';
import 'package:baking_timer/localization/localized_strings.dart';
import 'package:flutter/material.dart';

class TimerCardActivityDuration extends StatelessWidget {
  const TimerCardActivityDuration(
      {@required this.timerData, @required this.currentLanguage});

  final IntervalsPeriodicTimer timerData;
  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: timerData.timerState == TimerState.stop ? 3 : 1,
      child: Column(
        children: <Widget>[
          Text(
            '${timerData.activityDuration}',
            style: timerData.timerState == TimerState.stop
                ? Theme.of(context).textTheme.headline1
                : Theme.of(context).textTheme.headline2,
          ),
          Text(
            localizedValues[currentLanguage]['minutes'],
            style: timerData.timerState == TimerState.stop
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
