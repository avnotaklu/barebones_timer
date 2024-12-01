/// Enum to represent the state of the timer.
enum TimerState {
  /// The timer is currently running.
  running,

  /// The timer is currently paused.
  paused,

  /// The timer has finished, still can be reset and will start running
  finished,
}
