import 'package:baking_timer/models/serial_timer_model.dart';
import 'package:baking_timer/viewModel/serial_timer_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TimerActionButton extends StatelessWidget {
  final SerialTimer timer;
  TimerActionButton(this.timer);

  @override
  Widget build(BuildContext context) {
    switch (timer.timerState) {
      case TimerState.activityRunning:
        return IconButton(
          icon: Icon(
            FontAwesomeIcons.solidPauseCircle,
            size: 42.0,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () =>
              Provider.of<SerialTimerViewModel>(context, listen: false)
                  .pauseTimer(timer),
        );
        break;

      case TimerState.pauseRunning:
        return IconButton(
          icon: Icon(
            FontAwesomeIcons.solidPauseCircle,
            size: 42.0,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () =>
              Provider.of<SerialTimerViewModel>(context, listen: false)
                  .pauseTimer(timer),
        );
        break;

      case TimerState.paused:
        return IconButton(
          icon: Icon(
            FontAwesomeIcons.redoAlt,
            size: 42.0,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () =>
              Provider.of<SerialTimerViewModel>(context, listen: false)
                  .serialTimerSwitcher(timer),
        );
        break;

      default:
        return IconButton(
          icon: Icon(
            FontAwesomeIcons.solidPlayCircle,
            size: 42.0,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () =>
              Provider.of<SerialTimerViewModel>(context, listen: false)
                  .serialTimerSwitcher(timer),
        );
        break;
    }
  }
}
