import 'package:barebones_timer/timer_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class TimerDisplay extends StatefulWidget {
  final TimerController controller;
  final Duration interval;
  final Widget Function(TimerController) builder;

  const TimerDisplay({
    required this.interval,
    required this.builder,
    required this.controller,
    super.key,
  });

  @override
  State<TimerDisplay> createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<TimerDisplay> {
  @override
  void initState() {
    widget.controller.init(widget.interval);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, child) {
        return Container(
          child: widget.builder(
            widget.controller,
          ),
        );
      },
    );
  }
}
