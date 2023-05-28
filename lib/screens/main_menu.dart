import 'package:flutter/material.dart';

import '../constants/globals.dart';
import '../games/gift_grab_game.dart';

class MainMenu extends StatelessWidget {
  static const String id = "Main Menu";
  final GiftGrabGame? gameRef;
  const MainMenu({Key? key, required this.gameRef}) : super(key: key);

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
                  'Gift Grab',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef!.removeMenu(MainMenu(gameRef: gameRef));
                    gameRef!.resumeEngine();
                  },
                  child: const Text(
                    'Play',
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
