import 'package:flame/game.dart';
import 'package:santa/components/background_components.dart';
import 'package:santa/components/santa_components.dart';
import 'package:santa/inputs/joysticks.dart';

class GiftGrabGame extends FlameGame with HasDraggables {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(BackgroundComponent());
    add(SantaComponent(joystick: joystick));
    add(joystick);
  }
}
