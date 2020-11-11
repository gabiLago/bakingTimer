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
  void updateTimerState(TimerState timerState) => _timerState = timerState;
  void updateWhichCountdownNeeded(CountdownNeeded timerNeeded) =>
      _countdownTimerNeeded = timerNeeded;
  void stopIntervalsTimer() => timer.cancel();
  void resetIntervalsTimerCounters() {
    _count = 0;
    activityTimer.resetCounter();
    waitingTimer.resetCounter();
  }

  int intervalsCount() => _count;
  TimerState currentIntervalsTimerState() => _timerState;
  CountdownTimer countdownTimerNeeded() {
    return _countdownTimerNeeded == CountdownNeeded.activity
        ? activityTimer
        : waitingTimer;
  }

  CountdownNeeded whichCountdownNeeded() => _countdownTimerNeeded;
}
