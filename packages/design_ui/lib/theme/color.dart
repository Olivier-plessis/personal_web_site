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

  static LinearGradient tealGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Palette.teal.withOpacity(0),
      Palette.grey.withOpacity(0.8),
    ],
    stops: const <double>[0.5, 1],
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
