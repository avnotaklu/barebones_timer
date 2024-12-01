import 'package:barebones_timer/timer_controller.dart';
import 'package:barebones_timer/timer_display.dart';
import 'package:barebones_timer/timer_state.dart';
import 'package:example/foundation/extensions/duration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Increment Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cs = [
    TimerController(
      duration: const Duration(seconds: 10),
      autoStart: true,
      updateInterval: const Duration(milliseconds: 100),
    ),
    TimerController(
      duration: const Duration(seconds: 10),
      autoStart: false,
      updateInterval: const Duration(milliseconds: 100),
    )
  ];

  void playMove(int p) {
    // In actual scenario you would likely have the finished state based on some custom logic
    // not by taking what's inside the controller

    if (cs[p].state == TimerState.finished) {
      // Player can't play a move if his time has ended
      return;
    }

    if (cs[p].state == TimerState.paused) {
      // Player can't play a move if it's not his turn
      return;
    }

    cs[p].pause();

    // In actual scenario you would likely have calculated the duration based on some custom logic
    // not by taking what's inside the controller

    var newDur = cs[p].duration + const Duration(seconds: 3);
    cs[p].updateDuration(newDur);
    cs[1 - p].start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimerDisplay(
                    builder: (controller) {
                      return Text(controller.duration.durationRepr());
                    },
                    controller: cs[0],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      playMove(0);
                    },
                    child: const Text('Play Move 1'),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimerDisplay(
                    builder: (controller) {
                      return Text(controller.duration.durationRepr());
                    },
                    controller: cs[1],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      playMove(1);
                    },
                    child: const Text('Play Move 1'),
                  ),
                ],
              )
            ])),
      ),
    );
  }
}
