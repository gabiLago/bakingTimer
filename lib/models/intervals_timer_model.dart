import 'dart:async';

import 'package:baking_timer/models/countdown_timer_model.dart';
import 'package:baking_timer/models/timers_enums.dart';

class IntervalsTimer {
  final String timerName;
  final int intervalsTarget;
  final CountdownTimer activityTimer;
  final CountdownTimer waitingTimer;
  CountdownTimerNeeded _countdownTimerNeeded = CountdownTimerNeeded.activity;
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
  void updateCountdownTimerNeededOnInterval(CountdownTimerNeeded timerNeeded) =>
      _countdownTimerNeeded = timerNeeded;
  void cancelIntervalsTimer() => timer.cancel();

  int getIntervalsCount() => _count;
  TimerState getIntervalsTimerState() => _timerState;
  CountdownTimer getCountdownTimerOnInterval() {
    return _countdownTimerNeeded == CountdownTimerNeeded.activity
        ? activityTimer
        : waitingTimer;
  }

  CountdownTimerNeeded getCountdownTimerNeededOnInterval() =>
      _countdownTimerNeeded;
}
