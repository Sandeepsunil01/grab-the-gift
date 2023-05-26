import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:santa/games/gift_grab_game.dart';

import '../constants/globals.dart';

enum MovementState {
  idle,
  slideLeft,
  slideRight,
}

class SantaComponent extends SpriteGroupComponent<MovementState>
    with HasGameRef<GiftGrabGame> {
  final double _spriteHeight = 200;
  final double _speed = 500;
  late double _rightBound;
  late double _leftBound;
  late double _upBound;
  late double _downBound;
  JoystickComponent joystick;
  SantaComponent({required this.joystick});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    Sprite santaIdle = await gameRef.loadSprite(Globals.santaIdleSprite);
    Sprite santaLeft = await gameRef.loadSprite(Globals.santaLeftSprite);
    Sprite santaRight = await gameRef.loadSprite(Globals.santaRightSprite);

    sprites = {
      MovementState.idle: santaIdle,
      MovementState.slideLeft: santaLeft,
      MovementState.slideRight: santaRight,
    };

    _rightBound = gameRef.size.x - 45;
    _leftBound = 45;
    _upBound = 55;
    _downBound = gameRef.size.y - 85;

    current = MovementState.idle;

    position = gameRef.size / 2;
    height = _spriteHeight;
    width = _spriteHeight * 1.42;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (joystick.direction == JoystickDirection.idle) {
      current = MovementState.idle;
      return;
    }
    debugPrint("Joystick Direction == ${joystick.direction}");
    if (x >= _rightBound) {
      x = x - 1;
    }
    if (x <= _leftBound) {
      x = x + 1;
    }
    if (y >= _downBound) {
      y = y - 1;
    }
    if (y <= _upBound) {
      y = y + 1;
    }
    bool movingLeft = joystick.relativeDelta[0] < 0;
    if (movingLeft) {
      current = MovementState.slideLeft;
    } else {
      current = MovementState.slideRight;
    }

    position.add(joystick.relativeDelta * _speed * dt);
    debugPrint("Position === $position, ${joystick.direction}");
  }
}
