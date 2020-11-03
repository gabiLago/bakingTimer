import 'package:baking_timer/models/intervals_periodic_timer_model.dart';
import 'package:baking_timer/models/intervals_periodic_timers_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TimerStartStop extends StatelessWidget {
  final timerData;

  TimerStartStop({this.timerData});

  IntervalsPeriodicTimer _timer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: timerData.timerState == TimerState.stop ? 6 : 11,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        alignment: timerData.timerState == TimerState.stop
            ? Alignment.centerRight
            : Alignment.topRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            timerData.timerState != TimerState.stop
                ? Text('00:00', style: Theme.of(context).textTheme.headline1)
                : Text(''),
            Container(
              padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.solidPlayCircle,
                    size: 42.0,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    Provider.of<TimersData>(context, listen: false)
                        .updateTimerState(timerData, TimerState.running);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
