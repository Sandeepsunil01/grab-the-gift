import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:santa/components/background_components.dart';
import 'package:santa/components/gift_components.dart';
import 'package:santa/components/ice_components.dart';
import 'package:santa/components/santa_components.dart';
import 'package:santa/inputs/joysticks.dart';

import '../constants/globals.dart';

class GiftGrabGame extends FlameGame with HasCollisionDetection {
  int score = 0;
  late Timer _timer;
  int _remaining = 30;
  late TextComponent _scoreText;
  late TextComponent _timeText;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(BackgroundComponent());
    add(SantaComponent(joystick: joystickComponent));
    add(GiftComponents());
    add(joystickComponent);
    FlameAudio.audioCache.loadAll([
      Globals.itemGrabSound,
      Globals.freezeSound,
    ]);
    add(IceComponent(startPosition: Vector2(100, 100)));
    add(IceComponent(startPosition: Vector2(size.x - 100, size.y - 100)));
    add(ScreenHitbox());

    _scoreText = TextComponent(
      text: 'Score: $score',
      position: Vector2(40, 40),
      anchor: Anchor.topLeft,
      textRenderer: TextPaint(
        style: TextStyle(
          color: BasicPalette.white.color,
          fontSize: 25,
        ),
      ),
    );
    add(_scoreText);

    _timeText = TextComponent(
      text: 'Remain Time(s): $_remaining',
      position: Vector2(size.x - 40, 40),
      anchor: Anchor.topRight,
      textRenderer: TextPaint(
        style: TextStyle(
          color: BasicPalette.white.color,
          fontSize: 25,
        ),
      ),
    );
    add(_timeText);

    _timer = Timer(1, repeat: true, onTick: () {
      if (_remaining == 0) {
        pauseEngine();
      } else {
        _remaining -= 1;
      }
    });
    _timer.start();
    // debugMode = true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    _timer.update(dt);
    _scoreText.text = "Score: $score";
    _timeText.text = "Time : $_remaining sec";
  }
}
