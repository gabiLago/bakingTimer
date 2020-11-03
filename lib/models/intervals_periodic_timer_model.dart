enum TimerState {
  running,
  stop,
  pause,
}

class IntervalsPeriodicTimer {
  final int activityDuration;
  final int pauseDuration;
  final int numberOfRepeats;
  final String timerName;
  TimerState timerState;

  IntervalsPeriodicTimer({
    this.activityDuration,
    this.pauseDuration,
    this.numberOfRepeats,
    this.timerName,
    this.timerState,
  });
}
