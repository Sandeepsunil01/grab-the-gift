import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:santa/games/gift_grab_game.dart';
import 'package:santa/screens/game_over_menu.dart';
import 'package:santa/screens/main_menu.dart';

final GiftGrabGame _giftGrabName = GiftGrabGame();

class GamePlayMenu extends StatelessWidget {
  const GamePlayMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _giftGrabName,
      overlayBuilderMap: {
        GameOverMenu.id: (BuildContext context, GiftGrabGame gameRef) =>
            GameOverMenu(gameRef: gameRef),
        MainMenu.id: (BuildContext context, GiftGrabGame gameRef) =>
            MainMenu(gameRef: gameRef),
      },
    );
  }
}
