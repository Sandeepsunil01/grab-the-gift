import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:santa/components/background_components.dart';
import 'package:santa/components/gift_components.dart';
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
    debugMode = true;
  }
}
