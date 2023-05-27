import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:santa/components/santa_components.dart';
import 'package:santa/games/gift_grab_game.dart';

import '../constants/globals.dart';

class GiftComponents extends SpriteComponent
    with HasGameRef<GiftGrabGame>, CollisionCallbacks {
  final double _spriteHeight = 100;
  final Random random = Random();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Globals.giftSprite);
    height = width = _spriteHeight;
    position = _getRandomPosition();
    anchor = Anchor.center;
    add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is SantaComponent) {
      debugPrint("Santa Collided with gift");
      FlameAudio.play(Globals.itemGrabSound);
      removeFromParent();
      gameRef.score += 1;
      gameRef.add(GiftComponents());
    }
  }

  Vector2 _getRandomPosition() {
    double x = random.nextInt(gameRef.size.x.toInt()).toDouble();
    double y = random.nextInt(gameRef.size.y.toInt()).toDouble();
    return Vector2(x, y);
  }
}
