<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

This is a very barebones implementation of a timer.

## Features

- The timer ticks every `updateInterval` duration and displays the `duration` as specified by the `builder` function.
- Controller can be passed to control the timer.
- The time can be paused using `pause` and resumed using `start`.
- The timer finishes when the time reaches zero and reaches the `finished` state. It can be reset by calling `updateDuration` with a new duration and calling `start`.
- The timer state can be obtained using the `state` property.
- The timer state can be also be observed as it changes using the `stateStream` property.
- The time can be updated by passing a new `duration` to the `updateDuration` function.
- Rest you can add on your own. The package is very simple and easy to build upon.

## Getting started

Just add the package to your pubspec.yaml file and import it.

## Usage

Usage examples are in the `/example` folder.

## Additional information

This package was built for usage in turn based games.
There are no packages that do the time management properly while being very lightweight.
So i made my own.
