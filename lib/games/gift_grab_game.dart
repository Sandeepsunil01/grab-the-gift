import 'package:flame/collisions.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:santa/components/background_components.dart';
import 'package:santa/components/gift_components.dart';
import 'package:santa/components/ice_components.dart';
import 'package:santa/components/santa_components.dart';
import 'package:santa/inputs/joysticks.dart';

import '../constants/globals.dart';

class GiftGrabGame extends FlameGame with HasCollisionDetection {
  int score = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(BackgroundComponent());
    add(SantaComponent(joystick: joystickComponent));
    add(GiftComponents());
    add(joystickComponent);
    FlameAudio.audioCache.loadAll([
      Globals.itemGrabSound,
    ]);
    add(IceComponent(startPosition: Vector2(100, 100)));
    add(IceComponent(startPosition: Vector2(size.x - 100, size.y - 100)));
    add(ScreenHitbox());
    // debugMode = true;
  }
}
