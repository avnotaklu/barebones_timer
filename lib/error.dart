class TimerError extends Error {
  final String message;

  TimerError(this.message);

  @override
  String toString() {
    return 'BTimerError: $message';
  }
}

class Errors {
  static final TimerError timerNotInitialized = TimerError(
      'TimerController has not been initialized\nInitialize the TimerController by passing to a TimerDisplay');
}
