import 'dart:async';

enum TimerState {
  idle,
  activityRunning,
  pauseRunning,
  paused,
  finished,
}

class SerialTimer {
  final int activityDuration;
  final int pauseDuration;
  final int numberOfRepeats;
  final String timerName;
  TimerState timerState = TimerState.idle;
  int _activityCount = 0;
  int _pauseCount = 0;
  int repeatesCount = 0;
  Timer periodicTimer;

  SerialTimer({
    this.activityDuration,
    this.pauseDuration,
    this.numberOfRepeats,
    this.timerName,
    this.timerState,
  });

  void incrementActivityCount() {
    _activityCount++;
  }

  void incrementPauseCount() {
    _pauseCount++;
  }

  void resetTimerCounters() {
    _activityCount = 0;
    _pauseCount = 0;
  }

  int getActivityCount() => _activityCount;
  int getPauseCount() => _pauseCount;
}
