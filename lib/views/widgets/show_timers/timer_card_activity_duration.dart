import 'package:baking_timer/models/serial_timer_model.dart';
import 'package:baking_timer/localization/localized_strings.dart';
import 'package:baking_timer/viewModel/serial_timer_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerCardActivityDuration extends StatelessWidget {
  final SerialTimer timer;
  const TimerCardActivityDuration(this.timer);

  @override
  Widget build(BuildContext context) {
    String currentLanguage =
        Provider.of<SerialTimerViewModel>(context).getCurrentLanguage();
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '${timer.activityDuration}',
            style: timer.timerState == TimerState.idle
                ? Theme.of(context).textTheme.headline1
                : Theme.of(context).textTheme.headline2,
          ),
          Text(
            localizedValues[currentLanguage]['minutes'],
            style: timer.timerState == TimerState.idle
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
