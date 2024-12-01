import 'package:barebones_timer/timer_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class TimerDisplay extends StatelessWidget {
  final TimerController controller;
  final Widget Function(TimerController) builder;

  const TimerDisplay({
    required this.builder,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Container(
          child: builder(
            controller,
          ),
        );
      },
    );
  }
}
