import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flame/flame.dart';

import 'board-game.dart';


void main() async {
  // Force landscape device left orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft
  ]);

  // Hide status bar
  await SystemChrome.setEnabledSystemUIOverlays([]);

  Flame.images.loadAll(<String>[
    'joystick_background.png',
    'joystick_knob.png',
    'player_ship_red.png',
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  BoardGame game = BoardGame();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child:
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: game.onPanStart,
            onPanUpdate: game.onPanUpdate,
            onPanEnd: game.onPanEnd,
            child: game.widget,
          ),
      ),
    );
  }
}