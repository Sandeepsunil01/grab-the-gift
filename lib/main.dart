import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:santa/games/gift_grab_game.dart';

void main() async {
  runApp(GameWidget(
    game: GiftGrabGame(),
  ));
}
