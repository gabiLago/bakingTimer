import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/localization/localized_strings.dart';
import 'package:baking_timer/models/timers_enums.dart';
import 'package:baking_timer/viewModel/serial_timer_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntervalsTimerSeparator extends StatelessWidget {
  const IntervalsTimerSeparator(this.timer);

  final IntervalsTimer timer;

  @override
  Widget build(BuildContext context) {
    String currentLanguage =
        Provider.of<SerialTimerViewModel>(context).getCurrentLanguage();

    return Expanded(
      flex: 1,
      child: Text(
        timer.getIntervalsTimerState() == TimerState.idle
            ? localizedValues[currentLanguage]['interval']
            : '/',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
