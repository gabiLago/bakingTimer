import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:baking_timer/models/intervals_periodic_timer_model.dart';

class TimersData extends ChangeNotifier {
  final List<IntervalsPeriodicTimer> _timers = <IntervalsPeriodicTimer>[
    IntervalsPeriodicTimer(
      activityDuration: 3,
      pauseDuration: 5,
      numberOfRepeats: 5,
      timerName: 'Pliegues',
      timerState: TimerState.stop,
    ),
    IntervalsPeriodicTimer(
      activityDuration: 10,
      pauseDuration: 15,
      numberOfRepeats: 4,
      timerName: 'Probando con dos dígitos',
      timerState: TimerState.stop,
    )
  ];

  UnmodifiableListView<IntervalsPeriodicTimer> get timers =>
      UnmodifiableListView(_timers);

  int timersCount() => _timers.length;

  void addTimer(IntervalsPeriodicTimer newTimer) {
    _timers.add(newTimer);
    print('Name: ${newTimer.timerName} Activit: ${newTimer.activityDuration}');
    notifyListeners();
  }

  void updateTimerState(IntervalsPeriodicTimer timer, TimerState state) {
    timer.timerState = state;
    notifyListeners();
  }

  void deleteTimer(IntervalsPeriodicTimer timer) {
    _timers.remove(timer);
    notifyListeners();
  }
}
