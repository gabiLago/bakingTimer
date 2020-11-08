import 'dart:async';

import 'package:baking_timer/models/countdown_timer_model.dart';
import 'package:baking_timer/models/timers_enums.dart';
import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:baking_timer/models/intervals_timer_model.dart';

class SerialTimerViewModel extends ChangeNotifier {
  final List<IntervalsTimer> _timers = <IntervalsTimer>[
    IntervalsTimer(
      activityTimer: CountdownTimer(duration: 1, name: 'Activity'),
      waitingTimer: CountdownTimer(duration: 1, name: 'Pause'),
      intervalsTarget: 3,
      timerName: 'Pliegues',
    ),
    IntervalsTimer(
      activityTimer: CountdownTimer(duration: 5, name: 'Activity'),
      waitingTimer: CountdownTimer(duration: 4, name: 'Pause'),
      intervalsTarget: 4,
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
    CountdownNeeded.activity: CountdownNeeded.pause,
    CountdownNeeded.pause: CountdownNeeded.activity,
  };

  void runIntervalsTimer(IntervalsTimer timer) {
    timer.updateIntervalsTimerState(TimerState.running);

    if (timer.intervalsTarget - timer.getIntervalsCount() > 0) {
      timer.incrementIntervalsCount();

      runCountdownTimerNeededOnInterval(timer);
      notifyListeners();
    } else {
      timer.updateIntervalsTimerState(TimerState.finished);
    }
    notifyListeners();
  }

  void runCountdownTimerNeededOnInterval(IntervalsTimer intervalsTimer) {
    CountdownTimer countdown = intervalsTimer.getCountdownTimerNeeded();

    intervalsTimer.timer = Timer.periodic(oneSec, (timer) {
      countdown.incrementCount();

      if (countdown.duration - countdown.getActualCount() <= 0) {
        intervalsTimer.updateWhichCountdownNeeded(
          countdownTimersSwitcher[intervalsTimer.getWhichCountdownNeeded()],
        );

        timer.cancel();
        countdown.resetCounter();
        runIntervalsTimer(intervalsTimer);
      }
      notifyListeners();
    });
  }
}
