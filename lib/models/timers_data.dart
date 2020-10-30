import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:baking_timer/models/intervals_timer_model.dart';

class TimersData extends ChangeNotifier {
  final List<Timer> _timers = <Timer>[
    Timer(
        activityDuration: 3,
        pauseDuration: 5,
        numberOfRepeats: 5,
        timerName: 'Pliegues'),
    Timer(
        activityDuration: 10,
        pauseDuration: 15,
        numberOfRepeats: 4,
        timerName: 'Probando con dos dígitos')
  ];

  UnmodifiableListView<Timer> get timers => UnmodifiableListView(_timers);

  int timersCount() => _timers.length;

  void addTimer(Timer newTimer) {
    _timers.add(newTimer);
    print('Name: ${newTimer.timerName} Activit: ${newTimer.activityDuration}');
    notifyListeners();
  }
}
