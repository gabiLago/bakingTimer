import 'package:baking_timer/models/serial_timer_model.dart';
import 'package:baking_timer/localization/localized_strings.dart';
import 'package:baking_timer/viewModel/serial_timer_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerCardIntervalSeparator extends StatelessWidget {
  const TimerCardIntervalSeparator(this.timer);

  final SerialTimer timer;

  @override
  Widget build(BuildContext context) {
    String currentLanguage =
        Provider.of<SerialTimerViewModel>(context).getCurrentLanguage();

    return Expanded(
      flex: 1,
      child: Text(
        timer.timerState == TimerState.idle
            ? localizedValues[currentLanguage]['interval']
            : '/',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
