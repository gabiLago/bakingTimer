import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/models/timers_enums.dart';
import 'package:baking_timer/viewModel/intervals_timer_viewModel.dart';
import 'package:baking_timer/views/widgets/intervals_timer_edition_widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerActionButton extends StatelessWidget {
  final IntervalsTimer timer;
  TimerActionButton(this.timer);

  @override
  Widget build(BuildContext context) {
    var viewmodel =
        Provider.of<IntervalsTimerViewModel>(context, listen: false);
    Map icons = {
      TimerState.idle: {
        'icon': Icons.play_arrow,
        'color': Theme.of(context).accentColor,
        'action': () => viewmodel.runIntervalsTimer(timer),
      },
      TimerState.running: {
        'icon': Icons.pause,
        'color': Colors.orange[400],
        'action': () => viewmodel.pauseIntervalsTimer(timer),
      },
      TimerState.paused: {
        'icon': Icons.play_arrow_rounded,
        'color': Theme.of(context).accentColor,
        'action': () => viewmodel.restartIntervalsTimer(timer),
      },
      TimerState.finished: {
        'icon': Icons.history,
        'color': Theme.of(context).accentColor,
        'action': () => viewmodel.runAgainIntervalsTimer(timer),
      },
    };

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (timer.currentIntervalsTimerState() == TimerState.paused)
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            child: RoundIconButton(
              icon: Icons.close,
              onPressed: () => viewmodel.closeIntervalsTimer(timer),
              fillColor: Colors.red[400],
              width: 36,
              height: 36,
            ),
          ),
        Container(
          child: RoundIconButton(
            icon: icons[timer.currentIntervalsTimerState()]['icon'],
            fillColor: icons[timer.currentIntervalsTimerState()]['color'],
            onPressed: icons[timer.currentIntervalsTimerState()]['action'],
            width: 36,
            height: 36,
          ),
        ),
      ],
    );
  }
}
