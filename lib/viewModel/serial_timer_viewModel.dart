import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:baking_timer/models/serial_timer_model.dart';

class SerialTimerViewModel extends ChangeNotifier {
  final List<SerialTimer> _timers = <SerialTimer>[
    SerialTimer(
      activityDuration: 1,
      pauseDuration: 1,
      numberOfRepeats: 3,
      timerName: 'Pliegues',
      timerState: TimerState.idle,
    ),
    SerialTimer(
      activityDuration: 7,
      pauseDuration: 6,
      numberOfRepeats: 4,
      timerName: 'Probando con dos dígitos',
      timerState: TimerState.idle,
    )
  ];

  String getCurrentLanguage() =>
      'en'; // TODO Language Selector, forced 'en' by the moment

  UnmodifiableListView<SerialTimer> get timers => UnmodifiableListView(_timers);

  int timersCount() => _timers.length;

  void addTimer(SerialTimer newTimer) {
    _timers.add(newTimer);
    notifyListeners();
  }

  void deleteTimer(SerialTimer timer) {
    _timers.remove(timer);
    notifyListeners();
  }

  void switchTimerState(SerialTimer timer) {
    Map<TimerState, TimerState> timerStatesSwitcher = {
      TimerState.idle: TimerState.activityRunning,
      TimerState.activityRunning: TimerState.pauseRunning,
      TimerState.pauseRunning: TimerState.activityRunning,
    };

    updateTimerState(
      timer: timer,
      timerState: timerStatesSwitcher[timer.timerState],
    );
  }

  void updateTimerState({
    SerialTimer timer,
    TimerState timerState,
  }) {
    timer.timerState = timerState;
    notifyListeners();
  }

  void serialTimerSwitcher(SerialTimer timer) {
    print('timerSwitcher');
    switchTimerState(timer);

    if (timer.numberOfRepeats - timer.repeatesCount > 0) {
      timer.repeatesCount++;
      notifyListeners();

      countdownGenerator(timer);
    } else {
      timer.periodicTimer.cancel();
      updateTimerState(timer: timer, timerState: TimerState.finished);
      print('Timer finished');
    }
  }

  void countDown(SerialTimer timer) {
    Function action;
    Function counterGetter;
    int durationTarget;

    if (timer.timerState == TimerState.activityRunning) {
      action = timer.incrementActivityCount;
      counterGetter = timer.getActivityCount;
      durationTarget = timer.activityDuration;
    }

    if (timer.timerState == TimerState.pauseRunning) {
      action = timer.incrementPauseCount;
      counterGetter = timer.getPauseCount;
      durationTarget = timer.pauseDuration;
    }

    timer.periodicTimer = Timer.periodic(
      Duration(seconds: 1),
      (countdownTimer) {
        action();
        print('Activity: $counterGetter()');
        notifyListeners();
        if (durationTarget - counterGetter() < 0) {
          countdownTimer.cancel();

          serialTimerSwitcher(timer);
        }
      },
    );
  }

  void countdownGenerator(SerialTimer timer) {
    timer.resetTimerCounters();

    timer.periodicTimer = Timer.periodic(
      Duration(seconds: 1),
      (countdownTimer) {
        if (timer.timerState == TimerState.activityRunning) {
          timer.incrementActivityCount();
          print('Activity: ${timer.getActivityCount()}');
          notifyListeners();
          if (timer.activityDuration - timer.getActivityCount() < 0) {
            countdownTimer.cancel();

            serialTimerSwitcher(timer);
          }
        } else {
          timer.incrementPauseCount();
          print('Pause: ${timer.getPauseCount()}');
          notifyListeners();
          if (timer.pauseDuration - timer.getPauseCount() < 0) {
            countdownTimer.cancel();

            serialTimerSwitcher(timer);
          }
        }
      },
    );
  }

  void pauseTimer(timer) {
    timer.periodicTimer.cancel();
    updateTimerState(
      timer: timer,
      timerState: TimerState.paused,
    );
  }
}
