import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/localization/localized_strings.dart';
import 'package:baking_timer/models/timers_enums.dart';
import 'package:baking_timer/viewModel/serial_timer_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntervalsTimerTargets extends StatelessWidget {
  const IntervalsTimerTargets({this.intervalsTimer, this.countdownTimer});

  final IntervalsTimer intervalsTimer;
  final CountdownTimerNeeded countdownTimer;

  @override
  Widget build(BuildContext context) {
    String currentLanguage =
        Provider.of<SerialTimerViewModel>(context).getCurrentLanguage();

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              countdownTimer == CountdownTimerNeeded.activity
                  ? '${intervalsTimer.activityTimer.duration}'
                  : '${intervalsTimer.waitingTimer.duration}',
              style: intervalsTimer.getIntervalsTimerState() == TimerState.idle
                  ? Theme.of(context).textTheme.headline1
                  : Theme.of(context).textTheme.headline2,
            ),
          ),
          Text(
            localizedValues[currentLanguage]['minutes'],
            style: intervalsTimer.getIntervalsTimerState() == TimerState.idle
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
