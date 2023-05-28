import 'package:flutter/material.dart';
import 'package:santa/constants/globals.dart';
import 'package:santa/games/gift_grab_game.dart';
import 'package:santa/screens/main_menu.dart';

class GameOverMenu extends StatelessWidget {
  static const String id = "GameOverMenu";
  final GiftGrabGame gameRef;
  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/image/${Globals.backgroundSprite}"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'Game Over',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'Score: ${gameRef.score}',
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.removeMenu(GameOverMenu.id);
                    gameRef.resetScore();
                    gameRef.resumeEngine();
                  },
                  child: const Text(
                    'Play Again?',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.removeMenu(GameOverMenu(gameRef: gameRef));
                    gameRef.resetScore();
                    gameRef.addMenu(MainMenu(gameRef: gameRef));
                  },
                  child: const Text(
                    'Main Menu',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
