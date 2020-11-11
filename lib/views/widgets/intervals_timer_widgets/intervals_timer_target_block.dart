import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/localization/localized_strings.dart';
import 'package:baking_timer/models/timers_enums.dart';
import 'package:baking_timer/viewModel/intervals_timer_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntervalsTimerTargets extends StatelessWidget {
  const IntervalsTimerTargets(
      {this.intervalsTimer, this.countdownTimer, this.fullSize});

  final IntervalsTimer intervalsTimer;
  final CountdownNeeded countdownTimer;
  final bool fullSize;

  @override
  Widget build(BuildContext context) {
    String currentLanguage =
        Provider.of<IntervalsTimerViewModel>(context).getCurrentLanguage();

    return Column(
      children: <Widget>[
        Container(
          child: Text(
            countdownTimer == CountdownNeeded.activity
                ? '${intervalsTimer.activityTimer.duration}'
                : '${intervalsTimer.waitingTimer.duration}',
            style: fullSize
                ? Theme.of(context).textTheme.headline1
                : Theme.of(context).textTheme.headline2,
          ),
        ),
        Text(
          localizedValues[currentLanguage]['minutes'],
          style: fullSize
              ? Theme.of(context).textTheme.bodyText1
              : Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
