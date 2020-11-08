import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/viewModel/serial_timer_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TimerActionButton extends StatelessWidget {
  final IntervalsTimer timer;
  TimerActionButton(this.timer);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        FontAwesomeIcons.solidPlayCircle,
        size: 42.0,
        color: Theme.of(context).accentColor,
      ),
      onPressed: () => Provider.of<SerialTimerViewModel>(context, listen: false)
          .runIntervalsTimer(timer),
    );
  }
}
