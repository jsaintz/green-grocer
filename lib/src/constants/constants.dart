import 'package:flutter/material.dart';

abstract class Constants {
  static const _swatchOpacity = <int, Color>{
    50: Color.fromRGBO(139, 195, 74, .1),
    100: Color.fromRGBO(139, 195, 74, .2),
    200: Color.fromRGBO(139, 195, 74, .3),
    300: Color.fromRGBO(139, 195, 74, .4),
    400: Color.fromRGBO(139, 195, 74, .5),
    500: Color.fromRGBO(139, 195, 74, .6),
    600: Color.fromRGBO(139, 195, 74, .7),
    700: Color.fromRGBO(139, 195, 74, .8),
    800: Color.fromRGBO(139, 195, 74, .9),
    900: Color.fromRGBO(139, 195, 74, 1),
  };

  static MaterialColor customSwatchColor = const MaterialColor(0xFF8BC34A, _swatchOpacity);
  static Color customContrastColor = Colors.red.shade700;
}
