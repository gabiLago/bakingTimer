import 'dart:async';

import 'package:baking_timer/models/countdown_timer_model.dart';
import 'package:baking_timer/models/timers_enums.dart';
import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:baking_timer/models/intervals_timer_model.dart';

class IntervalsTimerViewModel extends ChangeNotifier {
  final List<IntervalsTimer> _timers = <IntervalsTimer>[
    IntervalsTimer(
      activityTimer: CountdownTimer(duration: 1, name: 'Activity'),
      waitingTimer: CountdownTimer(duration: 1, name: 'Pause'),
      intervalsTarget: 3,
      timerName: 'Pliegues',
    ),
    IntervalsTimer(
      activityTimer: CountdownTimer(duration: 15, name: 'Activity'),
      waitingTimer: CountdownTimer(duration: 14, name: 'Pause'),
      intervalsTarget: 6,
      timerName: 'Probando con dos dígitos',
    )
  ];

  String getCurrentLanguage() =>
      'en'; // TODO Language Selector, forced 'en' by the moment

  UnmodifiableListView<IntervalsTimer> get timers =>
      UnmodifiableListView(_timers);

  int timersCount() => _timers.length;

  void addTimer(IntervalsTimer newTimer) {
    _timers.add(newTimer);
    notifyListeners();
  }

  void deleteTimer(IntervalsTimer timer) {
    _timers.remove(timer);
    notifyListeners();
  }

  Duration oneSec = const Duration(seconds: 1);

  Map<CountdownNeeded, CountdownNeeded> countdownTimersSwitcher = {
    CountdownNeeded.activity: CountdownNeeded.waiting,
    CountdownNeeded.waiting: CountdownNeeded.activity,
  };

  void runIntervalsTimer(IntervalsTimer timer) {
    timer.updateTimerState(TimerState.running);

    if (timer.intervalsTarget - timer.intervalsCount() > 0) {
      runCountdownTimerNeeded(timer);
    } else {
      timer.updateTimerState(TimerState.finished);
    }
    notifyListeners();
  }

  void runCountdownTimerNeeded(IntervalsTimer intervalsTimer) {
    CountdownTimer countdown = intervalsTimer.countdownTimerNeeded();

    intervalsTimer.timer = Timer.periodic(oneSec, (timer) {
      countdown.incrementCount();

      if (countdown.duration - countdown.getActualCount() <= 0) {
        if (intervalsTimer.whichCountdownNeeded() == CountdownNeeded.waiting)
          intervalsTimer
              .incrementIntervalsCount(); // Increment intervals counter only after waiting countdown has finished
        intervalsTimer.updateWhichCountdownNeeded(
          countdownTimersSwitcher[intervalsTimer
              .whichCountdownNeeded()], // Switch timer for next interval
        );
        timer.cancel(); // Stop current timer
        countdown.resetCounter(); // Reset Countdown for next interval
        runIntervalsTimer(intervalsTimer); // Run next Interval
      }
      notifyListeners();
    });
  }

  void pauseIntervalsTimer(IntervalsTimer timer) {
    timer.updateTimerState(TimerState.paused);
    timer.stopIntervalsTimer();
    notifyListeners();
  }

  void restartIntervalsTimer(IntervalsTimer timer) {
    timer.updateTimerState(TimerState.running);
    notifyListeners();
    runIntervalsTimer(timer);
  }

  void runAgainIntervalsTimer(IntervalsTimer timer) {
    timer.resetIntervalsTimerCounters();
    restartIntervalsTimer(timer);
  }

  void closeIntervalsTimer(IntervalsTimer timer) {
    timer.updateTimerState(TimerState.idle);
    timer.resetIntervalsTimerCounters();
    notifyListeners();
  }
}
