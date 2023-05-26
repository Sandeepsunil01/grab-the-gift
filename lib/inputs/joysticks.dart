import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/cupertino.dart';

JoystickComponent joystick = JoystickComponent(
  knob: CircleComponent(
    radius: 30,
    paint: BasicPalette.red.withAlpha(200).paint(),
  ),
  background: CircleComponent(
    radius: 100,
    paint: BasicPalette.red.withAlpha(200).paint(),
  ),
  margin: EdgeInsets.only(left: 40, bottom: 40),
);
