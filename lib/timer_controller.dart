import 'dart:async';

import 'package:barebones_timer/error.dart';
import 'package:barebones_timer/timer_state.dart';
import 'package:flutter/foundation.dart';

class TimerController extends ChangeNotifier {
  void _setupTimer() {
    _timer = Timer.periodic(_updateInterval, (_) {
      updateDuration(_duration - _updateInterval);
    });
  }

  Duration _duration;
  Duration get duration => Duration(milliseconds: _duration.inMilliseconds);

  TimerState _state;
  TimerState get state => _state;
  final StreamController<TimerState> _stateController;
  late final Stream<TimerState> stateStream;

  late Timer _timer;

  final Duration _updateInterval;

  TimerController({
    required Duration duration,
    required bool autoStart,
    required Duration updateInterval,
  })  : _duration = duration,
        _updateInterval = updateInterval,
        _stateController = StreamController<TimerState>.broadcast(),
        _state = autoStart ? TimerState.running : TimerState.paused {
    stateStream = _stateController.stream;
    if (state == TimerState.running) _setupTimer();
  }

  // Callbacks

  // Methods
  void pause() {
    if (state == TimerState.paused) return;
    _updateState(TimerState.paused);

    _timer.cancel();
  }

  void start() {
    if (state == TimerState.running) return;
    _updateState(TimerState.running);

    _setupTimer();
  }

  void updateDuration(Duration newDuration) {
    _duration = newDuration;

    if (duration.inMilliseconds <= 0) {
      _duration = Duration.zero;
      _finish();
    }

    notifyListeners();
  }

  // privateMethods

  void _finish() {
    if (state == TimerState.finished) return;
    _updateState(TimerState.finished);

    _timer.cancel();
  }

  void _updateState(TimerState state) {
    _state = state;
    _stateController.add(state);
  }

  // Dispose

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
