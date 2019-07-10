import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import 'package:flutter/gestures.dart';

import 'controller.dart';
import 'player-ship.dart';

class BoardGame extends Game {

  Size screenSize;
  double tileSize;

  Controller controller;
  PlayerShip playerShip;

  BoardGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());

    controller = Controller(this);
    playerShip = PlayerShip(this);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.height / 9; // 9:16 ratio
  }

  @override
  void render(Canvas canvas) {
    controller.render(canvas);
    playerShip.render(canvas);
  }

  @override
  void update(double t) {
    controller.update(t);
    playerShip.update(t);
  }

  void onPanStart(DragStartDetails details) {
    controller.onPanStart(details);
  }

  void onPanUpdate(DragUpdateDetails details) {
    controller.onPanUpdate(details);
  }

  void onPanEnd(DragEndDetails details) {
    controller.onPanEnd(details);
  }

}