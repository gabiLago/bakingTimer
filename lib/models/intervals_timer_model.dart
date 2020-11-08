import 'dart:async';

import 'package:baking_timer/models/countdown_timer_model.dart';
import 'package:baking_timer/models/timers_enums.dart';

class IntervalsTimer {
  final String timerName;
  final int intervalsTarget;
  final CountdownTimer activityTimer;
  final CountdownTimer waitingTimer;
  CountdownNeeded _countdownTimerNeeded = CountdownNeeded.activity;
  int _count = 0;
  TimerState _timerState = TimerState.idle;
  Timer timer;

  IntervalsTimer({
    this.timerName,
    this.intervalsTarget,
    this.activityTimer,
    this.waitingTimer,
  });

  void incrementIntervalsCount() => _count++;
  void updateIntervalsTimerState(TimerState timerState) =>
      _timerState = timerState;
  void updateWhichCountdownNeeded(CountdownNeeded timerNeeded) =>
      _countdownTimerNeeded = timerNeeded;
  void stopIntervalsTimer() => timer.cancel();

  int getIntervalsCount() => _count;
  TimerState getIntervalsTimerState() => _timerState;
  CountdownTimer getCountdownTimerNeeded() {
    return _countdownTimerNeeded == CountdownNeeded.activity
        ? activityTimer
        : waitingTimer;
  }

  CountdownNeeded getWhichCountdownNeeded() => _countdownTimerNeeded;
}
