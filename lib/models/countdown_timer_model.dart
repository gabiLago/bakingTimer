import 'package:baking_timer/models/timers_enums.dart';

class CountdownTimer {
  CountdownTimer({this.duration, this.name});

  final int duration;
  final String name;
  int _count = 1;
  TimerState state = TimerState.idle;

  void incrementCount() => _count++;
  void resetCounter() => _count = 1;
  int getActualCount() => _count;
}
