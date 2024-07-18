import 'package:flutter/material.dart';

class Palette {
  Palette._();

  static const Color surfaceBackgroundDark = Color(0xFF273040);
  static const Color surfaceBackgroundLight = Color(0xFFEBF4F6);

  static const Color tealDark = Color(0xFF088395);
  static const Color tealDarkLighten = Color(0xFF35A29F);
  static const Color tealMedium = Color(0xFF37B7C3);
  static const Color teal = Color(0xFF00E5EA);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color greyDarken = Color(0xFF071952);
  static const Color greyDark = Color(0xFF071952);
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

  static LinearGradient greyGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFFC6C9CB),
      Color(0xFFA2A6BE),
    ],
    stops: <double>[
      0,
      4,
    ],
  );
}
