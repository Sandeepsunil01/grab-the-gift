import 'package:flutter/material.dart';

import 'screens/game_play_menu.dart';

void main() async {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamePlayMenu(),
    ),
  );
}
