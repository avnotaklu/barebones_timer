import 'dart:async';

import 'package:barebones_timer/error.dart';
import 'package:flutter/foundation.dart';

class TimerController extends ChangeNotifier {
  void init(Duration interval) {
    if (initialized) return;
    updateInterval = interval;
    initialized = true;

    _setupTimer();
  }

  void _setupTimer() {
    assert(initialized, Errors.timerNotInitialized.message);

    _timer = Timer.periodic(updateInterval, (_) {
      updateDuration(_duration - updateInterval);
    });
  }

  Duration _duration;
  Duration get duration => Duration(milliseconds: _duration.inMilliseconds);

  bool initialized = false;
  late Timer _timer;

  late final Duration updateInterval;

  TimerController({
    required Duration duration,
  }) : _duration = duration;

  // Callbacks

  // Methods
  void pause() {
    assert(initialized, Errors.timerNotInitialized.message);
    _timer.cancel();
  }

  void start() {
    assert(initialized, Errors.timerNotInitialized.message);
    _setupTimer();
  }

  void updateDuration(Duration newDuration) {
    assert(initialized, Errors.timerNotInitialized.message);
    _duration = newDuration;

    if (duration.inMilliseconds <= 0) {
      _duration = Duration.zero;
      pause();
    } else if (!_timer.isActive) {
      _setupTimer();
    }

    notifyListeners();
  }

  // Dispose

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
