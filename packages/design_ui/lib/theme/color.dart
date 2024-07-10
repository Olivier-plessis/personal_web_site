import 'package:flutter/material.dart';

class Palette {
  Palette._();

  static const Color surfaceBackgroundDark = Color(0xFF1B2633);
  static const Color surfaceBackgroundLight = Color(0xFFEFF0F4);

  static const Color violet = Color(0xFFBC4EF7);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color greyDark = Color(0xFF474491);
  static const Color grey = Color(0xFF8D9BB5);

  static const Color cardBackground = Color(0xFF4F4C97);

  static LinearGradient violetGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: <Color>[
      const Color(0xFFCE74FF),
      const Color(0xFF7F58FA),
      const Color(0xFF2037F3).withOpacity(0.5),
    ],
    stops: const <double>[
      0,
      0.6,
      1,
    ],
  );
}
