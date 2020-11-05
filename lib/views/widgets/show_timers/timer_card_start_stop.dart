import 'dart:async';
import 'package:baking_timer/models/intervals_periodic_timer_model.dart';
import 'package:baking_timer/viewModel/intervals_periodic_timers_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TimerStartStop extends StatefulWidget {
  final IntervalsPeriodicTimer timerData;

  TimerStartStop({this.timerData});

  @override
  _TimerStartStopState createState() => _TimerStartStopState();
}

class _TimerStartStopState extends State<TimerStartStop> {
  Timer _timer;
  int _start;
  String type = '';

  void startTimer(int time) {
    const oneSec = const Duration(seconds: 1);

    _start = time * 60;

    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void timer({int activity, int pause}) {
    bool isActivity = true;

    Duration duration =
        isActivity ? Duration(seconds: activity) : Duration(seconds: pause);

    int i = 0;

    Timer.periodic(duration, (timer) {
      if (i < widget.timerData.numberOfRepeats) {
        timer.cancel();
      }
      isActivity ? print('Ac: $activity') : print('P: $pause');
      isActivity = !isActivity;

      setState(() {
        type = isActivity ? 'a' : 'p';
      });
      i++;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.timerData.timerState == TimerState.stop ? 6 : 11,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        alignment: widget.timerData.timerState == TimerState.stop
            ? Alignment.centerRight
            : Alignment.topRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            widget.timerData.timerState != TimerState.stop
                ? Text('$type ${_printDuration(Duration(seconds: _start))}',
                    style: Theme.of(context).textTheme.headline1)
                : Text(''),
            Container(
              padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: IconButton(
                  icon: Icon(
                    widget.timerData.timerState == TimerState.stop
                        ? FontAwesomeIcons.solidPlayCircle
                        : FontAwesomeIcons.solidPauseCircle,
                    size: 42.0,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    widget.timerData.timerState == TimerState.stop
                        ? startTimer(widget.timerData.activityDuration)
                        : _timer.cancel();
                    Provider.of<TimersData>(context, listen: false)
                        .updateTimerState(widget.timerData, TimerState.running);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
